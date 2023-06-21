import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiltterEventModel extends StatefulWidget {
  const FiltterEventModel({super.key});

  @override
  State<FiltterEventModel> createState() => _FiltterEventModelState();
}

RangeValues _currentRangeValues = const RangeValues(50, 150);

class _FiltterEventModelState extends State<FiltterEventModel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: Space.S_34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.Filters,
              style: TextStyle(fontSize: widthBased(FontSizes.F_24)),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(top: 24, left: 10, right: 10),
                child: Row(children: [
                  ListOfFillterOption(),
                  SizedBox(
                    width: 20,
                  ),
                  ListOfFillterOption(),
                  SizedBox(
                    width: 20,
                  ),
                  ListOfFillterOption(),
                  SizedBox(
                    width: 20,
                  ),
                  ListOfFillterOption(),
                  SizedBox(
                    width: 20,
                  ),
                  ListOfFillterOption()
                ]),
              ),
            ),
            const SizedBox(
              height: Space.S_24,
            ),
            Text(
              Strings.Time_Date,
              style: TextStyle(fontSize: widthBased(FontSizes.F_16)),
            ),
            const SizedBox(
              height: Space.S_14,
            ),
            FittedBox(
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthBased(Space.S_20),
                          vertical: widthBased(Space.S_10)),
                      elevation: 0,
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiusSize.R_10),
                          side: const BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFFEEEEEE))),
                    ),
                    child: Text(
                      Strings.Today,
                      style: TextStyle(
                          color: const Color(
                            0xFF706D6D,
                          ),
                          fontSize: widthBased(FontSizes.F_15)),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: widthBased(Space.S_12),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthBased(Space.S_20),
                          vertical: widthBased(Space.S_10)),
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RadiusSize.R_10),
                      ),
                    ),
                    child: Text(
                      Strings.Tomorrow,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widthBased(FontSizes.F_15)),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: widthBased(Space.S_12),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthBased(Space.S_20),
                          vertical: widthBased(Space.S_10)),
                      elevation: 0,
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiusSize.R_10),
                          side: const BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFFEEEEEE))),
                    ),
                    child: Text(
                      Strings.This_Week,
                      style: TextStyle(
                          color: const Color(
                            0xFF706D6D,
                          ),
                          fontSize: widthBased(FontSizes.F_15)),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Space.S_24,
            ),
            FittedBox(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(RadiusSize.R_12),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFEEEEEE)),
                      borderRadius: BorderRadius.circular(RadiusSize.R_12)),
                  padding: EdgeInsets.symmetric(
                      horizontal: widthBased(Space.S_10),
                      vertical: widthBased(Space.S_14)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.event_note_sharp,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: widthBased(Space.S_6),
                      ),
                      Text(
                        Strings.Choose_From_Calender,
                        style: TextStyle(
                            fontSize: widthBased(FontSizes.F_15),
                            color: Color(0xFF807A7A)),
                      ),
                      SizedBox(
                        width: widthBased(Space.S_6),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Space.S_24,
            ),
            Text(
              Strings.Location,
              style: TextStyle(fontSize: widthBased(FontSizes.F_16)),
            ),
            const SizedBox(
              height: Space.S_14,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(RadiusSize.R_12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(RadiusSize.R_12)),
                padding: EdgeInsets.symmetric(
                    horizontal: widthBased(Space.S_10),
                    vertical: widthBased(Space.S_14)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(widthBased(Space.S_8)),
                      decoration: BoxDecoration(
                          color: const Color(0xFF5D56F3).withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(RadiusSize.R_12))),
                      child: Container(
                        padding: EdgeInsets.all(widthBased(Space.S_6)),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(RadiusSize.R_12))),
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthBased(Space.S_6),
                    ),
                    Text(
                      'New Yourk, USA',
                      style: TextStyle(
                        fontSize: widthBased(FontSizes.F_16),
                      ),
                    ),
                    SizedBox(
                      width: widthBased(Space.S_6),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: Space.S_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.Select_Price_Range,
                  style: TextStyle(fontSize: widthBased(FontSizes.F_16)),
                ),
                Text(
                  '\$${_currentRangeValues.start.round().toString()}-\$${_currentRangeValues.end.round().toString()}',
                  style: TextStyle(
                      fontSize: widthBased(FontSizes.F_18),
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            SizedBox(
              height: widthBased(Space.S_14),
            ),
            RangeSlider(
              values: _currentRangeValues,
              max: 500,
              divisions: 50,
              min: 20,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(
              height: widthBased(Space.S_24),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthBased(Space.S_10),
                          vertical: widthBased(Space.S_14)),
                      elevation: 0,
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiusSize.R_10),
                          side: const BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFFEEEEEE))),
                    ),
                    child: FittedBox(
                      child: Text(
                        Strings.Reset,
                        style: TextStyle(
                          color: const Color(
                            0xFF706D6D,
                          ),
                          fontSize: widthBased(FontSizes.F_15),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: widthBased(Space.S_20),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthBased(Space.S_10),
                          vertical: widthBased(Space.S_14)),
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RadiusSize.R_10),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        Strings.Apply,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthBased(FontSizes.F_15)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfFillterOption extends StatelessWidget {
  const ListOfFillterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(widthBased(Space.S_14)),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  offset: Offset(0, 1),
                  blurRadius: 10,
                )
              ],
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100)),
          child: SvgPicture.asset(
            Images.sports,
            height: widthBased(30),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: heightBased(Space.S_18),
        ),
        Text(
          Strings.Sports,
          style: TextStyle(fontSize: widthBased(FontSizes.F_14)),
        )
      ],
    );
  }
}
