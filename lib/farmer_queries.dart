import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer Queries',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FarmerQueriesPage(),
    );
  }
}

class FarmerQueriesPage extends StatefulWidget {
  @override
  _FarmerQueriesPageState createState() => _FarmerQueriesPageState();
}

class _FarmerQueriesPageState extends State<FarmerQueriesPage> {
  List<Map<String, dynamic>> _queries = [];
  bool loader = true;

  @override
  void initState() {
    super.initState();
    _fetchQueries();
  }

  Future<void> _fetchQueries() async {
    final Uri url = Uri.parse(
        'https://u1oby14a09.execute-api.us-east-1.amazonaws.com/farmer_input_data');

    try {
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        setState(() {
          _queries = List<Map<String, dynamic>>.from(decodedData);
        });
        print(_queries);
      } else {
        throw Exception('Failed to load queries');
      }
    } catch (e) {
      print('Error fetching queries: $e');
      throw Exception('Failed to load queries');
    } finally {
      setState(() {
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Queries'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/farmer_query_bg.jpg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: loader
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: _queries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildQueryCard(_queries[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueryCard(Map<String, dynamic> query) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: 300,
        child: Card(
          color:
              Colors.white.withOpacity(0.7), // Set semi-transparent white color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Name: ${query['Name']['S']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Posted on: ${query['TriggerTime']['S']}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Problem: ${query['ProblemStatement']['S']}'),
                    SizedBox(height: 8.0),
                    Text('Location: ${query['Location']['S']}'),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () =>
                          _launchPhoneCall(query['ContactNumber']['S']),
                      child: Text(
                        'Contact: ${query['ContactNumber']['S']}',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    if (query['ImagePath'] != null &&
                        query['ImagePath']['S'] != null)
                      Image.network(
                        query['ImagePath']['S'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
