// ignore_for_file: use_super_parameters, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   color: Colors.blue,
          // ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100.0,
                        backgroundColor:
                            const Color.fromARGB(255, 129, 125, 125),
                        foregroundImage:
                            AssetImage('assets/images/avatar-hd.png'),
                        child: CircleAvatar(
                          radius: 90.0,
                          foregroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Kevin Pratama',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AmaticSC',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Mobile Developer | Game Enthusiast',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(245, 45, 44, 44),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(218, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              // Add subtle shadow
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(0, 2),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Education Journey',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '•    Universitas Pendidikan Ganesha(2022 - now)',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '•    Information System Student',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '•    SMAN 40 Jakarta (2019 - 2022)',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(218, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(0, 2),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Education Journey',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '•    Universitas Pendidikan Ganesha(2022 - now)',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '•    Information System Student',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '•    SMAN 40 Jakarta (2019 - 2022)',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 70.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
