import 'package:flutter/material.dart';

class SelectCourseYouTook extends StatefulWidget {
  const SelectCourseYouTook({Key? key}) : super(key: key);

  @override
  _SelectCourseYouTookState createState() => _SelectCourseYouTookState();
}

class _SelectCourseYouTookState extends State<SelectCourseYouTook> {
  String selectedCourse = 'Web Development';

  // List of items in our dropdown menu
  var courses = [
    'Web Development',
    'Artificial Intelligence',
    'Software Engineering',
    'Flutter Development',
    'Computer Architecture and Orignization',
  ];
  var instructors = [
    'Naol',
    'Melat',
    'Habib',
    'Abebe',
    'Betsegew',
  ];

  int instructorIndex = 0;

  void changeInstructorIndexAndCourse(String course) {
    setState(() {
      int index = courses.indexOf(course);
      instructorIndex = index;
      selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 227, 227),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select the courses you took',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    color: Colors.white,
                    child: DropdownButton(
                      underline: Container(),
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      value: selectedCourse,
                      isExpanded: true,
                      items: courses.map((String items) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? course) {
                        changeInstructorIndexAndCourse(course!);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Instructor for the above course',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                      height: 40,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        instructors[instructorIndex],
                      ))),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFF38BC45),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Next Page'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              )
            ],
          ),
        ],
      ),
    );
  }
}
