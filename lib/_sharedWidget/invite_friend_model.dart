import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/commonWidget/text_field.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InviteFriendModel extends StatelessWidget {
  const InviteFriendModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: Space.S_34),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Strings.Invite_Friend,
                ),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                CommonTextField(
                  suffixIcon: Images.search,
                  suffixIconColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: heightBased(Space.S_34),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(Images.user_1),
                          height: widthBased(45),
                          width: widthBased(45),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: heightBased(Space.S_12),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alex Lees',
                              style: TextStyle(
                                  fontSize: widthBased(FontSizes.F_14)),
                            ),
                            Text(
                              '24 Followers',
                              style: TextStyle(
                                  color: const Color(0xFF747688),
                                  fontSize: widthBased(FontSizes.F_12)),
                            )
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(Images.Select),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: CustomButton(
                  lable: Strings.Invite,
                  onPress: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
