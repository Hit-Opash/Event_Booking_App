import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/filtter_event_model.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    void _filtterEventPress() {
      showModalBottomSheet(
        useSafeArea: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(heightBased(RadiusSize.R_30)))),
        context: context,
        isScrollControlled: true,
        builder: (context) => const FractionallySizedBox(
          heightFactor: 0.9,
          child: FiltterEventModel(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: widthBased(Space.S_50)),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(RadiusSize.R_40),
              bottomRight: Radius.circular(RadiusSize.R_40))),
      child: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: SvgPicture.asset(
                        Images.drawerBar,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          Strings.Current_Location,
                          style: TextStyle(fontSize: 12)
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'New Yourk, USA',
                          style: TextStyle(fontSize: 13).copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    InkWell(
                        child: SvgPicture.asset(
                      Images.notification,
                      fit: BoxFit.scaleDown,
                    ))
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Images.search),
                        SizedBox(
                          width: widthBased(Space.S_15),
                        ),
                        SvgPicture.asset(Images.line),
                        SizedBox(
                          width: widthBased(Space.S_8),
                        ),
                        Text(
                          Strings.Search,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white.withOpacity(0.3)),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(heightBased(Space.S_6)),
                      decoration: const BoxDecoration(
                          color: Color(0xFF5D56F3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(RadiusSize.R_48))),
                      child: InkWell(
                        onTap: _filtterEventPress,
                        child: (Row(
                          children: [
                            SvgPicture.asset(Images.filter),
                            SizedBox(
                              width: widthBased(Space.S_4),
                            ),
                            Text(
                              Strings.Filters,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
