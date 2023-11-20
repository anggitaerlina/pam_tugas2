import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pam_tugas2/clockview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    return Scaffold(
      backgroundColor: const Color(0xFFD306D),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildMenuButton('Team', Icons.people, '/team'),
              buildMenuButton('Menu', Icons.web, '/menu'),
              buildMenuButton('Favorite', Icons.favorite, '/favorite'),
            ],
          ),
          // const VerticalDivider(
          //   color: Colors.white54,
          //   width: 1,
          // ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedTime,
                          style: const TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 64,
                              fontFamily: 'avenir')),
                      Text(formattedDate,
                          style: const TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 20,
                              fontFamily: 'avenir')),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Align(
                      alignment: Alignment.center, child: ClockView(size: 300)),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Timezone',
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 24,
                              fontFamily: 'avenir')),
                      const SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.language, color: Colors.pinkAccent),
                          const SizedBox(width: 16),
                          Text('GMT' + offsetSign + timezoneString,
                              style: const TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 14,
                                  fontFamily: 'avenir')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(String title, IconData icon, String route) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.pinkAccent,
                size: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(title,
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 14,
                    fontFamily: 'avenir',
                  ))
            ],
          )),
    );
  }
}
