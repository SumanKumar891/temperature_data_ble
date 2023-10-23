import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse(apiEndpoint));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // String _epochToHumanReadable(String epochTime) {
  //   final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(epochTime) * 1000);
  //   final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  //   return formatter.format(dateTime);
  // }


  String? _epochToHumanReadable(String? epochTime) {
    if (epochTime != null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(epochTime) * 1000);
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return formatter.format(dateTime);
    }
    return null; // Return null if epochTime is null
  }


  // Example API endpoint
  final String apiEndpoint = 'https://api.example.com/data';

  String nodeID = ''; // Variable to store the user input
  final TextEditingController nodeIDController = TextEditingController();

  @override
  void dispose() {
    nodeIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black, // Set the desired color (in this case, green)
                BlendMode.colorDodge, // Apply color blending mode
              ),
              child: Image.asset(
                'assets/images/awadhlogo.png', // Replace with the path to your image asset
                width: 70, // Adjust the width as needed
                height: 70, // Adjust the height as needed
              ),
            ),
            SizedBox(width: 8), // Add some spacing between the image and the title
            Text('Temperature Sensor Data'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // Text input for NodeID in a Card
        //   Card(
        //   elevation: 5,
        //   color: Colors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: TextField(
        //             controller: nodeIDController,
        //             decoration: InputDecoration(labelText: 'Enter Node ID'),
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             setState(() {
        //               nodeID = nodeIDController.text;
        //               print('NodeID: $nodeID'); // Print the inputted NodeID to the console
        //             });
        //           },
        //
        //           child: Text(
        //             'Enter',
        //             style: TextStyle(
        //               color: Colors.green, // Change font color to white
        //               //fontStyle: FontStyle.italic, // Make the text italic
        //               fontWeight: FontWeight.bold,
        //               fontSize:16// Make the text bold
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //
        //   ),
        // ),
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5, // Adjust the fraction as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: nodeIDController,
                          decoration: InputDecoration(labelText: 'Enter Node ID'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            nodeID = nodeIDController.text;
                            print('NodeID: $nodeID');
                          });
                        },
                        child: Text(
                          'Enter',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height:20),
        // Floating Widgets
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // FloatingWidget(
        //     //   apiEndpoint: apiEndpoint,
        //     //   title: 'NodeID',
        //     //   data: nodeID,
        //     // ),
        //     SizedBox(width: 20.0), // Gap between widgets
        //     FloatingWidget(
        //       apiEndpoint: apiEndpoint,
        //       title: 'Time',
        //       isTimeCard: true,
        //
        //     ),
        //   ],
        // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add some spacing between widgets
                SizedBox(width: 20.0),
                // Display the 'Time' in a plain container
                // Container(
                //   child: FutureBuilder<String>(
                //     future: fetchDataFromAPI(), // Fetch data from the API
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         // Data has been fetched, convert to human-readable format
                //         final data = snapshot.data;
                //         final timeInHumanFormat = _epochToHumanReadable(data);
                //
                //         return Text(
                //           'Time: $timeInHumanFormat',
                //           style: TextStyle(
                //             fontSize: 16, // Adjust font size as needed
                //           ),
                //         );
                //       } else {
                //         // Data is still loading
                //         return CircularProgressIndicator();
                //       }
                //     },
                //   ),
                // ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: FutureBuilder<String>(
                      future: fetchDataFromAPI(), // Fetch data from the API
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // Data has been fetched, convert to human-readable format
                          final data = snapshot.data;
                          final timeInHumanFormat = _epochToHumanReadable(data);

                          return Text(
                            'Time: $timeInHumanFormat',
                            style: TextStyle(
                              fontSize: 16, // Adjust font size as needed
                            ),
                          );
                        } else {
                          // Data is still loading
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20.0), // Gap between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingWidget(
              apiEndpoint: apiEndpoint,
              title: 'Temperature in Celsius',
              isTemperatureCard: true,
            ),
            SizedBox(width: 20.0), // Gap between widgets
            FloatingWidget(
              apiEndpoint: apiEndpoint,
              title: 'Humidity in %',
              isHumidityCard: true,
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}

class FloatingWidget extends StatefulWidget {
  final String apiEndpoint;
  final String title;
  final bool isTimeCard;
  final bool isTemperatureCard;
  final bool isHumidityCard;
  String data;

  FloatingWidget({
    required this.apiEndpoint,
    required this.title,
    this.isTimeCard = false,
    this.isTemperatureCard = false,
    this.isHumidityCard = false,
    this.data = '',
  });

  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Fetch data from the API or use the provided data
    final result = widget.isTimeCard
        ? _epochToHumanReadable(widget.data)
        : widget.data;

    setState(() {
      widget.data = result;
    });
  }

  Future<String?> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse(widget.apiEndpoint));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String _epochToHumanReadable(String epochTime) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(epochTime) * 1000);
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add a shadow effect
      color: Colors.white, // White background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 150,
        height: 150,
        child: Center(
          child: Text('${widget.title}: ${widget.data}'),
        ),
      ),
    );
  }
}
