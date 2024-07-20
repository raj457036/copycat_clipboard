import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/constants/numbers/file_sizes.dart';

class PlanFeatures {
  final int maxSyncCount;
  final int maxCollection;
  final int maxClipsPerCollection;
  final int maxAutoSyncFrequency;
  final int maxAutoSyncFileSize;

  const PlanFeatures({
    required this.maxSyncCount,
    required this.maxCollection,
    required this.maxClipsPerCollection,
    required this.maxAutoSyncFrequency,
    required this.maxAutoSyncFileSize,
  });
}

const freePlan = PlanFeatures(
  maxSyncCount: 100,
  maxCollection: 2,
  maxClipsPerCollection: 10,
  maxAutoSyncFrequency: $20S,
  maxAutoSyncFileSize: $20MB,
);
