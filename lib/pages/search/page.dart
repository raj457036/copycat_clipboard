import 'package:clipboard/pages/search/widgets/search_bar.dart';
import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/load_more_card.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/search_cubit/search_cubit.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void loadMore(BuildContext context) {
    context.read<SearchCubit>().search(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 6),
        child: Center(
          child: SearchInputBar(),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
            listenWhen: (previous, current) {
              switch (current) {
                case OfflinePersistanceDeleted() || OfflinePersistanceSaved():
                  return true;
                case _:
                  return false;
              }
            },
            listener: (context, state) {
              switch (state) {
                case OfflinePersistanceDeleted(:final item):
                  context.read<SearchCubit>().deleteItem(item);
                case OfflinePersistanceSaved(:final item):
                  context.read<SearchCubit>().put(item);
                case _:
              }
            },
          ),
          BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
              listener: (context, state) {
            switch (state) {
              case CloudPersistanceUploadingFile(:final item) ||
                    CloudPersistanceDownloadingFile(:final item):
                context.read<SearchCubit>().put(item);
                break;
            }
          }),
        ],
        child: ScaffoldBody(
          child: CanPasteBuilder(builder: (context, canPaste) {
            return BlocBuilder<SearchCubit, SearchState>(
              buildWhen: (prev, current) =>
                  current is InitialSearchState ||
                  current is SearchErrorState ||
                  current is SearchResultState,
              builder: (context, state) {
                switch (state) {
                  case InitialSearchState():
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AssetConstants.search,
                            width: 250,
                          ),
                          height16,
                          Text(context.locale.findWhateverYouLooking),
                        ],
                      ),
                    );
                  case SearchingState():
                    return const Center(child: CircularProgressIndicator());
                  case SearchErrorState(:final failure):
                    return Center(
                      child: Text(failure.message),
                    );

                  case SearchResultState(:final results, :final hasMore):
                    {
                      if (results.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetConstants.noData,
                                width: 200,
                              ),
                              height16,
                              Text(
                                context.locale.noResultsWereFound,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }

                      final hasMoreResult = hasMore ? 1 : 0;

                      return GridView.builder(
                        // primary: true,
                        padding: inset12,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: results.length + hasMoreResult,
                        itemBuilder: (context, index) {
                          if (index == results.length) {
                            return LoadMoreCard(loadMore: loadMore);
                          }

                          final item = results[index];
                          return ClipCard(
                            key: ValueKey("clipboard-item-//${item.id}"),
                            item: item,
                            canPaste: canPaste,
                          );
                        },
                      );
                    }
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
