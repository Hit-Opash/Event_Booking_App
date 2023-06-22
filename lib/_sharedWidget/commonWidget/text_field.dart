import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconColor});

  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? suffixIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightBased(56),
      child: TextField(
        style: TextStyle(fontSize: fontPixel(FontSizes.F_15)),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: heightBased(Space.S_18)),
            prefixIcon: prefixIcon != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      prefixIcon!,
                      height: heightBased(24),
                      width: heightBased(24),
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      suffixIcon!,
                      height: heightBased(24),
                      width: heightBased(24),
                      color: suffixIconColor,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(heightBased(RadiusSize.R_12))),
            ),
            hintText: hintText),
      ),
    );
  }
}
