import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';

class RequestNotification extends StatelessWidget {
  const RequestNotification({super.key, required this.button});

  final bool button;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(Images.user_1),
          width: heightBased(45),
          height: heightBased(45),
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: heightBased(Space.S_14),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'David Silbia',
                style: TextStyle(fontSize: fontPixel(FontSizes.F_15)),
              ),
              SizedBox(
                height: heightBased(Space.S_4),
              ),
              Text(
                'Invite Jo Malone London’s Mother’s',
                style: TextStyle(
                    fontSize: fontPixel(FontSizes.F_12),
                    color: Color(0xFF3C3E56)),
              ),
              SizedBox(
                height: heightBased(Space.S_10),
              ),
              FittedBox(
                  child: button
                      ? Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: heightBased(Space.S_34),
                                    vertical: heightBased(Space.S_12)),
                                elevation: 0,
                                backgroundColor: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        heightBased(RadiusSize.R_10)),
                                    side: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color(0xFFEEEEEE))),
                              ),
                              child: Text(
                                Strings.Reject,
                                style: TextStyle(
                                    color: Color(
                                      0xFF706D6D,
                                    ),
                                    fontSize: fontPixel(FontSizes.F_14)),
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: heightBased(Space.S_14),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: heightBased(Space.S_34),
                                    vertical: heightBased(Space.S_12)),
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      heightBased(RadiusSize.R_10)),
                                ),
                              ),
                              child: Text(
                                Strings.Accept,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontPixel(FontSizes.F_14),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      : null),
            ],
          ),
        ),
        SizedBox(
          width: heightBased(Space.S_14),
        ),
        Text(
          'Just Now',
          style: TextStyle(
              fontSize: fontPixel(FontSizes.F_12),
              color: const Color(0xFF3C3E56)),
        )
      ],
    );
  }
}
