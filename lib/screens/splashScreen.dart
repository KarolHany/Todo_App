import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(249, 213, 136, 214),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Spacer(),
          Center(
            child: Text(
              "TODO LIST",
              style: TextStyle(
                  color: Colors.white, fontSize: 50 , fontWeight: FontWeight.bold ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Icon(Icons.note, color: Colors.black, size: 30,),
           Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/Notes icon.jpeg",
                  ),
                ),
              ),
           SizedBox(
            height: 15,
          ),
          Text(
            "MAKE YOUR GOLES HAPPENED",
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
           Spacer(
            flex: 3,
           ),
          Text(
            "loading...",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Spacer(flex: 1,)
        ],
      ),
    );
  }
}
