import 'dart:async';
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
  String nodeID = '';
  final TextEditingController nodeIDController = TextEditingController();

  String temperature = '';
  String humidity = '';
  String time = '';

  String _epochToHumanReadable(String? epochTime) {
    if (epochTime != null) {
      final dateTime =
      DateTime.fromMillisecondsSinceEpoch(int.parse(epochTime) * 1000);
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return formatter.format(dateTime);
    }
    return '';
  }

  Future<void> fetchDataFromAPI() async {
    try {
      final response = await http.get(Uri.parse('$apiEndpoint?nodeId=$nodeID'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          temperature = data['temperature'];
          humidity = data['humidity'];
          time = _epochToHumanReadable(data['timestamp']);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle the exception here (e.g., show an error message)
      print('Error: $e');
    }
  }

  final String apiEndpoint =
      'https://gdp1cq3yna.execute-api.us-east-1.amazonaws.com/temprature_sensor_data_api';

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is initialized
    _startTimer();
  }

  void _startTimer() {
    const duration = Duration(seconds: 10);
    _timer = Timer.periodic(duration, (timer) {
      fetchDataFromAPI();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    nodeIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black,
                BlendMode.colorDodge,
              ),
              child: Image.asset(
                'assets/images/awadhlogo.png',
                width: 70,
                height: 70,
              ),
            ),
            SizedBox(width: 8),
            Text('Temperature Sensor Data'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: nodeIDController,
                          decoration:
                          InputDecoration(labelText: 'Enter Node ID'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            nodeID = nodeIDController.text;
                          });
                          fetchDataFromAPI();
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
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Time: $time'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingWidget(
                  data: temperature,
                  title: 'Temperature(°C)',
                  isTemperatureCard: true,
                ),
                SizedBox(width: 20.0),
                FloatingWidget(
                  data: humidity,
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
  final String data;
  final String title;
  final bool isTemperatureCard;
  final bool isHumidityCard;

  FloatingWidget({
    required this.data,
    required this.title,
    this.isTemperatureCard = false,
    this.isHumidityCard = false,
  });

  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
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
