import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/screen/AllEventsDisplayScreen/all_events_display.dart';
import 'package:event_booking_app/screen/EmailValidationScreen/email_validation.dart';
import 'package:event_booking_app/screen/EventDetailsScreen/event_details_page.dart';
import 'package:event_booking_app/screen/EventsTab/events_tab.dart';
import 'package:event_booking_app/screen/FeatureScreen/feature_page.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:event_booking_app/screen/MyProfileScreen/myprofile_page.dart';
import 'package:event_booking_app/screen/NotificationScreen/notification_page.dart';
import 'package:event_booking_app/screen/OrganizerProfileScreen/organizer_profile_page.dart';
import 'package:event_booking_app/screen/ResetPasswordScreen/reset_password.dart';
import 'package:event_booking_app/screen/SignInScreen/signin_page.dart';
import 'package:event_booking_app/screen/SignUpScreen/signup_page.dart';
import 'package:event_booking_app/screen/SplashScreen/splash_page.dart';
import 'package:event_booking_app/themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      themeMode: ThemeMode.light,
      home: _getLandingPage(),
    );
  }
}

Widget _getLandingPage() {
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashPage();
        } else if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const SignInPage();
      });
}
