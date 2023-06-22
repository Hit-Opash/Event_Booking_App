import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/screen/EmailValidationScreen/email_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              const CommonTextField(
                hintText: Strings.UserName_Hint,
                prefixIcon: Images.profile,
              ),
              const CommonTextField(
                hintText: Strings.Email_Hint,
                prefixIcon: Images.email,
              ),
              const CommonTextField(
                hintText: Strings.Pass_Hint,
                prefixIcon: Images.password,
                suffixIcon: Images.eyeClose,
              ),
              const CommonTextField(
                hintText: Strings.ConfirmPass_Hint,
                prefixIcon: Images.password,
                suffixIcon: Images.eyeClose,
              ),
              CustomButton(
                lable: Strings.Sign_Up,
                onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailValidationScreen(),
                    )),
              ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(Space.S_12)))),
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
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
