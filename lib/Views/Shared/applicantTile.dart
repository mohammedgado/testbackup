import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';

class ApplicantTile extends StatelessWidget {
  const ApplicantTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border(
        bottom: BorderSide(color: appDesign.colorPrimary, width: 1),
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.grey),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('images/profile.jpg'),
        ),
      ),
      title: const Row(
        children: [
          Text(
            'User name',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          // Text(
          //   '8:15 am',
          //   textAlign: TextAlign.right,
          //   style: TextStyle(
          //     color: Color(0xFF94A3B8),
          //     fontSize: 11,
          //     fontFamily: 'Inter',
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
        ],
      ),
      subtitle: const Text(
        'Front end developer',
        style: TextStyle(
          color: Color(0xFF475569),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_outline,
              color: appDesign.colorPrimary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              color: appDesign.colorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
