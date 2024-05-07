import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData
          .map(
            (data) => Row(
              children: [
                Text(((data['question'] as int) + 1).toString()),
              ],
            ),
          )
          .toList(),
    );
  }
}
