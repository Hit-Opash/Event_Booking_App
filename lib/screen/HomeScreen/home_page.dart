import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/create_event_model.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/appbar.dart';
import 'package:event_booking_app/_sharedWidget/event_card.dart';
import 'package:event_booking_app/model/menu.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/EventDetailsScreen/event_details_page.dart';
import 'package:event_booking_app/screen/EventsTab/events_tab.dart';
import 'package:event_booking_app/screen/MyProfileScreen/myprofile_page.dart';
import 'package:event_booking_app/screen/NotificationScreen/notification_page.dart';
import 'package:event_booking_app/screen/SignInScreen/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final user = auth.currentUser;
final typeOfEvent = [
  MenuModel(image: Images.sports, title: Strings.Sports, color: 0xFFF0635A),
  MenuModel(image: Images.music, title: Strings.Music, color: 0xFFF59762),
  MenuModel(image: Images.food, title: Strings.Food, color: 0xFF29D697),
  MenuModel(image: Images.art, title: Strings.Art, color: 0xFF46CDFB),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  int _selectedIndex = 0;
  late AnimationController _animationController;

  void initState() {
    print(user);
    _selectedIndex = 0;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventsTab(),
            ));
      } else if (index == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyProfileScreen(),
            ));
      }
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  void _createEventPress() {
    showModalBottomSheet(
      useSafeArea: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(heightBased(RadiusSize.R_30)))),
      context: context,
      isScrollControlled: true,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 0.9,
        child: CreateEventModel(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          // Related Scale and Translate values
          // print(_animationController.value.toString()); // change value between 0 and 1 and vice versa
          double slide = rightSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);

          return Stack(
            children: [
              Scaffold(
                body: Container(
                  width: screenWidth,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            // Important: Remove any padding from the ListView.
                            padding: EdgeInsets.zero,
                            children: [
                              DrawerHeader(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      height: 60,
                                      width: 60,
                                      Images.profile,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      height: heightBased(12),
                                    ),
                                    Text(
                                      'Hit Doshi',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  Strings.My_Profile,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.drawer_profile,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  // Navigator.pop(context);
                                  _toggleAnimation();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyProfileScreen(),
                                      ));
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Message,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: Badge(
                                  backgroundColor: Color(0xFFF8A85E),
                                  textColor: Colors.white,
                                  label: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: heightBased(FontSizes.F_8),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  textStyle:
                                      const TextStyle(color: Colors.amber),
                                  child: SvgPicture.asset(
                                    Images.message,
                                    height: heightBased(24),
                                    width: heightBased(24),
                                  ),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationScreen(),
                                      ));
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Calender,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.calender,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Bookmark,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.bookmark,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Contact_Us,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.contactUs,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Settings,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.setting,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.Helps_FAQs,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.helps_FQAs,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                },
                              ),
                              ListTile(
                                title: Text(
                                  Strings.SignOut,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                leading: SvgPicture.asset(
                                  Images.signout,
                                  height: heightBased(24),
                                  width: heightBased(24),
                                ),
                                onTap: () {
                                  // Update the state of the app
                                  // ...
                                  // Then close the drawer
                                  _toggleAnimation();
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const SignInPage(),
                                  //     ));
                                  _signOut();
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: heightBased(14),
                              horizontal: heightBased(14)),
                          margin: const EdgeInsets.only(left: 24),
                          decoration: BoxDecoration(
                              color: const Color(0xFF00F8FF).withOpacity(0.10),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  heightBased(RadiusSize.R_8)))),
                          child: FittedBox(
                            child: Row(children: [
                              SvgPicture.asset(Images.upgradePro),
                              SizedBox(
                                width: heightBased(12),
                              ),
                              Text(
                                Strings.UpgradePro,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: const Color(0xFF00F8FF)),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(-10, 0), blurRadius: 50, spreadRadius: 0)
                  ]),
                  child: Scaffold(
                    bottomNavigationBar: Material(
                      elevation: 1,
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        iconSize: heightBased(25),
                        selectedFontSize: fontPixel(FontSizes.F_12),
                        unselectedFontSize: fontPixel(FontSizes.F_12),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.explore),
                            label: Strings.Explore,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.event_note_sharp),
                            label: Strings.Events,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.location_on),
                            label: Strings.Map,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: Strings.Profile,
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        selectedItemColor:
                            Theme.of(context).colorScheme.primary,
                        unselectedIconTheme: IconThemeData(
                            color: const Color(0xFF200E32).withOpacity(0.2)),
                        unselectedLabelStyle: TextStyle(
                            color: const Color(0xFF200E32).withOpacity(0.2)),
                        onTap: _onItemTapped,
                      ),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.miniCenterDocked,
                    floatingActionButton: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: heightBased(50),
                        width: heightBased(50),
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: _createEventPress,
                            tooltip: 'Add Event',
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: const Icon(Icons.add_box_sharp),
                          ),
                        ),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CustomAppBar(
                                toggleAnimation: _toggleAnimation,
                                animationController: _animationController),
                            Container(
                              transform: Matrix4.translationValues(
                                  0.0, heightBased(-40), .0),
                              width: screenWidth * 0.9,
                              height: heightBased(40),
                              margin: EdgeInsets.only(top: heightBased(20)),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: typeOfEvent.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      constraints: BoxConstraints(
                                          minWidth: widthBased(106)),
                                      padding: EdgeInsets.all(
                                          heightBased(Space.S_10)),
                                      decoration: BoxDecoration(
                                          color:
                                              Color(typeOfEvent[index].color),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(heightBased(
                                                  RadiusSize.R_20)))),
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              typeOfEvent[index].image,
                                              height: heightBased(18),
                                              width: heightBased(18),
                                            ),
                                            SizedBox(
                                              width: heightBased(Space.S_8),
                                            ),
                                            Text(
                                              typeOfEvent[index].title,
                                              style: TextStyle(
                                                      fontSize: fontPixel(
                                                          FontSizes.F_15))
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  width: heightBased(Space.S_10),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    width: screenWidth * 0.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              Strings.Upcoming_Events,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Row(
                                                children: [
                                                  Text(
                                                    Strings.See_All,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            color: const Color(
                                                                0xFF747688)),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_right_rounded,
                                                    size: heightBased(30),
                                                    color:
                                                        const Color(0xFF747688),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(children: [
                                              const EventCard(),
                                              SizedBox(
                                                width: widthBased(Space.S_10),
                                              ),
                                              const EventCard(),
                                              SizedBox(
                                                width: widthBased(Space.S_10),
                                              ),
                                              const EventCard()
                                            ]),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
