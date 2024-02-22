import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

Widget dashboardItem( {
  required String title,
  required Color color,
  required IconData icon,
  required String number,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: appDesign.colorAccent,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}