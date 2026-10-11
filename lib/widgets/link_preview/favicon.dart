import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Favicon extends StatelessWidget {
  final String url;
  final double size;
  final EdgeInsetsGeometry? padding;

  const Favicon({super.key, required this.url, this.size = 16, this.padding})
    : assert(size % 8 == 0, 'Size must be a multiple of 8'),
      assert(size > 0);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        final image = Image(
          image: imageProvider,
          fit: BoxFit.contain,
          height: size,
          width: size,
          filterQuality: FilterQuality.low,
          gaplessPlayback: true,
        );

        if (padding != null) {
          return Padding(padding: padding!, child: image);
        }
        return image;
      },
      imageUrl:
          "https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=$url&size=${size.toInt() * 2}",
      fit: BoxFit.contain,
      errorWidget: (context, url, error) {
        return const SizedBox.shrink();
      },
    );
  }
}
