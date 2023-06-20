import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
                  Strings.Reset_Password,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: heightBased(Space.S_12),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.Reset_Password_D,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(
                height: heightBased(Space.S_28),
              ),
              const CommonTextField(
                hintText: Strings.Email_Hint,
                prefixIcon: Images.email,
              ),
              SizedBox(
                height: heightBased(Space.S_44),
              ),
              CustomButton(
                lable: Strings.Send,
                onPress: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
