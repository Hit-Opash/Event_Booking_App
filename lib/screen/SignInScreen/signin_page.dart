import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:event_booking_app/screen/SignUpScreen/signup_page.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController(text: 'opash123#');
  final emailController = TextEditingController(text: 'td.opash@gmail.com');

  void _signIn() async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      ))
          .user;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          Images.logoIcon,
                          height: heightBased(60),
                        ),
                        Text(
                          Strings.EventHub,
                          style: Theme.of(context).textTheme.headlineLarge,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: Text(
                          Strings.Sign_In,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // const CommonTextField(
                      //   hintText: Strings.UserName_Hint,
                      //   prefixIcon: Images.profile,
                      // ),
                      // const CommonTextField(
                      //   hintText: Strings.Pass_Hint,
                      //   prefixIcon: Images.password,
                      //   suffixIcon: Images.eyeClose,
                      // ),
                      TextFormField(
                        // hintText: Strings.UserName_Hint,
                        // prefixIcon: Images.profile,
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  heightBased(RadiusSize.R_12))),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    heightBased(RadiusSize.R_12)))),
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
                              borderRadius: BorderRadius.all(Radius.circular(
                                  heightBased(RadiusSize.R_12))),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    heightBased(RadiusSize.R_12)))),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: Switch(
                                  // This bool value toggles the switch.

                                  value: true,
                                  activeColor:
                                      Theme.of(context).colorScheme.primary,
                                  onChanged: (bool value) {
                                    // This is called when the user toggles the switch.
                                  },
                                ),
                              ),
                              Text(
                                Strings.Remember_Me,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Text(
                            Strings.Forgot_Password,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      CustomButton(
                          lable: Strings.Sign_In,
                          onPress: () => {
                                if (_formKey.currentState!.validate())
                                  {_signIn()}
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
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            heightBased(RadiusSize.R_12))))),
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.white),
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
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            heightBased(RadiusSize.R_12))))),
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.white),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: Text(
                              Strings.Sign_Up,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
