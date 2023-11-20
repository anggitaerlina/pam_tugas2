import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final List<TeamMember> teamMembers = [
    TeamMember(name: 'Anggita Erlina Aprilia'),
    TeamMember(name: '124210034'),
    TeamMember(name: 'SI-A'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team'),
        backgroundColor: const Color(0xFF2D2F41),
        foregroundColor: Color.fromARGB(255, 255, 255, 255), // Use your existing theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: teamMembers.length,
          itemBuilder: (BuildContext context, int index) {
            return TeamMemberCard(
              name: teamMembers[index].name,
            );
          },
        ),
      ),
    );
  }
}

class TeamMember {
  final String name;

  TeamMember({required this.name});
}

class TeamMemberCard extends StatelessWidget {
  final String name;

  TeamMemberCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo[200],
              child: Text(
                getInitials(name),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}';
    } else if (name.isNotEmpty) {
      return name[0];
    } else {
      return '';
    }
  }
}
