import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {

  const ExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async {
        Navigator.pop(context);
        print("Tapped");
      },
      child: Container(
        padding: EdgeInsets.all(3),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),
        //   color: Colors.white,
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.2), // Shadow color
        //       spreadRadius: 2, // Spread radius
        //       blurRadius: 5, // Blur radius
        //       offset: Offset(0, 3), // Offset in the x, y direction
        //     ),
        //   ],
        // ),
        child: Icon(
          Icons.close_sharp,
          color: Colors.black,
          size: 23,
        ),
      )
      ,
    );
  }
}
