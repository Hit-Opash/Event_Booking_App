import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/appbar.dart';
import 'package:event_booking_app/model/menu.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/MyProfileScreen/myprofile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
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
                            Images.common_profile_pic,
                          ),
                          Text(
                            'Ashfak Sayem',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                        Strings.My_Profile,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.drawer_profile),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyProfileScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Massage,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.message),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Calender,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.calender),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Bookmark,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.bookmark),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Contact_Us,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.contactUs),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Settings,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.setting),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.Helps_FAQs,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.helps_FQAs),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        Strings.SignOut,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading: SvgPicture.asset(Images.signout),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: heightBased(14), horizontal: 24),
                decoration: BoxDecoration(
                    color: const Color(0xFF00F8FF).withOpacity(0.20),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(RadiusSize.R_8))),
                child: Row(children: [
                  SvgPicture.asset(Images.upgradePro),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    Strings.UpgradePro,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: const Color(0xFF00F8FF)),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 1,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedIconTheme:
              IconThemeData(color: const Color(0xFF200E32).withOpacity(0.2)),
          unselectedLabelStyle:
              TextStyle(color: const Color(0xFF200E32).withOpacity(0.2)),
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
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Event',
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add_box_sharp),
        ),
      ),
      body: SizedBox(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const CustomAppBar(),
              Container(
                transform: Matrix4.translationValues(0.0, widthBased(-40), .0),
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
                        constraints: BoxConstraints(minWidth: widthBased(106)),
                        padding: EdgeInsets.all(widthBased(Space.S_10)),
                        decoration: BoxDecoration(
                            color: Color(typeOfEvent[index].color),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(RadiusSize.R_20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              typeOfEvent[index].image,
                            ),
                            SizedBox(
                              width: widthBased(Space.S_8),
                            ),
                            Text(
                              typeOfEvent[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: widthBased(Space.S_10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
