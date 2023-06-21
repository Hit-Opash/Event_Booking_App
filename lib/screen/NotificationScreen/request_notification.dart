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
        const Image(
          image: AssetImage(Images.user_1),
          width: 45,
          height: 45,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: Space.S_14,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'David Silbia',
                style: TextStyle(fontSize: FontSizes.F_18),
              ),
              const SizedBox(
                height: Space.S_4,
              ),
              const Text(
                'Invite Jo Malone London’s Mother’s',
                style: TextStyle(
                    fontSize: FontSizes.F_13, color: Color(0xFF3C3E56)),
              ),
              SizedBox(
                height: widthBased(Space.S_10),
              ),
              FittedBox(
                  child: button
                      ? Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthBased(Space.S_34),
                                    vertical: widthBased(Space.S_12)),
                                elevation: 0,
                                backgroundColor: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(RadiusSize.R_10),
                                    side: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color(0xFFEEEEEE))),
                              ),
                              child: const Text(
                                Strings.Reject,
                                style: TextStyle(
                                  color: Color(
                                    0xFF706D6D,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: widthBased(Space.S_14),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: widthBased(Space.S_34),
                                    vertical: widthBased(Space.S_12)),
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(RadiusSize.R_10),
                                ),
                              ),
                              child: const Text(
                                Strings.Accept,
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      : null),
            ],
          ),
        ),
        const SizedBox(
          width: Space.S_14,
        ),
        Text(
          'Just Now',
          style: TextStyle(
              fontSize: widthBased(FontSizes.F_12),
              color: const Color(0xFF3C3E56)),
        )
      ],
    );
  }
}
