import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: widthBased(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Images.No_Notification,
            ),
            SizedBox(
              height: heightBased(Space.S_6),
            ),
            const Text(
              Strings.No_Notifications,
              style: TextStyle(fontSize: FontSizes.F_22),
            ),
            SizedBox(
              height: heightBased(Space.S_12),
            ),
            Text(
              Strings.No_Notifications_D1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xFF344B67),
                  fontSize: widthBased(FontSizes.F_16)),
            ),
          ],
        ),
      ),
    );
  }
}
