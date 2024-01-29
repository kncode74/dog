import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String imageDefaultUrl;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit boxFit;
  final BoxFit placeHolderBoxFit;
  final ImageWidgetBuilder? imageWidgetBuilder;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final bool isLocalImage;

  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.imageDefaultUrl,
    this.height,
    this.width,
    this.radius = 24,
    this.boxFit = BoxFit.cover,
    this.placeHolderBoxFit = BoxFit.cover,
    this.imageWidgetBuilder,
    this.placeHolder,
    this.errorWidget,
    this.isLocalImage = false,
  });

  Widget imagePlaceHolder() {
    return SvgPicture.asset(
      imageDefaultUrl,
      fit: placeHolderBoxFit,
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return imagePlaceHolder();
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: boxFit,
      imageBuilder: imageWidgetBuilder,
      imageUrl: imageUrl ?? '',
      placeholder: (context, imageUrl) => placeHolder ?? imagePlaceHolder(),
      errorWidget: (context, imageUrl, error) {
        return errorWidget ?? imagePlaceHolder();
      },
    );
  }
}
