import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/AllEventsDisplayScreen/all_events_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.Events,
              style: TextStyle(fontSize: heightBased(FontSizes.F_24)),
            ),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: heightBased(22),
                color: const Color(0xFF120D26),
              )),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              padding: EdgeInsets.only(top: heightBased(Space.S_20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_literals_to_create_immutables
                  Container(
                    height: heightBased(50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((heightBased(100))),
                        color: Colors.grey.shade200),
                    child: TabBar(
                      padding: const EdgeInsets.all(Space.S_4),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(heightBased(20)),
                      ),
                      unselectedLabelColor: const Color(0xFF9B9B9B),
                      labelColor: Theme.of(context).colorScheme.primary,
                      labelStyle:
                          TextStyle(fontSize: heightBased(FontSizes.F_15)),
                      tabs: const [
                        Tab(
                          text: Strings.UPCOMING,
                        ),
                        Tab(
                          text: Strings.PAST_EVENTS,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        child: TabBarView(children: [
                          Column(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Images.No_Event,
                                        width: screenWidth * 0.4,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        height: heightBased(Space.S_28),
                                      ),
                                      Center(
                                        child: Text(
                                          Strings.No_Upcoming_Event,
                                          style: TextStyle(
                                              fontSize:
                                                  heightBased(FontSizes.F_24)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightBased(Space.S_20),
                                      ),
                                      Center(
                                        child: SizedBox(
                                          width: screenWidth * 0.50,
                                          child: Text(
                                            Strings.Events_D1,
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Color(0xFF747688),
                                                fontSize: heightBased(
                                                    FontSizes.F_16)),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: heightBased(20),
                                    left: screenWidth * 0.1,
                                    right: screenWidth * 0.1),
                                child: CustomButton(
                                    lable: Strings.Explore_Events,
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AllEventsDisplayScreen(),
                                          ));
                                    }),
                              ),
                            ],
                          ),
                          const Text('data2'),
                          // MyPostTab(),
                          // MyReelsTab(),
                          // MyTagTab(),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
