import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({super.key});

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  final List subjectListData = const [
    {"subject_name": "Flutter", "subject_id": "1001"},
    {"subject_name": "Java", "subject_id": "1002"},
    {"subject_name": "Web", "subject_id": "1003"},
    {"subject_name": "C++", "subject_id": "1004"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Subject List")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ...subjectListData
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuizScreen()));
                      },
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      tileColor: Colors.purple,
                      title: Text(e["subject_name"]),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
