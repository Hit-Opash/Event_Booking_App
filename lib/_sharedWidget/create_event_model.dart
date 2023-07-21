import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:event_booking_app/_sharedUtils/images.dart';
import 'package:event_booking_app/_sharedUtils/strings.dart';
import 'package:event_booking_app/_sharedWidget/custom_widget/button.dart';
import 'package:event_booking_app/model/add_event.dart';
import 'package:event_booking_app/model/get_api.dart';
import 'package:event_booking_app/scale/scaling.dart';
import 'package:event_booking_app/scale/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

// import 'package:intl/intl.dart';
final ImagePicker _picker = ImagePicker();
FirebaseStorage _storage = FirebaseStorage.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
String uuid = 'a';

class CreateEventModel extends StatefulWidget {
  const CreateEventModel({super.key});

  @override
  State<CreateEventModel> createState() => _CreateEventModel();
}

RangeValues _currentRangeValues = const RangeValues(50, 150);

class _CreateEventModel extends State<CreateEventModel> {
  DateTime startDate = DateTime.now();
  DateTime lastDate = DateTime.now() + Duration(days: 60);
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController venueTitleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController abouteventController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: startDate,
        lastDate: lastDate);
    if (pickedDate != null) {
      setState(() {
        print(
            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
        String formattedDate = DateFormat('dd MMMM,yyyy').format(pickedDate);
        print(
            formattedDate); //formatted date output using intl package =>  2022-07-04
        //You can format date as per your need

        setState(() {
          eventDateController.text =
              formattedDate; //set foratted date to TextField value.
        });
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM

      final formattedTime =
          TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute)
              .format(context);
      setState(() {
        startTimeController.text =
            formattedTime; //set foratted date to TextField value.
      });
      print(formattedTime); //output 04:00 AM
      //DateFormat() is from intl package, you can format the time on any pattern you need.
    } else {
      print("Time is not selected");
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (pickedTime != null) {
      final formattedTime =
          TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute)
              .format(context);
      setState(() {
        endTimeController.text =
            formattedTime; //set foratted date to TextField value.
      });
      print(formattedTime); //output 04:00 AM
    } else {
      print("Time is not selected");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    eventDateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    venueTitleController.dispose();
    addressController.dispose();
    abouteventController.dispose();
    super.dispose();
  }

  Future<void> fetchUid() async {
    final user = await firebaseAuth.currentUser;
    setState(() {
      uuid = user!.uid;
    });
    // here you write the codes to input the data into firestore
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    File? logoPath;
    XFile? a;

    Future<void> uploadLogo() async {
      //Create a reference to the location you want to upload to in firebase

      Event event = Event(
          eventTitleController.text,
          eventDateController.text,
          startTimeController.text,
          endTimeController.text,
          venueTitleController.text,
          addressController.text,
          abouteventController.text);

// upload event collection data to firestorage

      // await FirebaseFirestore.instance
      //     .collection('event')
      //     .doc(uuid)
      //     .set(event.toJson());

// get firestorage collection data
      // CollectionReference _collectionRef =
      //     FirebaseFirestore.instance.collection('event');

      // // Get docs from collection reference
      // QuerySnapshot querySnapshot = await _collectionRef.get();
      // // Get data from docs and convert map to List
      // List<Event> data = querySnapshot.docs
      //     .map((doc) => Event.fromJson(jsonDecode(jsonEncode(doc.data()))))
      //     .toList();
      // print(data[0].eventAddress);
      // print(data[1].eventAddress);

      // // Map<String, dynamic> decodedDoughnut = jsonDecode(encodedDoughnut);

      // final a = jsonEncode(querySnapshot.docs[0].data());
      // final b = jsonDecode(a);
      // Event abc = Event.fromJson(b);
      // // print(abc.eventAddress);

      // // print(decodedDoughnut);

      // //returns the download url

//get api data
      // Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
      // Response res = await (_dio.get('/users'));
      // print('res: - $res');
      // print('res.data:- ${res.data}');

      // Welcome welcome;

      // welcome = Welcome.fromJson(res.data);
      // print('welcom:- ${welcome.perPage}');
      // List<Datum> data = welcome.data;

      // print(data[0].email);
    }

    /// Get from gallery
    _getFromGallery() async {
      try {
        XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );
        if (pickedFile != null) {
          // setState(() {
          //   _setImageFileListFromFile(pickedFile);
          // });

          String path = pickedFile.path;
          setState(() {
            logoPath = File(pickedFile.path);
            a = pickedFile;
            print('Logopath:- ' + logoPath.toString());
          });
        }
      } catch (e) {
        // setState(() {
        //   _pickImageError = e;
        // });
        print(e);
      }
    }

    return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40),
        child: Center(
          child: Container(
            width: screenWidth * 0.9,
            margin: EdgeInsets.only(top: heightBased(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Event'),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: eventTitleController,
                  autocorrect: false,
                  maxLength: 30,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      labelText: 'Event Title',
                      hintText: 'Ex.. International Band Music Concert'),
                ),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                Center(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(heightBased(75)),
                  onTap: _getFromGallery,
                  child: CircleAvatar(
                    // backgroundImage:
                    //     logoPath != null ? AssetImage(Images.event_4) : null,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    radius: heightBased(75),
                    child: logoPath == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_camera_outlined,
                                color: Colors.black54,
                                size: heightBased(30),
                              ),
                              Text(
                                'Add event logo',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: fontPixel(FontSizes.F_14)),
                              )
                            ],
                          )
                        : Image.file(
                            logoPath!,
                            fit: BoxFit.cover,
                          ),
                  ),
                )),
                SizedBox(
                  height: heightBased(Space.S_4),
                ),
                TextField(
                    controller:
                        eventDateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Event Date" //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker
                      _selectDate(context);
                    }),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: TextField(
                          controller:
                              startTimeController, //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(Icons
                                  .access_time_rounded), //icon of text field
                              labelText:
                                  "Event Start Time" //label text of field
                              ),
                          readOnly: true, // when true user cannot edit text
                          onTap: () async {
                            //when click we have to show the datepicker
                            _selectStartTime(context);
                          }),
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: TextField(
                          controller:
                              endTimeController, //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(Icons
                                  .access_time_filled_rounded), //icon of text field
                              labelText: "Event End Time" //label text of field
                              ),
                          readOnly: true, // when true user cannot edit text
                          onTap: () async {
                            //when click we have to show the datepicker
                            _selectEndTime(context);
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightBased(Space.S_24),
                ),
                TextFormField(
                  // hintText: Strings.UserName_Hint,
                  // prefixIcon: Images.profile,
                  controller: venueTitleController,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(heightBased(RadiusSize.R_12))),
                      ),
                      labelText: 'Venue',
                      hintText: 'Ex.. Gala Convention Center'),
                ),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                TextFormField(
                  controller: addressController,
                  autocorrect: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(heightBased(RadiusSize.R_12))),
                    ),
                    labelText: 'Address',
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                TextFormField(
                  controller: abouteventController,
                  autocorrect: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(heightBased(RadiusSize.R_12))),
                    ),
                    labelText: 'About Event',
                  ),
                ),
                SizedBox(
                  height: heightBased(Space.S_18),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: heightBased(Space.S_10),
                              vertical: heightBased(Space.S_14)),
                          elevation: 0,
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  heightBased(RadiusSize.R_10)),
                              side: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xFFEEEEEE))),
                        ),
                        child: FittedBox(
                          child: Text(
                            'Cancle',
                            style: TextStyle(
                              color: const Color(
                                0xFF706D6D,
                              ),
                              fontSize: fontPixel(FontSizes.F_15),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: heightBased(Space.S_20),
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: heightBased(Space.S_10),
                              vertical: heightBased(Space.S_14)),
                          elevation: 0,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                heightBased(RadiusSize.R_10)),
                          ),
                        ),
                        child: FittedBox(
                          child: Text(
                            'Add Event',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontPixel(FontSizes.F_15)),
                          ),
                        ),
                        onPressed: () {
                          uploadLogo();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
