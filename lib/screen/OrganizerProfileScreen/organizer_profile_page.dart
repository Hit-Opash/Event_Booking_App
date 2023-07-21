import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/OrganizerProfileScreen/Review/review_list.dart';
import 'package:event_booking_app/screen/OrganizerProfileScreen/organizer_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const interast = ['Games Online', 'Concert', 'Music', 'Art', 'Movie', 'Other'];

class OrganizerProfileScreen extends StatelessWidget {
  const OrganizerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              Images.back,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                Container(
                  width: heightBased(80),
                  height: heightBased(80),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Images.profile,
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                Text(
                  'David  Silbia',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: heightBased(Space.S_10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '350',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          Strings.Following,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: const Color(0xFF747688)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: heightBased(Space.S_20),
                    ),
                    SvgPicture.asset(
                      Images.line,
                      color: const Color(0xFFDDDDDD),
                    ),
                    SizedBox(
                      width: heightBased(Space.S_20),
                    ),
                    Column(
                      children: [
                        Text(
                          '346',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          Strings.Followers,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xFF747688)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              padding: EdgeInsets.all(heightBased(Space.S_15)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          heightBased(RadiusSize.R_12)))),
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Images.profile,
                            color: Colors.white,
                          ),
                          label: const Text(
                            Strings.Follow,
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(heightBased(Space.S_15)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          heightBased(RadiusSize.R_12)))),
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Images.message,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: const Text(Strings.Message)),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_28),
                ),
                TabBar(
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: const Color(0xFF9B9B9B),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: FontSizes.F_16,
                  ),
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorWeight: 3,
                  labelStyle: TextStyle(
                      fontSize: fontPixel(FontSizes.F_16),
                      fontWeight: FontWeight.w500),
                  tabs: const [
                    Tab(
                      text: Strings.About,
                    ),
                    Tab(
                      text: Strings.Event,
                    ),
                    Tab(
                      text: Strings.Reviews,
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: heightBased(Space.S_20)),
                    child: TabBarView(children: [
                      Text(
                        'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. ',
                        style: Theme.of(context).textTheme.labelMedium!,
                      ),
                      OrganizerEvents(),
                      ReviewList(),
                    ]),
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
