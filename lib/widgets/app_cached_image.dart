import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final Widget? child;
  final Color? color;
  final BoxFit? fit;
  final bool isShadow;
  const AppCachedImage({
    Key? key,
    required this.url,
    this.borderRadius,
    this.height,
    this.shape = BoxShape.rectangle,
    this.width,
    this.child,
    this.color,
    this.fit,
    this.isShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              boxShadow: isShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: Offset(2, 5),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        blurRadius: 15,
                        offset: Offset(-2, -5),
                      ),
                    ]
                  : null,
              color: color,
              borderRadius: borderRadius,
              shape: shape,
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
            child: child,
          );
        },
        progressIndicatorBuilder: (context, url, progress) {
          return Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
              shape: shape,
              image: DecorationImage(
                image: const AssetImage("assets/images/placeholder.png"),
                fit: fit,
              ),
            ),
            child: child,
          );
        },
        imageUrl: url,
      ),
    );
  }
}
