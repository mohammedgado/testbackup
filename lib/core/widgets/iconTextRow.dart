import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String txt;
  final double? textSize;
  final double? iconSize;
  final Color? iconColor;
  final Color? textColor;
  final bool iconFirst;
  final double? width;

  const IconTextRow({Key? key,required this.icon
    ,required this.txt,
    this.iconSize,
    this.iconColor,
    this.textSize
    ,this.textColor,
    this.iconFirst = true,
    this.width

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  iconFirst  ? Row(

        children: [
          Icon(
            icon,
            color: iconColor ?? appDesign.colorAccent,
            size: iconSize ?? 22,
          ),
          SizedBox(width: 8,),
          Container(
            width: width ?? 120,
            child: Text(

              txt,

              //"${UserData.language == "en" ? ad.town!.name : ad.town!.nameArabic! },${ UserData.language == "en" ? ad.town!.city!.name : ad.town!.city!.nameArabic }",
              style: TextStyle(
                  fontSize: textSize?? 15,
                  fontWeight: FontWeight.normal,
                  color: textColor ?? appDesign.colorPrimaryDark,
                  overflow: TextOverflow.visible
              ),
              maxLines: 1,
            ),
          ),


        ]) :
    Row(

        children: [

          Container(

            width: 120,
            child: Text(

              txt,

              //"${UserData.language == "en" ? ad.town!.name : ad.town!.nameArabic! },${ UserData.language == "en" ? ad.town!.city!.name : ad.town!.city!.nameArabic }",
              style: TextStyle(
                  fontSize: textSize?? 15,
                  fontWeight: FontWeight.normal,
                  color: textColor ?? appDesign.colorPrimaryDark,
                  overflow: TextOverflow.visible
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(width: 8,),
          Icon(
            icon,
            color: iconColor ?? appDesign.colorAccent,
            size: iconSize ?? 15,
          ),



        ]);
  }
}
