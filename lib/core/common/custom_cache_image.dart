import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/injection/injection_container.dart';

class CustomCacheImage extends StatelessWidget {
  final String name;
  const CustomCacheImage(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: sl<SecureStorageService>().read(AppConstants.deviceToken),
      builder: (context, snap) {
        if (!snap.hasData) return const SizedBox.shrink();
        return CachedNetworkImage(
          imageUrl: sl<ApiConfig>().imageUrl(name),
          cacheKey: name,
          httpHeaders: {'Authorization': 'Bearer ${snap.data}'},
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
        );
      },
    );
  }
}
