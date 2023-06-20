import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key, this.hintText, this.prefixIcon, this.suffixIcon});

  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? SvgPicture.asset(
                  prefixIcon!,
                  fit: BoxFit.scaleDown,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? SvgPicture.asset(
                  suffixIcon!,
                  fit: BoxFit.scaleDown,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(heightBased(RadiusSize.R_12))),
          ),
          hintText: hintText),
    );
  }
}
