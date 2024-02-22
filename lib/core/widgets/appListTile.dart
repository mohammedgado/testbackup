import 'package:flutter/material.dart';

Widget appListTile(title, onPressed) {
  return ListTile(
    onTap: onPressed,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        fontFamily: 'Inter',
      ),
    ),
    trailing: const Icon(Icons.arrow_forward_ios),
    shape: const Border(
      bottom: BorderSide(width: 1),
    ),
  );
}
