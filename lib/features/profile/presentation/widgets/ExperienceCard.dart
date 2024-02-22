import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

import '../../../../core/enums/experienceTypeEnum.dart';
import '../../../../core/handlers/ExperienceTypeHandler.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceType experienceType;
   ExperienceCard({
    super.key, required this.experienceType,
  });
  late String name;
  late String position;
  late ExperienceTypeHandler experienceTypeHandler;



  @override
  Widget build(BuildContext context) {
    experienceTypeHandler = ExperienceTypeHandler();
    name = experienceTypeHandler.name(experienceType);
    position = experienceTypeHandler.position(experienceType);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,

                style: TextStyle(
                fontWeight: FontWeight.w600
              ),

              ),
              Icon(Icons.edit,color: appDesign.colorPrimary,)
            ],
          ),
          Text(
              position,
            style: TextStyle(
              fontWeight: FontWeight.w500
            ),
          ),
          Visibility(
            visible: experienceType == ExperienceType.work ? false : true,
              child:Text(
            "Grade",
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),
          ) ),
          Text(
            "Jul 2023-May 2024",
            style:TextStyle(color: Colors.grey.shade500) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: experienceType == ExperienceType.work ? true : false,
                child: Container(
                  width: 250,
                  child: Text("Comment,Comment,"
                      "Comment,Comment,Comment,Comment,"
                      "Comment,Comment,",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,

                  ),
                ),
              ),
              Icon(Icons.delete,color: appDesign.red,)
            ],
          ),


        ],
      ),
    );
  }
}