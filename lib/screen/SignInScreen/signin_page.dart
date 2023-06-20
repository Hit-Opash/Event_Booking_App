import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/HomeScreen/home_page.dart';
import 'package:event_booking_app/screen/SignUpScreen/signup_page.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                    SizedBox(
                        height: heightBased(60),
                        child: const CommonTextField(
                          hintText: Strings.UserName_Hint,
                          prefixIcon: Images.profile,
                        )),
                    SizedBox(
                        height: heightBased(60),
                        child: const CommonTextField(
                          hintText: Strings.Pass_Hint,
                          prefixIcon: Images.password,
                          suffixIcon: Images.eyeClose,
                        )),
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
                        onPress: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ))),
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
                                    builder: (context) => const SignUpPage()));
                          },
                          child: Text(
                            Strings.Sign_Up,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
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
    );
  }
}
