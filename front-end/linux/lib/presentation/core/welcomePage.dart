import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcom Naol(T)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 216, 213, 213),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Input Results',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          width: 300,
                          child: DropdownButton(
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            value: dropdownvalue,
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
            ),
          ),
        ],
      ),
    );
  }
}
