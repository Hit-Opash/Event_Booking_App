import 'package:event_booking_app/model/feature.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:event_booking_app/screen/SignInScreen/signin_page.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final data = [
  FeatureModel(
      image: Images.phone_1,
      title: Strings.Feature_1_Title,
      desc: Strings.Feature_Disc),
  FeatureModel(
      image: Images.phone_2,
      title: Strings.Feature_2_Title,
      desc: Strings.Feature_Disc),
  FeatureModel(
      image: Images.phone_3,
      title: Strings.Feature_3_Title,
      desc: Strings.Feature_Disc)
];

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  int index = 0;

  void changeFeature() {
    setState(() {
      if (data.length - 1 > index) {
        index++;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FeatureView(index: index, changeFeature: changeFeature));
  }
}

class FeatureView extends StatelessWidget {
  const FeatureView(
      {super.key, required this.index, required this.changeFeature});

  final int index;
  final Function changeFeature;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            data[index].image,
            height: screenHeight * 0.6,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomDialog(
            index: index,
            changeFeature: changeFeature,
          ),
        ),
      ],
    );
  }
}

class BottomDialog extends StatelessWidget {
  const BottomDialog(
      {super.key, required this.index, required this.changeFeature});

  final int index;
  final Function changeFeature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(heightBased(RadiusSize.R_48)),
            topRight: Radius.circular(heightBased(RadiusSize.R_48))),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 12,
              blurRadius: 48),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          data[index].title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: heightBased(Space.S_18),
        ),
        Text(
          data[index].desc,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: heightBased(Space.S_44),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  )),
              child: Text(
                Strings.Skip,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.5)),
              ),
            ),
            Row(
              children: [
                for (var i = 0; i < 3; i++)
                  SizedBox(
                    width: widthBased(Space.S_12),
                    child: SvgPicture.asset(Images.dot,
                        height: heightBased(8),
                        color:
                            i != index ? Colors.white.withOpacity(0.2) : null),
                  ),
              ],
            ),
            GestureDetector(
              onTap: () => changeFeature(),
              child: Text(
                Strings.Next,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
