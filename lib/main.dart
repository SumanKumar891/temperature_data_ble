import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Add this import for formatting timestamps

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController gatewayIdController = TextEditingController();
  TextEditingController nodeIdController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  Future<void> _selectStartDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate ?? currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          _selectedStartDate ?? currentDate,
        ),
      );

      if (pickedTime != null) {
        DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _selectedStartDate = combinedDateTime;
          startTimeController.text =
              (_selectedStartDate!.millisecondsSinceEpoch ~/ 1000).toString();
        });
      }
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedEndDate ?? currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          _selectedEndDate ?? currentDate,
        ),
      );

      if (pickedTime != null) {
        DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _selectedEndDate = combinedDateTime;
          endTimeController.text =
              (_selectedEndDate!.millisecondsSinceEpoch ~/ 1000).toString();
        });
      }
    }
  }


  void fetchData() async {
    String nodeId = nodeIdController.text;
    String gatewayId = gatewayIdController.text;
    String startTime = startTimeController.text;
    String endTime = endTimeController.text;

    String url =
        'https://gjehwqgnii.execute-api.us-east-1.amazonaws.com/latest/data?nodeId=$nodeId&gatewayId=$gatewayId&starttime=$startTime&endtime=$endTime';

    final response = await http.get(Uri.parse(url));

    print('API Response Code: ${response.statusCode}');
    print('API Response Body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      print('Decoded JSON: $jsonResponse');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(
            sensorData: jsonResponse.cast<Map<String, dynamic>>(),
          ),
        ),
      );
    } else {
      // Handle error
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(


      appBar: AppBar(
        title: Text(
          'Weather Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30, // Adjust the font size as needed
          ),),
      ),


      // body: Center(
      //   child: Card(
      //     elevation: 5,
      //     // Set width to 80% of the screen width
      //     // Set height to 60% of the screen height
      //     child: Container(
      //       width: screenSize.width * 0.8,
      //       height: screenSize.height * 0.6,
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           TextField(
      //             controller: gatewayIdController,
      //             decoration: InputDecoration(labelText: 'Enter Gateway ID'),
      //           ),
      //           TextField(
      //             controller: nodeIdController,
      //             decoration: InputDecoration(labelText: 'Enter Node ID'),
      //           ),
      //           TextField(
      //             controller: startTimeController,
      //             decoration: InputDecoration(labelText: 'Enter Start Time'),
      //             onTap: () => _selectStartDate(context),
      //           ),
      //           TextField(
      //             controller: endTimeController,
      //             decoration: InputDecoration(labelText: 'Enter End Time'),
      //             onTap: () => _selectEndDate(context),
      //           ),
      //           SizedBox(height: 16),
      //           Center(
      //             child: ElevatedButton(
      //               onPressed: fetchData,
      //               child: Text('Submit'),
      //               style: ElevatedButton.styleFrom(
      //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      //                 textStyle: TextStyle(fontSize: 18),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // )


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/weather.png', // Change this to your actual image path
              width: 500,
              height: 200,
            ),
             // Add some space between the image and the card
            Card(
              elevation: 5,
              child: Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.6,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: gatewayIdController,
                      decoration: InputDecoration(labelText: 'Enter Gateway ID'),
                    ),
                    TextField(
                      controller: nodeIdController,
                      decoration: InputDecoration(labelText: 'Enter Node ID'),
                    ),
                    TextField(
                      controller: startTimeController,
                      decoration: InputDecoration(labelText: 'Enter Start Time'),
                      onTap: () => _selectStartDate(context),
                    ),
                    TextField(
                      controller: endTimeController,
                      decoration: InputDecoration(labelText: 'Enter End Time'),
                      onTap: () => _selectEndDate(context),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: fetchData,
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          textStyle: TextStyle(fontSize: 18),
                          primary: Colors.white, // Set the primary color to red
                          side: BorderSide(color: Colors.red, width: 2.0), // Set the white border
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),





    );
  }
}



class SecondPage extends StatelessWidget {
  final List<Map<String, dynamic>> sensorData;

  SecondPage({required this.sensorData});

  String _formatTimestamp(dynamic timestamp) {
    int timestampValue = timestamp is String ? int.tryParse(timestamp) ?? 0 : timestamp;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampValue * 1000);
    String formattedTimestamp = DateFormat('h:mm a dd/MM').format(dateTime);
    return formattedTimestamp;
  }

  String _getImageForLightIntensity(String lightIntensity) {
    int intensityValue = int.tryParse(lightIntensity) ?? 0;

    if (intensityValue >= 0 && intensityValue <= 2000) {
      return 'assets/images/cloud.png';
    } else if (intensityValue > 2000 && intensityValue <= 4000) {
      return 'assets/images/partially_sunny.png';
    } else {
      return 'assets/images/sunny.png';
    }
  }


  String _getImageForTime(String humanTime, String lightIntensity) {
    DateTime dateTime = DateFormat('yyyy-MM-dd hh:mm a').parse(humanTime);
    int intensityValue = int.tryParse(lightIntensity) ?? 0;

    // Check if the time is between 8:00 PM and 5:00 AM
    if (dateTime.hour >= 20 || dateTime.hour < 5) {
      return 'assets/images/moon.png';
    } else {
      if (intensityValue >= 0 && intensityValue <= 2000) {
        return 'assets/images/cloud.png';
      } else if (intensityValue > 2000 && intensityValue <= 4000) {
        return 'assets/images/partially_sunny.png';
      } else {
        return 'assets/images/sunny.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    sensorData.sort((a, b) => b["timestamp"].compareTo(a["timestamp"]));

    return Scaffold(
      appBar: AppBar(
        title: Text('Fetched Data',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30, // Adjust the font size as needed
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:



              ListView.builder(
                itemCount: sensorData.length,
                itemBuilder: (context, index) {
                  String timeImage = _getImageForTime(sensorData[index]["human_time"], sensorData[index]["light_intensity"]);

                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: index == 0 ? Colors.greenAccent : null,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Humidity: ${sensorData[index]["humidity"]}%',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Light Intensity: ${sensorData[index]["light_intensity"]}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Temperature: ${sensorData[index]["temperature"]}℃',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Timestamp: ${_formatTimestamp(sensorData[index]["timestamp"])}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100, // Set your desired height
                            width: 100, // Set your desired width
                            child: Image.asset(timeImage),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


            ),
          ],
        ),
      ),
    );
  }
}