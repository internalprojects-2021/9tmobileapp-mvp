import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/common/theme/color.dart';

class ImageNetWorkCustom extends StatelessWidget {
  final String url;
  const ImageNetWorkCustom({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            backgroundColor: OLIVE,
            strokeWidth: 2,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error));
  }

}
