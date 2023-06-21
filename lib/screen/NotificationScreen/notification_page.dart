import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/NotificationScreen/empty_notification.dart';
import 'package:event_booking_app/screen/NotificationScreen/request_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.Notification,
              style: TextStyle(fontSize: FontSizes.F_24),
            )),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            Images.back,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: Space.S_20),
          child: Center(
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  // RequestNotification(button: true),
                  // SizedBox(
                  //   height: Space.S_20,
                  // ),
                  // RequestNotification(button: false),
                  // SizedBox(
                  //   height: Space.S_20,
                  // ),
                  // RequestNotification(button: true),
                  EmptyNotification()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
