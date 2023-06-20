import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class EmailValidationScreen extends StatefulWidget {
  const EmailValidationScreen({super.key});

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widthBased(56),
      height: widthBased(56),
      textStyle: Theme.of(context).textTheme.headlineMedium,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(heightBased(RadiusSize.R_12)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
    );

    return Scaffold(
      body: SafeArea(
          child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: screenWidth * 0.9,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    Images.back,
                    alignment: Alignment.centerLeft,
                    height: heightBased(22),
                  ),
                ),
              ),
              SizedBox(
                height: heightBased(Space.S_22),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.Verification,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: heightBased(Space.S_12),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.Verify_D1,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.Verify_D2 + '@gmail.com',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(
                height: heightBased(Space.S_28),
              ),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                showCursor: true,
              ),
              SizedBox(
                height: heightBased(Space.S_44),
              ),
              CustomButton(
                lable: Strings.Continue,
                onPress: () {},
              ),
              SizedBox(
                height: heightBased(Space.S_24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.ReSend_Code_In,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '0.20',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
