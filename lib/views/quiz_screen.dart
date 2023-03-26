// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "32",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "How many keywords are there in C language?",
      "options": [
        {
          "option": "a)",
          "value": "122",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "45",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c)",
          "value": "79",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "32",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "C99",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "___ is an informal name for ISO/IEC 9899:1999, a past version of the C programming language standard?",
      "options": [
        {
          "option": "a)",
          "value": "C++",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "Java",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c)",
          "value": "C99",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "C",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e)",
          "value": "C88",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 3,
      "answer": "Polymorphism",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "The feature that allows the same operations to be carried out differently depending on the object is ________",
      "options": [
        {
          "option": "a)",
          "value": "Polygamy",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "Multitasking",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Inheritane",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "Polymorphism",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e)",
          "value": "None of above",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 4,
      "answer": "Character",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "The most efficient data type for a variable that stores the letter C is the _______ data type",
      "options": [
        {
          "option": "a)",
          "value": "Character",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "Int",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c)",
          "value": "Float",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "Double",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 5,
      "answer": "Header",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "If you want to use a class to define objects in many different programs, you should define the class in a C++ _______ file",
      "options": [
        {
          "option": "a)",
          "value": "Program",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "Header",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c)",
          "value": "Text",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "Source",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e)",
          "value": "All of above",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 6,
      "answer": "Constructor",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "A function that is called automatically each time an object is created is a(n)",
      "options": [
        {
          "option": "a)",
          "value": "Architect",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b)",
          "value": "Constructor",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c)",
          "value": "Builder",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d)",
          "value": "Contractor",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e)",
          "value": "Context",
          "color": "0xFFFFFFFF",
        }
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            ommitedQuestion: ommitedQuestion,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF053251),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  print("Current page $page");
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF053251),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  data['color'],
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                data['option'].toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data['value'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            print("Submit ");
            quizResult(context);
          } else {
            print("ELSE PART");
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
            Text(questionINdex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
