import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourseResultsPage extends StatelessWidget {
  CourseResultsPage({super.key});

  String selectedCourse = 'Web Development';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCCCCC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),
            color: const Color(0xFF38BC45),
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome Mike!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 26),
            child: const Text(
              "Web Development",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAssessmentAndResultRow(
                    assessmentType: 'Project',
                    score: 25,
                  ),
                  SizedBox(height: 20,),
                  _buildAssessmentAndResultRow(
                    assessmentType: 'Mid Exam',
                    score: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildAssessmentAndResultRow(
                    assessmentType: 'Final Exam',
                    score: 35,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildAssessmentAndResultRow(
                    assessmentType: 'Total',
                    score: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildAssessmentAndResultRow(
                    assessmentType: 'Grade',
                    score: "A-",
                  ),
                ],
              )),
           SizedBox(
            height: 30,
          ),
          Container(
            
            height: 50,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 26, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "If you have any issues regarding your ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Text(
                      "results, inform the ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      child: Text(
                        "Instructor",
                        style: TextStyle(
                            color: Color(0xFF24902E),
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print("Contacting Instructor");
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const Icon(
        Icons.settings,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}

class _buildAssessmentAndResultRow extends StatelessWidget {
  _buildAssessmentAndResultRow({
    required this.assessmentType,
    required this.score,
    super.key,
  });

  String assessmentType;
  dynamic score;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          assessmentType,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // Text(
        //   ".........................",
        //   style: TextStyle(
        //       color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        // ),
        Text(
          score.toString(),
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
