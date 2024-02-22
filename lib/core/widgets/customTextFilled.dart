import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../layoutHelpers/responsive.dart';

Widget editTextField(context, title, controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
      ),
      const SizedBox(height: 4),
      Container(

        height: 50,
        child: TextField(
          keyboardType: TextInputType.text,
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller,
          // maxLines: 5,
          // maxLength: 400,
          style: TextStyle(
            fontFamily: '.SF Arabic',
            fontSize: 12,
          ),
          decoration: const InputDecoration(
            hintText: 'Input text here',
            hintStyle: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
      ),
    ],
  );
}

