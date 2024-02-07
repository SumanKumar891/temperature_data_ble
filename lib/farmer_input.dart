// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FarmerInput extends StatefulWidget {
  @override
  _FarmerInputState createState() => _FarmerInputState();
}

class _FarmerInputState extends State<FarmerInput> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _problemStatementController =
      TextEditingController();
  String? _imagePath; // Store image path for web file upload

  @override
  void initState() {
    super.initState();
    _requestLocationPermissionAndRetrieve();
  }

  void _requestLocationPermissionAndRetrieve() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        // if (position != null) {
        //   List<Placemark> placemarks = await placemarkFromCoordinates(
        //     position.latitude,
        //     position.longitude,
        //   );
        //   if (placemarks.isNotEmpty) {
        //     Placemark firstPlacemark = placemarks[0];
        //     String formattedLocation = "";

        //     // Prioritize more specific address components as available
        //     if (firstPlacemark.street != null) {
        //       formattedLocation += "${firstPlacemark.street}";
        //     }
        //     if (firstPlacemark.subLocality != null) {
        //       if (!formattedLocation.isEmpty) {
        //         formattedLocation += ", ";
        //       }
        //       formattedLocation += "${firstPlacemark.subLocality}";
        //     }
        //     if (firstPlacemark.locality != null) {
        //       if (!formattedLocation.isEmpty) {
        //         formattedLocation += ", ";
        //       }
        //       formattedLocation += "${firstPlacemark.locality}";
        //     }
        //     if (firstPlacemark.postalCode != null) {
        //       if (!formattedLocation.isEmpty) {
        //         formattedLocation += " ";
        //       }
        //       formattedLocation += "${firstPlacemark.postalCode}";
        //     }
        //     if (firstPlacemark.country != null) {
        //       if (!formattedLocation.isEmpty) {
        //         formattedLocation += ", ";
        //       }
        //       formattedLocation += "${firstPlacemark.country}";
        //     }

        //     setState(() {
        //       _locationController.text = formattedLocation;
        //     });
        //   } else {
        //     print("Error: No placemarks found for given coordinates.");
        //     // Handle the case where no address information is available
        //   }
        // } else {
        //   print("Error getting location: Position is null.");
        //   // Handle the case where location retrieval fails
        // }
        setState(() {
          _locationController.text = "Latitude:" +
              position.latitude.toString() +
              " " +
              "Longitude:" +
              position.longitude.toString();
        });
      } catch (e) {
        print("Error getting location: $e");
        // Handle other errors, e.g., display an error message to the user
      }
    } else {
      print("Location permission is not granted.");
      // Provide information about why location is needed and offer manual input
    }
  }

  void _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  // void _uploadImage() async {
  //   final html.InputElement input = html.InputElement()..type = 'file';
  //   input.accept = 'image/*';
  //   input.click();
  //   input.onChange.listen((event) {
  //     final html.File file = input.files!.first;
  //     final reader = html.FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) {
  //       setState(() {
  //         _imagePath = reader.result as String?;
  //       });
  //     });
  //   });
  // }

  void _submitForm() async {
    final url = Uri.parse('your_api_endpoint_here');
    final response = await http.post(
      url,
      body: jsonEncode({
        'name': _nameController.text,
        'contactNumber': _contactNumberController.text,
        'location': _locationController.text,
        'problemStatement': _problemStatementController.text,
        'imagePath': _imagePath,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // Data successfully sent to the API
      print('Form data sent successfully.');
    } else {
      // Error occurred while sending data
      print('Error sending form data: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _contactNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _problemStatementController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Problem Statement',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                      primary: Colors.white,
                      side: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    onPressed: _selectImage,
                    child: Text('Select Image'),
                  ),
                  // SizedBox(height: 10),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blue, // background (button) color
                  //     foregroundColor: Colors.white,
                  //   ),
                  //   onPressed: _uploadImage,
                  //   child: Text('Upload Image (Web)'),
                  // ),
                  SizedBox(height: 10),
                  _imagePath != null
                      ? Image.network(
                          _imagePath!,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                      primary: Colors.white,
                      side: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}