import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('h:mm a').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return Scaffold(
      backgroundColor: const Color(0XFF2D2F41),
      body: Center(
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Clock',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    formattedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ClockView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
