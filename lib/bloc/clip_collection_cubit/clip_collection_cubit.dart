import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clip_collection_cubit.freezed.dart';
part 'clip_collection_state.dart';

@lazySingleton
class ClipCollectionCubit extends Cubit<ClipCollectionState> {
  final ClipCollectionRepository repo;
  ClipCollectionCubit(
    @Named("offline") this.repo,
  ) : super(const ClipCollectionState.initial());

  ClipCollection? get(int id) {
    return state.mapOrNull(
      loaded: (loaded) => loaded.collections.findFirst((e) => e.id == id),
    );
  }

  Future<void> delete(ClipCollection collection) async {
    await state.mapOrNull(
      loaded: (loaded) async {
        await repo.delete(collection);
        emit(
          loaded.copyWith(
            collections: loaded.collections
                .where(
                  (c) => c.id != collection.id,
                )
                .toList(),
          ),
        );
      },
    );
  }

  Future<Failure?> upsert(ClipCollection collection) async {
    return await state.mapOrNull<Future<Failure?>>(loaded: (loaded) async {
      if (collection.isPersisted) {
        final updated = await repo.update(collection);
        return updated.fold(
          (l) => l,
          (r) {
            emit(
              loaded.copyWith(
                collections: loaded.collections.replaceWhere(
                  (value) => value.id == r.id,
                  r,
                ),
              ),
            );
            return null;
          },
        );
      } else {
        final created = await repo.create(collection);
        return created.fold(
          (l) => l,
          (r) {
            emit(
              loaded.copyWith(collections: [r, ...loaded.collections]),
            );
            return null;
          },
        );
      }
    });
  }

  Future<void> fetch({bool fromTop = false}) async {
    if (state is ClipCollectionInitial ||
        state is ClipCollectionError ||
        fromTop) {
      emit(const ClipCollectionState.initial());
      final result = await repo.getList();
      final next = result.fold(
        (l) => ClipCollectionState.error(l),
        (r) => ClipCollectionState.loaded(
          collections: r.results,
          hasMore: r.hasMore,
          offset: r.results.length,
        ),
      );
      emit(next);
    } else {
      final state_ = state as ClipCollectionLoaded;
      emit(state_.copyWith(isLoading: true));
      final result = await repo.getList(
        offset: state_.offset,
        limit: state_.limit,
      );

      final next = result.fold(
        (l) => ClipCollectionState.error(l),
        (r) => ClipCollectionState.loaded(
          collections: [...state_.collections, ...r.results],
          hasMore: r.hasMore,
          offset: r.results.length + state_.offset,
        ),
      );
      emit(next);
    }
  }
}
