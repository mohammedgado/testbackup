import 'package:dubai_recruitment/core/widgets/iconTextRow.dart';
import 'package:flutter/material.dart';

class LabelValueRow extends StatelessWidget {
  final String labelText;
  final String valueText;
  final IconData icon;

  LabelValueRow(
      {super.key,
      required this.labelText,
      required this.valueText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 175,
            child: IconTextRow(
              icon: icon,
              txt: labelText,
              textSize: 25,
              textColor: Colors.black,
            ),
          ),
          Container(
            width: 150,
            child: Text(
              valueText,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Visibility(visible: false, child: Icon(Icons.edit))
        ],
      ),
    );
  }
}
