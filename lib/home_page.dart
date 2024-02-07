import 'package:flutter/material.dart';
import 'farmer_input.dart'; // Import the FarmerInput widget
import 'weather_data.dart'; // Import the WeatherData widget
import 'page3.dart'; // Import the Page3 widget
import 'page4.dart'; // Import the Page4 widget

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16), // Add margin to the right
            child: TextButton(
              onPressed: () {
                // Implement logout functionality here
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Set background color of the button
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCardWithImage(
                  context,
                  'Farmer Input',
                  './../assets/assets/images/farmer_input.jpg', // Farmer image asset path
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FarmerInput()),
                    );
                  },
                ),
                SizedBox(width: 16), // Add spacing between cards
                buildCardWithImage(
                  context,
                  'Weather Data',
                  './../assets/assets/images/weather_data.jpg', // Weather image asset path
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherData()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16), // Add spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCardWithImage(
                  context,
                  'Page 3',
                  './../assets/assets/images/weather_data.jpg', // Page 3 image asset path
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page3()),
                    );
                  },
                ),
                SizedBox(width: 16), // Add spacing between cards
                buildCardWithImage(
                  context,
                  'Page 4',
                  './../assets/assets/images/weather_data.jpg', // Page 4 image asset path
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildCard(BuildContext context, String buttonText, Widget page) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Container(
  //       height: 200,
  //       width: 200,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: Offset(0, 3), // changes position of shadow
  //           ),
  //         ],
  //       ),
  //       child: Center(
  //         child: Text(
  //           buttonText,
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildCardWithImage(BuildContext context, String buttonText,
      String imagePath, Function() onPressed) {
    return InkWell(
      child: Container(
        height: 200, // Increased height to accommodate image and button
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 120, // Adjust image height as needed
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background (button) color
                foregroundColor: Colors.white,
              ),
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
