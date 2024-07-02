import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/core/styles/app_theme.dart.dart';
import 'package:pokemon/src/core/routes/app_pages.dart';
import 'package:pokemon/src/core/routes/app_routes.dart';

void main() async {
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.pokemonList,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
