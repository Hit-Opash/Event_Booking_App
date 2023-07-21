import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/_sharedWidget/invite_friend_model.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/OrganizerProfileScreen/organizer_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _invitePress() {
      showModalBottomSheet(
        // useSafeArea: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(heightBased(RadiusSize.R_30))),
        context: context,
        isScrollControlled: true,
        builder: (context) => const FractionallySizedBox(
            heightFactor: 0.9, child: InviteFriendModel()),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(bottom: heightBased(40)),
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
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: heightBased(22),
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: widthBased(Space.S_18),
                                ),
                                Text(
                                  Strings.Event_Details,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                            Card(
                              elevation: 0.3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      heightBased(RadiusSize.R_10))),
                              color: Colors.white.withOpacity(0.1),
                              child: Container(
                                padding: EdgeInsets.all(heightBased(Space.S_6)),
                                child: Icon(Icons.bookmark,
                                    size: heightBased(18), color: Colors.white),
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
                  transform: Matrix4.translationValues(0, heightBased(-30), 0),
                  padding: EdgeInsets.symmetric(
                      horizontal: (heightBased(Space.S_16)),
                      vertical: heightBased(Space.S_8)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 20.0), //(x,y)
                          blurRadius: 20.0,
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(heightBased(RadiusSize.R_30))),
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
                          Text(
                            '+20 Going',
                            style: TextStyle(
                                color: Color(0xFF3F38DD),
                                fontSize: heightBased(FontSizes.F_12),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _invitePress,
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                horizontal: heightBased(Space.S_16),
                                vertical: heightBased(Space.S_10)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    heightBased(RadiusSize.R_8)))),
                        child: Text(
                          Strings.Invite,
                          style: TextStyle(
                              fontSize: heightBased(FontSizes.F_12),
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
                                borderRadius: BorderRadius.all(Radius.circular(
                                    heightBased(RadiusSize.R_12)))),
                            child: Icon(
                              Icons.event_note_sharp,
                              size: heightBased(20),
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
                              size: heightBased(20),
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
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OrganizerProfileScreen(),
                                )),
                            child: Row(
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
                                    size: heightBased(20),
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                          ),
                          ElevatedButton(
                            onPressed: _invitePress,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: heightBased(Space.S_16),
                                    vertical: heightBased(Space.S_10)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        heightBased(RadiusSize.R_10)))),
                            child: Text(
                              Strings.Invite,
                              style: TextStyle(
                                fontSize: fontPixel(FontSizes.F_13),
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
                          Text(
                            Strings.About_Event,
                            style:
                                TextStyle(fontSize: fontPixel(FontSizes.F_18)),
                          ),
                          SizedBox(
                            height: heightBased(Space.S_8),
                          ),
                          Text(
                            'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
                            style: TextStyle(
                                fontSize: fontPixel(FontSizes.F_15),
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
