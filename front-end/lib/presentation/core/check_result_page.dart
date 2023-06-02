import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CheckResultPage extends StatefulWidget {
  const CheckResultPage({super.key});

  @override
  State<CheckResultPage> createState() => _CheckResultPageState();
}

class _CheckResultPageState extends State<CheckResultPage> {
  String selectedCourse = 'Web Development';

  var courses = [
    'Web Development',
    'Artificial Intelligence',
    'Software Engineering',
    'Flutter Development',
    'Computer Architecture and Orignization',
  ];

  void changeSelectedCourse(String course) {
    setState(() {
      selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCCCCC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 40,
            ),
            color: Color(0xFF38BC45),
            height: 290,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Mike!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 26),
            child: Text(
              "Check Results",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 26, right: 50),
            width: 250,
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: DropdownButton(
              underline: Container(),
              icon: Icon(Icons.arrow_drop_down_sharp),
              value: selectedCourse,
              isExpanded: true,
              items: courses.map((String items) {
                return DropdownMenuItem(
                  alignment: AlignmentDirectional.centerStart,
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? course) {
                changeSelectedCourse(course!);
              },
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: Container(
              color: Color(0xFF38BC45),
              height: 50,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 26, right: 26),
              child: Center(
                child: Text(
                  "Next Page",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: Icon(
        Icons.settings,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}
