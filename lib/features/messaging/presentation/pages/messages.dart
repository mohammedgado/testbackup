import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appBar.dart';
import '../../../profile/presentation/pages/myAccountCandidate.dart';
import '../widgets/messageTile.dart';

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
        hideActions: true,
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
            child: const Text('Print Token'),
            onPressed: () {
              print(UserData.token);
            },
          )
        ],
      ),
    );
  }
}
