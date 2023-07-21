import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const interast = ['Games Online', 'Concert', 'Music', 'Art', 'Movie', 'Other'];

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: heightBased(22),
              color: const Color(0xFF120D26),
            )),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Strings.Profile,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                Container(
                  width: heightBased(80),
                  height: heightBased(80),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Images.profile,
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                Text(
                  'Ashfak Sayem',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: heightBased(Space.S_10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '350',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          Strings.Following,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: const Color(0xFF747688)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: heightBased(Space.S_20),
                    ),
                    SvgPicture.asset(
                      Images.line,
                      color: const Color(0xFFDDDDDD),
                    ),
                    SizedBox(
                      width: heightBased(Space.S_20),
                    ),
                    Column(
                      children: [
                        Text(
                          '346',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          Strings.Followers,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xFF747688)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: heightBased(Space.S_20),
                            vertical: heightBased(Space.S_8)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(heightBased(RadiusSize.R_12)))),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Images.edit_profile,
                      height: heightBased(24),
                      width: heightBased(24),
                      fit: BoxFit.cover,
                    ),
                    label: Text(
                      Strings.Edit_Profile,
                      style: TextStyle(fontSize: fontPixel(FontSizes.F_16)),
                    )),
                SizedBox(
                  height: heightBased(Space.S_28),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.About_Me,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_10),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                    maxLines: 4,
                    style: Theme.of(context).textTheme.labelMedium!,
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.Interest,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          padding: EdgeInsets.symmetric(
                              vertical: heightBased(Space.S_6),
                              horizontal: heightBased(Space.S_10)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  heightBased(RadiusSize.R_14)))),
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Images.edit_pen,
                          height: heightBased(15),
                          width: heightBased(15),
                          fit: BoxFit.cover,
                        ),
                        label: Text(
                          Strings.Continue,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        )),
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_12),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: [
                      ...interast.map((text) => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: heightBased(Space.S_8),
                                horizontal: heightBased(Space.S_15)),
                            margin: EdgeInsets.all(heightBased(Space.S_6)),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    heightBased(RadiusSize.R_16)))),
                            child: Text(
                              text,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
