import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(Images.profile),
            SizedBox(
              width: heightBased(Space.S_16),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rocks Velkeinjen',
                        style: TextStyle(fontSize: fontPixel(FontSizes.F_18)),
                      ),
                      Text(
                        '10 FEB',
                        style: TextStyle(
                            fontSize: fontPixel(FontSizes.F_15),
                            color: const Color(0xFFADAFBB)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightBased(Space.S_6),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFBBE47),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFBBE47),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFBBE47),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFBBE47),
                      ),
                      Icon(
                        Icons.star_half_sharp,
                        color: Color(0xFFFBBE47),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightBased(Space.S_10),
                  ),
                  Text(
                    'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
                    style: TextStyle(
                        fontSize: fontPixel(FontSizes.F_15),
                        color: Colors.black87),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
