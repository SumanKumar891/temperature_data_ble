// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';
// import 'farmer_queries.dart';

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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // _requestLocationPermissionAndRetrieve();
    location_permission();
  }

  void location_permission() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
    setState(() {
      _locationController.text = _locationData.toString();
    });
  }

  // void _requestLocationPermissionAndRetrieve() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }

  //   if (permission == LocationPermission.whileInUse ||
  //       permission == LocationPermission.always) {
  //     try {
  //       Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best,
  //       );
  //       setState(() {
  //         _locationController.text = "Latitude:" +
  //             position.latitude.toString() +
  //             " " +
  //             "Longitude:" +
  //             position.longitude.toString();
  //       });
  //       if (position != null) {
  //         List<Placemark> placemarks = await placemarkFromCoordinates(
  //           position.latitude,
  //           position.longitude,
  //         );
  //         if (placemarks.isNotEmpty) {
  //           Placemark firstPlacemark = placemarks[0];
  //           String formattedLocation = "";

  //           // Prioritize more specific address components as available
  //           if (firstPlacemark.street != null) {
  //             formattedLocation += "${firstPlacemark.street}";
  //           }
  //           if (firstPlacemark.subLocality != null) {
  //             if (!formattedLocation.isEmpty) {
  //               formattedLocation += ", ";
  //             }
  //             formattedLocation += "${firstPlacemark.subLocality}";
  //           }
  //           if (firstPlacemark.locality != null) {
  //             if (!formattedLocation.isEmpty) {
  //               formattedLocation += ", ";
  //             }
  //             formattedLocation += "${firstPlacemark.locality}";
  //           }
  //           if (firstPlacemark.postalCode != null) {
  //             if (!formattedLocation.isEmpty) {
  //               formattedLocation += " ";
  //             }
  //             formattedLocation += "${firstPlacemark.postalCode}";
  //           }
  //           if (firstPlacemark.country != null) {
  //             if (!formattedLocation.isEmpty) {
  //               formattedLocation += ", ";
  //             }
  //             formattedLocation += "${firstPlacemark.country}";
  //           }

  //           setState(() {
  //             _locationController.text = formattedLocation;
  //           });
  //         } else {
  //           print("Error: No placemarks found for given coordinates.");
  //           // Handle the case where no address information is available
  //         }
  //       } else {
  //         print("Error getting location: Position is null.");
  //         // Handle the case where location retrieval fails
  //       }
  //     } catch (e) {
  //       print("Error getting location: $e");
  //       // Handle other errors, e.g., display an error message to the user
  //     }
  //   } else {
  //     print("Location permission is not granted.");
  //     // Provide information about why location is needed and offer manual input
  //   }
  // }

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
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse(
        'https://u1oby14a09.execute-api.us-east-1.amazonaws.com/Farmer_Input_api');
    final response = await http.post(
      url,
      body: jsonEncode({
        'name': _nameController.text,
        'contactNumber': _contactNumberController.text,
        'location': _locationController.text,
        'problemStatement': _problemStatementController.text,
        'imagePath': _imagePath,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      final responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Response: ${responseData}'), // Assuming a 'message' field in the response
        ),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => FarmerQueriesPage()),
      // );
      Navigator.pushNamed(context, '/farmer_queries');
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('API call failed: ${response.body}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Input'),
      ),
      body: Container(
        height: 890,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                './../assets/assets/images/farmer_background.jpg'), // Background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white.withOpacity(0.5),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
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
                    SizedBox(height: 5),
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
                      onPressed: isLoading ? null : _submitForm,
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
