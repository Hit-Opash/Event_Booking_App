import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/screen/EmailValidationScreen/email_validation.dart';
import 'package:event_booking_app/screen/FeatureScreen/feature_page.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:event_booking_app/screen/MyProfileScreen/myprofile_page.dart';
import 'package:event_booking_app/screen/ResetPasswordScreen/reset_password.dart';
import 'package:event_booking_app/screen/SignInScreen/signin_page.dart';
import 'package:event_booking_app/screen/SignUpScreen/signup_page.dart';
import 'package:event_booking_app/screen/SplashScreen/splash_page.dart';
import 'package:event_booking_app/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventBookingApp());
}

class EventBookingApp extends StatelessWidget {
  const EventBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScalingFactors(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.lightThemeData,
      home: const SplashPage(),
    );
  }
}
