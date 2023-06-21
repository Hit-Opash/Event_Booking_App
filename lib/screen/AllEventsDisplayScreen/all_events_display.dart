import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/event_card.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/AllEventsDisplayScreen/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllEventsDisplayScreen extends StatelessWidget {
  const AllEventsDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                Images.back,
                fit: BoxFit.scaleDown,
              ),
            ),
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Strings.Events,
                style: TextStyle(fontSize: FontSizes.F_24),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.05),
                child: InkWell(
                  child: SvgPicture.asset(
                    Images.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: const Column(
                  children: [EventItem()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
