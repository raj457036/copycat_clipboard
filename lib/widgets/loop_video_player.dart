import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class LoopVideoPlayer extends StatefulWidget {
  final String url;
  final double width;
  final double? height;
  final double aspectRatio;
  final BorderRadius? borderRadius;
  final bool mute;
  final bool loop;

  const LoopVideoPlayer({
    super.key,
    required this.url,
    required this.width,
    this.height,
    this.aspectRatio = 16 / 9,
    this.borderRadius,
    this.mute = true,
    this.loop = true,
  });

  @override
  State<LoopVideoPlayer> createState() => _LoopVideoPlayerState();
}

class _LoopVideoPlayerState extends State<LoopVideoPlayer> {
  late final player = Player();
  late final controller = VideoController(player);

  bool loading = true;

  @override
  void initState() {
    super.initState();
    listenForFrame();
    player.open(Media(widget.url));
    if (widget.mute) {
      player.setVolume(0);
    }

    if (widget.loop) player.setPlaylistMode(PlaylistMode.loop);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> listenForFrame() async {
    try {
      await controller.waitUntilFirstFrameRendered;
    } catch (e) {
      showFailureSnackbar(Failure.fromException(e));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget video = Video(
      controller: controller,
      width: widget.width,
      height: widget.height ?? widget.width / widget.aspectRatio,
      aspectRatio: widget.aspectRatio,
      controls: (state) => SizedBox.shrink(),
      pauseUponEnteringBackgroundMode: true,
      resumeUponEnteringForegroundMode: true,
    );
    if (widget.borderRadius != null) {
      video = ClipRRect(borderRadius: widget.borderRadius!, child: video);
    }
    if (loading) {
      return SizedBox(
        width: widget.width,
        height: widget.height ?? widget.width / widget.aspectRatio,
        child: Card.filled(
          shape: widget.borderRadius != null
              ? RoundedRectangleBorder(borderRadius: widget.borderRadius!)
              : null,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return video;
  }
}
