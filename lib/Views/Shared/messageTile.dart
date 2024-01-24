import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key});

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
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0x3F5AA5D8),
            width: 1,
          ),
        ),
        child: Image.asset('images/linkyou.png'),
        // color: Colors.white,
      ),
      title: const Row(
        children: [
          Text(
            'LinkYou.ca',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            '8:15 am',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      subtitle: const Text(
        'Are you available for an interview?',
        style: TextStyle(
          color: Color(0xFF475569),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const CircleAvatar(
        backgroundColor: appDesign.colorAccent,
        radius: 12,
        child: Text(
          '2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
