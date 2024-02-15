import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
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
            image:
                AssetImage("./../assets/assets/images/farmer_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20, // Add spacing between cards
              runSpacing: 20, // Add spacing between rows
              children: [
                buildCardWithImage(
                  context,
                  'Farmer Input',
                  'assets/images/farmer_input.jpg',
                  () {
                    Navigator.pushNamed(context, '/farmer_input');
                  },
                ),
                buildCardWithImage(
                  context,
                  'Weather Data',
                  'assets/images/weather_data.jpg',
                  () {
                    Navigator.pushNamed(context, '/weather_data');
                  },
                ),
                buildCardWithImage(
                  context,
                  'Farmer Queries',
                  'assets/images/query.jpg',
                  () {
                    Navigator.pushNamed(context, '/farmer_queries');
                  },
                ),
                buildCardWithImage(
                  context,
                  'Contact Us',
                  'assets/images/contact.jpg',
                  () {
                    Navigator.pushNamed(context, '/page_4');
                  },
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
        height: 250, // Adjust card height as needed
        width: 250, // Adjust card width as needed
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.blue,
              ),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
