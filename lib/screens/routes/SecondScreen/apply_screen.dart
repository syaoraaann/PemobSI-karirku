// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({Key? key}) : super(key: key);

  void showDescriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Job Description & Requirements'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Job Description:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'This is a brief overview of the job responsibilities, outlining the key tasks and expectations. You can customize this text to fit the specific position.',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10),
              const Text(
                'Work Entry Requirements:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '* Bachelor\'s degree in a relevant field (e.g., Computer Science, Engineering)\n'
                '* Minimum 2 years of experience in a similar role\n'
                '* Strong analytical and problem-solving skills\n'
                '* Excellent communication and collaboration skills\n'
                '** (Customize this list with the actual requirements)**',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Job Title', // Replace with actual job title
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'A brief description of the company, its mission, and values. Highlight what makes the company a great place to work.',
              style: const TextStyle(fontSize: 14.0), // Adjust font size as needed
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => showDescriptionDialog(context),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                '* Bachelor\'s degree in a relevant field (e.g., Computer Science, Engineering)\n'
                '* Minimum 2 years of experience in a similar role\n'
                '* Strong analytical and problem-solving skills\n'
                '* Excellent communication and collaboration skills\n'
                '* Good Looking...',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Apply button pressed!');
              },
              child: const Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
