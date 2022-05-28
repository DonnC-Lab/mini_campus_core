import 'package:flutter/material.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.widthRatio = 1.0,
    this.height = 52,
    this.isOutlined = false,
    this.radius = 12,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final double widthRatio; // button width as %age of device width size
  final double height;
  final bool isOutlined;
  final double radius;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isOutlined
            ? McAppColors.appMainShadeColor
            : McAppColors.appMainColor,
        onPrimary: isOutlined
            ? McAppColors.appMainColor
            : McAppColors.appMainShadeColor,
        side: const BorderSide(color: McAppColors.appMainColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width * widthRatio,
          height,
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              // color: isOutlined ? McAppColors.appMainColor : McAppColors.appMainShadeColor,
              color: Colors.white,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
