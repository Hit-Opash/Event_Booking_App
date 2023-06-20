import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/EventDetailsScreen/event_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(heightBased(RadiusSize.R_18))),
      child: Container(
        width: widthBased(255),
        padding: EdgeInsets.all(heightBased(Space.S_10)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenWidth * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.event_1), fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 0.3,
                    margin: EdgeInsets.all(widthBased(Space.S_10)),
                    child: Container(
                      padding: EdgeInsets.all(widthBased(Space.S_6)),
                      child: FittedBox(
                        child: Column(
                          children: [
                            Text(
                              '10',
                              style: TextStyle(
                                  fontSize: fontPixel(FontSizes.F_18),
                                  color: const Color(0xFFF0635A),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'JUNE',
                              style: TextStyle(
                                  fontSize: fontPixel(FontSizes.F_18),
                                  color: const Color(0xFFF0635A),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.3,
                    margin: EdgeInsets.all(widthBased(Space.S_10)),
                    child: Container(
                      padding: EdgeInsets.all(widthBased(Space.S_4)),
                      child: const Icon(
                        Icons.bookmark,
                        color: Color(0xFFEB5757),
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventDetailsScreen(),
                  )),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: widthBased(Space.S_8)),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightBased(Space.S_10),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'International Band Muffffdkfnß',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: heightBased(Space.S_10),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(0.0, 0, 0),
                              child: Image(
                                height: widthBased(30),
                                width: widthBased(30),
                                fit: BoxFit.cover,
                                image: const AssetImage(Images.user_1),
                              ),
                            ),
                            Transform(
                                transform: Matrix4.translationValues(
                                    widthBased(-10.0), 0, 0),
                                child: Image(
                                  height: widthBased(30),
                                  width: widthBased(30),
                                  fit: BoxFit.cover,
                                  image: const AssetImage(Images.user_2),
                                )),
                            Transform(
                                transform: Matrix4.translationValues(
                                    widthBased(-20.0), 0, 0),
                                child: Image(
                                  height: widthBased(30),
                                  width: widthBased(30),
                                  fit: BoxFit.cover,
                                  image: const AssetImage(Images.user_3),
                                ))
                          ],
                        ),
                        Text(
                          '+20 Going',
                          style: TextStyle(
                              color: Color(0xFF3F38DD),
                              fontSize: heightBased(FontSizes.F_12)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightBased(Space.S_10),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF200E32).withOpacity(0.2),
                        ),
                        Flexible(
                          child: Text(
                            '36 Guild Street London, UK',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Color(0xFF200E32).withOpacity(0.6),
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
