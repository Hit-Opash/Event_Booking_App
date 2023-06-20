import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Align(
            child: Column(
              children: [
                Container(
                  height: heightBased(244),
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.event_1), fit: BoxFit.fill)),
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(
                                    Images.back,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: widthBased(Space.S_18),
                                ),
                                const Text(
                                  Strings.Event_Details,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.F_18),
                                )
                              ],
                            ),
                            Card(
                              elevation: 0.3,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(RadiusSize.R_10)),
                              color: Colors.white.withOpacity(0.1),
                              child: Container(
                                padding: EdgeInsets.all(widthBased(Space.S_6)),
                                child: const Icon(Icons.bookmark,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.8,
                  transform: Matrix4.translationValues(0, -30, 0),
                  padding: EdgeInsets.symmetric(
                      horizontal: (widthBased(Space.S_16)),
                      vertical: widthBased(Space.S_8)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 20.0), //(x,y)
                          blurRadius: 20.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular((RadiusSize.R_30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              )),
                          const Text(
                            '+20 Going',
                            style: TextStyle(
                                color: Color(0xFF3F38DD),
                                fontSize: (FontSizes.F_12),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular((RadiusSize.R_8)))),
                        child: const Text(
                          Strings.Invite,
                          style: TextStyle(
                              fontSize: (FontSizes.F_12),
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'International Band Music Concert',
                        style: TextStyle(fontSize: fontPixel(FontSizes.F_35)),
                      ),
                      SizedBox(
                        height: heightBased(Space.S_20),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(heightBased(Space.S_14)),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5D56F3).withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(RadiusSize.R_12))),
                            child: Icon(
                              Icons.event_note_sharp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(
                            width: widthBased(Space.S_10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '14 December, 2021',
                                style: TextStyle(
                                    fontSize: fontPixel(FontSizes.F_16)),
                              ),
                              SizedBox(
                                height: heightBased(Space.S_6),
                              ),
                              Text(
                                'Tuesday, 4:00PM - 9:00PM',
                                style: TextStyle(
                                    fontSize: fontPixel(FontSizes.F_12),
                                    color: const Color(0xFF747688)),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: heightBased(Space.S_14),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(heightBased(Space.S_14)),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5D56F3).withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(RadiusSize.R_12))),
                            child: Icon(
                              Icons.location_on,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(
                            width: widthBased(Space.S_10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gala Convention Center',
                                style: TextStyle(
                                    fontSize: fontPixel(FontSizes.F_16)),
                              ),
                              SizedBox(
                                height: heightBased(Space.S_6),
                              ),
                              Text(
                                '36 Guild Street London, UK ',
                                style: TextStyle(
                                    fontSize: fontPixel(FontSizes.F_12),
                                    color: Color(0xFF747688)),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: heightBased(Space.S_14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(heightBased(Space.S_14)),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF5D56F3)
                                        .withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(RadiusSize.R_12))),
                                child: Icon(
                                  Icons.person_3,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(
                                width: widthBased(Space.S_10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ashfak Sayem',
                                    style: TextStyle(
                                        fontSize: fontPixel(FontSizes.F_16)),
                                  ),
                                  SizedBox(
                                    height: heightBased(Space.S_4),
                                  ),
                                  Text(
                                    'Organizer',
                                    style: TextStyle(
                                        fontSize: fontPixel(FontSizes.F_12),
                                        color: Color(0xFF747688)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        (RadiusSize.R_10)))),
                            child: Text(
                              Strings.Invite,
                              style: TextStyle(
                                fontSize: (FontSizes.F_13),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heightBased(Space.S_20),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            Strings.About_Event,
                          ),
                          SizedBox(
                            height: heightBased(Space.S_8),
                          ),
                          Text(
                            'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
                            style: TextStyle(
                                fontSize: fontPixel(FontSizes.F_16),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: heightBased(Space.S_20),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, 0, 0),
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                    lable: Strings.Buy_Ticket, onPress: () {})),
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
      ),
    );
  }
}