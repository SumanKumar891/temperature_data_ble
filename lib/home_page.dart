import 'package:flutter/material.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./../assets/assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCardWithImage(
                      context,
                      'Farmer Input',
                      'assets/images/farmer_input.jpg', // Farmer image asset path
                      () {
                        Navigator.pushNamed(context, '/farmer_input');
                      },
                    ),
                    SizedBox(width: 20), // Add spacing between cards
                    buildCardWithImage(
                      context,
                      'Weather Data',
                      'assets/images/weather_data.jpg', // Weather image asset path
                      () {
                        Navigator.pushNamed(context, '/weather_data');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCardWithImage(
                      context,
                      'Farmer Queries',
                      'assets/images/query.jpg', // Page 3 image asset path
                      () {
                        Navigator.pushNamed(context, '/farmer_queries');
                      },
                    ),
                    SizedBox(width: 20), // Add spacing between cards
                    buildCardWithImage(
                      context,
                      'Contact Us',
                      'assets/images/contact.jpg', // Page 4 image asset path
                      () {
                        Navigator.pushNamed(context, '/page_4');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardWithImage(BuildContext context, String buttonText,
      String imagePath, Function() onPressed) {
    return InkWell(
      child: Container(
        height: 230, // Increased height to accommodate image and button
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 140, // Adjust image height as needed
              // fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
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
