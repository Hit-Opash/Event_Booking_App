import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import 'package:email_otp/email_otp.dart';

EmailOTP myauth = EmailOTP();
final FirebaseAuth _auth = FirebaseAuth.instance;

class EmailValidationScreen extends StatefulWidget {
  const EmailValidationScreen(
      {super.key,
      required this.userName,
      required this.email,
      required this.password,
      required this.otpAuth});

  final String userName;
  final String email;
  final String password;
  final EmailOTP otpAuth;

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      ))
          .user;

      if (user != null) {
        user.updateDisplayName(widget.userName);
        print(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else {
        print('not signUp');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error on server side please try after some time'),
        ));
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
    }
  }

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
                  Strings.Verify_D2 + widget.email,
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
                controller: otpController,
              ),
              SizedBox(
                height: heightBased(Space.S_44),
              ),
              CustomButton(
                lable: Strings.Continue,
                onPress: () async {
                  if (await myauth.verifyOTP(otp: otpController.text) == true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP is verified"),
                    ));
                    // _register();
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid OTP"),
                    ));
                  }
                },
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
