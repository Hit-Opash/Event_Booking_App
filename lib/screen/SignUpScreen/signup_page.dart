import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/screen/EmailValidationScreen/email_validation.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_otp/email_otp.dart';

EmailOTP otpAuth = EmailOTP();
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();

  void _register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      ))
          .user;

      if (user != null) {
        user.updateDisplayName(nameController.text);
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

  Future<String?> signInwithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final user = userCredential.user;

        if (user != null) {
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
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void sendOTP() async {
      otpAuth.setConfig(
          appEmail: "tg.opash@gmail.com",
          appName: "Event Booking App OTP",
          userEmail: emailController.text,
          otpLength: 4,
          otpType: OTPType.digitsOnly);
      if (await otpAuth.sendOTP() == true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("OTP has been sent"),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Oops, OTP send failed"),
        ));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: screenWidth * 0.9,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.Sign_Up,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: nameController,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                              Radius.circular(heightBased(RadiusSize.R_12)))),
                      errorStyle: TextStyle(
                          fontSize: fontPixel(FontSizes.F_12),
                          color: Colors.red),
                      prefixIcon: SvgPicture.asset(
                        Images.profile,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: Strings.UserName_Hint),
                  validator: ValidationBuilder().minLength(3).build(),
                ),
                // const CommonTextField(
                //   hintText: Strings.Email_Hint,
                //   prefixIcon: Images.email,
                // ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                              Radius.circular(heightBased(RadiusSize.R_12)))),
                      errorStyle: TextStyle(
                          fontSize: fontPixel(FontSizes.F_12),
                          color: Colors.red),
                      prefixIcon: SvgPicture.asset(
                        Images.email,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: Strings.Email_Hint),
                  validator: ValidationBuilder().email().build(),
                ),
                // const CommonTextField(
                //   hintText: Strings.Pass_Hint,
                //   prefixIcon: Images.password,
                //   suffixIcon: Images.eyeClose,
                // ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: passController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                              Radius.circular(heightBased(RadiusSize.R_12)))),
                      errorStyle: TextStyle(
                          fontSize: fontPixel(FontSizes.F_12),
                          color: Colors.red),
                      prefixIcon: SvgPicture.asset(
                        Images.password,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: Strings.Pass_Hint),
                  validator: ValidationBuilder().minLength(6).build(),
                ),
                // const CommonTextField(
                //   hintText: Strings.ConfirmPass_Hint,
                //   prefixIcon: Images.password,
                //   suffixIcon: Images.eyeClose,
                // ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: confirmpassController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                              Radius.circular(heightBased(RadiusSize.R_12)))),
                      errorStyle: TextStyle(
                          fontSize: fontPixel(FontSizes.F_12),
                          color: Colors.red),
                      prefixIcon: SvgPicture.asset(
                        Images.password,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: Strings.ConfirmPass_Hint),
                  autocorrect: false,
                  validator: ValidationBuilder().minLength(6).add((value) {
                    if (value != passController.text) {
                      return 'Please enter same password';
                    }
                  }).build(),
                ),

                CustomButton(
                    lable: Strings.Sign_Up,
                    onPress: () => {
                          if (_formKey.currentState!.validate())
                            {
                              // _register()
                              sendOTP(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailValidationScreen(
                                        userName: nameController.text,
                                        email: emailController.text,
                                        password: passController.text,
                                        otpAuth: otpAuth),
                                  ))
                            }
                        }),
                Text(
                  Strings.OR,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: const Color(0xFF9D9898)),
                ),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton.icon(
                    onPressed: signInwithGoogle,
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(heightBased(RadiusSize.R_12))))),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: heightBased(Space.S_18))),
                      elevation: const MaterialStatePropertyAll(1),
                    ),
                    icon: SvgPicture.asset(
                      Images.google,
                      height: heightBased(26),
                    ),
                    label: Text(
                      Strings.Login_With_Google,
                      style: Theme.of(context).textTheme.labelLarge!,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Space.S_12)))),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: heightBased(Space.S_18))),
                      elevation: const MaterialStatePropertyAll(1),
                    ),
                    icon: SvgPicture.asset(
                      Images.facebook,
                      height: heightBased(26),
                    ),
                    label: Text(
                      Strings.Login_With_Facebook,
                      style: Theme.of(context).textTheme.labelLarge!,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.Dont_Have_An_Account,
                      style: Theme.of(context).textTheme.labelMedium!,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        Strings.Sign_In,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
