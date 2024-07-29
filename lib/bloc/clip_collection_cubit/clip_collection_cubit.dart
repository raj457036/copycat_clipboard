import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/strings.dart';
import 'package:clipboard/data/repositories/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clip_collection_cubit.freezed.dart';
part 'clip_collection_state.dart';

@lazySingleton
class ClipCollectionCubit extends Cubit<ClipCollectionState> {
  final AuthCubit auth;
  final ClipCollectionRepository repo;
  final String deviceId;

  ClipCollectionCubit(
    this.auth,
    this.repo,
    @Named("device_id") this.deviceId,
  ) : super(const ClipCollectionState.initial());

  Future<void> reset() async {
    emit(const ClipCollectionState.initial());
  }

  Future<ClipCollection?> get(int id) async {
    ClipCollection? collection = state.mapOrNull(
      loaded: (loaded) => loaded.collections.findFirst((e) => e.id == id),
    );

    if (collection == null) {
      final result = await repo.get(id: id);
      result.fold((l) => logger.e(l), (r) => collection = r);
    }
    return collection;
  }

  Future<void> delete(ClipCollection collection) async {
    await state.mapOrNull(
      loaded: (loaded) async {
        emit(loaded.copyWith(isLoading: true));
        await repo.delete(
          collection.copyWith(deviceId: deviceId)..applyId(collection),
        );
        final items =
            loaded.collections.where((c) => c.id != collection.id).toList();
        final isDeleted = items.length < loaded.collections.length;
        emit(
          loaded.copyWith(
            collections: items,
            offset: isDeleted ? loaded.offset - 1 : loaded.offset,
            isLoading: false,
          ),
        );
      },
    );
  }

  Future<Failure?> upsert(ClipCollection collection) async {
    collection = collection.copyWith(deviceId: deviceId)..applyId(collection);
    final userId = auth.userId ?? kLocalUserId;

    collection = collection.copyWith(userId: userId)..applyId(collection);

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
      final result = await repo.getList(limit: 100);
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
