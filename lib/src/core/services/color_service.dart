import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorService {
  static const String _colorCacheKeyPrefix = "color_cache_";

  static Future<Color> getColorBackgroundByUrlImage(String imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final cachedColorString =
          prefs.getString(_colorCacheKeyPrefix + imageUrl);

      if (cachedColorString != null) {
        return Color(int.parse(cachedColorString));
      }

      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        FastCachedImageProvider(imageUrl),
      );
      final Color color = paletteGenerator.dominantColor?.color ?? Colors.grey;

      await prefs.setString(
          _colorCacheKeyPrefix + imageUrl, color.value.toString());

      return color;
    } catch (e) {
      const Color color = Colors.grey;
      await prefs.setString(
          _colorCacheKeyPrefix + imageUrl, color.value.toString());
      return color;
    }
  }
}
