import 'package:flutter/material.dart';

class Homes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.blue,
    ),
    body: Container (
      child: Column(
        children: [
          SizedBox(height: 50),

          SizedBox(
            height: 110,
            width: 400,

            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Recherchez un article.....",

              ),
            ),

          ),







        ],
      )
    )
    );
  }
}


