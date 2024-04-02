import 'package:flutter/material.dart';

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color _darken(Color c, [int percent = 0]) {
  if (percent <= 0) return c;
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color _lighten(Color c, [int percent = 0]) {
  if (percent <= 0) return c;
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

extension ColorBrightnessExtension on Color {
  Color darker([int percent = 0, bool swap = false]) =>
      swap ? _lighten(this, percent) : _darken(this, percent);
  Color lighter([int percent = 0, bool swap = false]) =>
      swap ? _darken(this, percent) : _lighten(this, percent);
}
