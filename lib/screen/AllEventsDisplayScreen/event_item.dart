import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(heightBased(RadiusSize.R_16)),
        ),
        child: Container(
          padding: EdgeInsets.all(heightBased(Space.S_8)),
          child: Row(
            children: [
              Image(
                width: screenWidth * 0.20,
                fit: BoxFit.fill,
                image: const AssetImage(Images.event_1),
              ),
              SizedBox(
                width: heightBased(Space.S_14),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wed, Apr 28 • 5:30 PM',
                      style: TextStyle(
                          fontSize: fontPixel(FontSizes.F_13),
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(
                      height: heightBased(Space.S_4),
                    ),
                    Text(
                      'Jo Malone London’s Mother’s Day Presents',
                      style: TextStyle(fontSize: fontPixel(FontSizes.F_15)),
                    ),
                    SizedBox(
                      height: heightBased(Space.S_8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color(0xFF747688),
                          size: heightBased(16),
                        ),
                        SizedBox(
                          width: heightBased(Space.S_4),
                        ),
                        Flexible(
                          child: Text(
                            'Radius Gallery • Santa Cfruz, CA',
                            softWrap: true,
                            style: TextStyle(
                                color: const Color(0xFF747688),
                                fontSize: fontPixel(FontSizes.F_13)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
