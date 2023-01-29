import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularNetworkImageWidget extends StatelessWidget {
  const CircularNetworkImageWidget(
      {super.key, required this.radius, required this.url});
  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.grey.shade400, width: 0.5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            size: radius + 20,
            color: Colors.grey,
          ),
          progressIndicatorBuilder: (context, url, progress) =>
              const CupertinoActivityIndicator(
            radius: 10,
          ),
        ),
      ),
    );
  }
}
