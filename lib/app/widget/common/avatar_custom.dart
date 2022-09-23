import 'package:flutter_svg/svg.dart';

import '../../core/styles/style.dart';
import '../../core/utilities/utilities.dart';

class AvatarCustom extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final double size;
  final VoidCallback? onTap;

  const AvatarCustom(
    this.imageUrl, {
    this.radius = 4.0,
    this.size = 25,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        child: Container(
          width: size,
          height: size,
          margin: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          clipBehavior: Clip.antiAlias,
          child: imageUrl == null || imageUrl == ''
              ? Padding(
                  padding: EdgeInsets.all(2.w),
                  child: SvgPicture.asset(
                    AppImage.userAvt,
                    width: size,
                    height: size,
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Padding(
                    padding: EdgeInsets.all(2.w),
                    child: SvgPicture.asset(
                      AppImage.userAvt,
                      width: size,
                      height: size,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
