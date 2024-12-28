import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Darkens the color by [amount] (0.0 to 1.0)
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Lightens the color by [amount] (0.0 to 1.0)
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Creates a true transparent color with a glossy effect.
  /// The [opacity] value ranges from 0.0 (completely transparent) to 1.0 (fully opaque).
  Color glossyTransparent(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0, "Opacity must be between 0.0 and 1.0");
    return withOpacity(opacity * 0.8 + 0.2); // Adds a slight gloss factor
  }

  /// Creates a glass-like effect by combining transparency and brightness adjustment.
  /// The [opacity] controls the transparency and [brightnessFactor] adjusts the brightness.
  Color glassEffect({double opacity = 0.5, double brightnessFactor = 0.2}) {
    assert(opacity >= 0.0 && opacity <= 1.0, "Opacity must be between 0.0 and 1.0");
    assert(brightnessFactor >= 0.0 && brightnessFactor <= 1.0, "Brightness must be between 0.0 and 1.0");
    final adjustedBrightness = Color.lerp(this, Colors.white, brightnessFactor)!;
    return adjustedBrightness.withOpacity(opacity);
  }

  /// Creates a frosted glass effect with a slight blur and transparency.
  /// [opacity] determines transparency and [frostingFactor] applies the blur-like effect.
  Color frostedEffect({double opacity = 0.5, double frostingFactor = 0.1}) {
    assert(opacity >= 0.0 && opacity <= 1.0, "Opacity must be between 0.0 and 1.0");
    assert(frostingFactor >= 0.0 && frostingFactor <= 1.0, "Frosting factor must be between 0.0 and 1.0");
    final frostedColor = Color.lerp(this, Colors.grey.shade200, frostingFactor)!;
    return frostedColor.withOpacity(opacity);
  }

  /// Combines a glossy and frosted effect for a more vivid glass-like look.
  Color glossyFrosted({double opacity = 0.5, double glossFactor = 0.3}) {
    return frostedEffect(opacity: opacity).glossyTransparent(glossFactor);
  }
}

