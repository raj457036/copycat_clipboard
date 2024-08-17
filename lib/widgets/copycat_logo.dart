import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:flutter/material.dart';

class Copycat extends StatelessWidget {
  const Copycat({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetConstants.catImage,
      semanticLabel: "CopyCat Logo",
      fit: BoxFit.cover,
      width: 40,
      height: 40,
      alignment: Alignment.topCenter,
    );
  }
}
