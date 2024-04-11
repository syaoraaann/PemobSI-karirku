// ignore_for_file: use_super_parameters, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:karirku/screens/news_screen.dart';
// import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';

class CommunityPage extends StatelessWidget {
    const CommunityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => JobBox(), // Build each box
        ),
      ),
    );
  }
}

class JobBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to left
          children: [
            Text(
              'Community Name', // Replace with job details
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0), // Add some space between title and description
            Text(
              'Community Description',
              maxLines: 3, // Limit description lines (optional)
              overflow: TextOverflow.ellipsis, // Add ellipsis (...) if text overflows
            ),
            SizedBox(height: 8.0),
            Row( // Row for buttons (optional)
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align buttons
              children: [
              ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsScreen()),
                  ) ;
                },
                  child: Text('Join'),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}