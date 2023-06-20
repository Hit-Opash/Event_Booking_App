import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.lable, required this.onPress});

  final String lable;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPress,
      splashColor: Colors.amber,
      child: FittedBox(
        child: Container(
          width: screenWidth * 0.8,
          height: heightBased(68),
          padding: EdgeInsets.symmetric(
              vertical: heightBased(Space.S_18),
              horizontal: widthBased(Space.S_14)),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5669FF),
                  blurRadius: heightBased(10),
                )
              ],
              color: Theme.of(context).colorScheme.primary,
              borderRadius:
                  BorderRadius.all(Radius.circular(heightBased(Space.S_16)))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                lable.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  Images.arrow,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
