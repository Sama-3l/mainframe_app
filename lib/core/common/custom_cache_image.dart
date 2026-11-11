import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/config/api_config.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/injection/injection_container.dart';

class CustomCacheImage extends StatelessWidget {
  final String name;
  final bool lowerRes;
  const CustomCacheImage(this.name, {super.key, this.lowerRes = false});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: sl<SecureStorageService>().read(AppConstants.deviceToken),
      builder: (context, snap) {
        if (!snap.hasData) return const SizedBox.shrink();
        return CachedNetworkImage(
          scale: lowerRes ? 0.1 : 1,
          imageUrl: sl<ApiConfig>().imageUrl(name),
          cacheKey: name,
          httpHeaders: {'Authorization': 'Bearer ${snap.data}'},
          placeholder: (context, url) => Container(color: Colors.grey.shade700),
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
        );
      },
    );
  }
}
