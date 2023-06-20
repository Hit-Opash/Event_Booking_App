import 'package:event_booking_app/screen/FeatureScreen/feature_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FeaturePage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/images/CommonImage/Logo.svg'),
      ),
    );
  }
}
