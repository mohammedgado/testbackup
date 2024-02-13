import 'package:flutter/material.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/messageTile.dart';
import 'package:recruitment/Views/myAccountCandidate.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: ListView(
        children: [
          const MessageTile(),
          const MessageTile(),
          const MessageTile(),
          const MessageTile(),
          const MessageTile(),
          const SizedBox(height: 40),
          const Text(
            'There are no more conversations',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.17,
            ),
          ),
          MaterialButton(
            child: const Text('User Profile'),
            onPressed: () {
              context.navigateTo(const MyAccountCandidateView());
            },
          )
        ],
      ),
    );
  }
}
