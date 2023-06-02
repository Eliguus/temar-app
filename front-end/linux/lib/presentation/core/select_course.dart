import 'package:flutter/material.dart';

class SelectCourse extends StatefulWidget {
  const SelectCourse({Key? key}) : super(key: key);

  @override
  _SelectCourseState createState() => _SelectCourseState();
}

class _SelectCourseState extends State<SelectCourse> {
  String dropdownvalue = 'Web Development';

  // List of items in our dropdown menu
  var items = [
    'Web Development',
    'Artificial Intelligence',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
                  'Select the courses that you give',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    color: Colors.white,
                    child: DropdownButton(
                      underline: Container(),
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      value: dropdownvalue,
                      isExpanded: true,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select the classes you teach',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    color: Colors.white,
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      value: dropdownvalue,
                      isExpanded: true,
                      underline: Container(),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
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
