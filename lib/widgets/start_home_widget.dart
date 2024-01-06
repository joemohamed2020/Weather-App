import 'package:flutter/material.dart';

class StartHomeWidget extends StatelessWidget {
  const StartHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There is no weather 😌 Start searching now 🔎",style: TextStyle(fontSize: 22),),
        ],
      ),
    );
  }
}
