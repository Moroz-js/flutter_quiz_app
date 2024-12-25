import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 0.0), // Added vertical padding
              child: Container(
                padding: const EdgeInsets.all(
                    16.0), // Added padding inside container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26, // Optional: adds subtle background
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: data['user_answer'] as String ==
                                    data['correct_answer'] as String
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.lato(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Aligns text to the left
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                                fontSize: 20.0, color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 12, // Increased spacing
                          ),
                          Text(
                            'Your answer: ${data['user_answer'] as String}',
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: data['user_answer'] as String !=
                                        data['correct_answer'] as String
                                    ? Colors.red
                                    : Colors.green),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8), // Added spacing
                          data['user_answer'] as String !=
                                  data['correct_answer'] as String
                              ? Text(
                                  'Correct answer: ${data['correct_answer'] as String}',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green),
                                )
                              : const Text(''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
