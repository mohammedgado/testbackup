import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appBar.dart';
import '../widgets/ExperienceCard.dart';
import '../../../../core/enums/experienceTypeEnum.dart';
import 'addExperiencePopUp.dart';


class ExperienceView extends StatefulWidget {
  final ExperienceType experienceType;
   const ExperienceView({required this.experienceType,Key? key}) : super(key: key);

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
 late LayoutHelper _layoutManager;

  @override
  Widget build(BuildContext context) {
    _layoutManager = LayoutHelper(context);

    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,

      ),
      backgroundColor:Colors.grey.shade200 ,
      body: Padding(

        padding:  EdgeInsets.symmetric(vertical: 16,
            horizontal: _layoutManager.mainHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddExperiencePopup();
                    },
                  );
                },
                child: Text("Add new Experience")),
            ExperienceCard(experienceType: widget.experienceType,),
            ExperienceCard(experienceType: widget.experienceType),
            ExperienceCard(experienceType: widget.experienceType),

          ],

        ),
      ),
    );
  }
}


