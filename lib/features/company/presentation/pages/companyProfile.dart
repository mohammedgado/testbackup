import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/exitButton.dart';
import 'package:dubai_recruitment/core/widgets/label_value_row.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/widgets/appBar.dart';
import '../../data/models/company.dart';

class CompanyProfileView extends StatelessWidget {

  final Company company;
   CompanyProfileView({super.key,required this.company});
  late LayoutHelper layoutHelper;

  @override
  Widget build(BuildContext context) {
    layoutHelper = LayoutHelper(context);
    return Scaffold(


      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: layoutHelper.mainHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            Center(
              child: Stack(
                children: [

                  Container(


                    child: Image.network(
                        "https://www.linkyou.ca/wp-content/uploads/2023/10/cropped-Transparency-1-1024x281-1.png"
                    ,fit: BoxFit.cover,

                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          // chooseImage();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: appDesign.colorAccent,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExitButton(),
                ],
              ),
            ),
            const SizedBox(height: 24),
             Center(
               child: Text(
                company.companyName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    color: appDesign.colorPrimary),
            ),
             ),
            const SizedBox(height: 75),
            LabelValueRow(labelText: "Location",
                valueText: company.address,
              icon: Icons.pin_drop,

            ),

            Divider(height: 30,color: Colors.grey,),
            LabelValueRow(
              icon: Icons.history,
                labelText: "Created from",
                valueText: context.getTimeDifference(company.createdAt)
            ),
            Divider(height: 30,color: Colors.grey,),

            LabelValueRow(
              icon: Icons.phone,
                labelText: "Phone number",
                valueText: company.phone
            ),
            Divider(height: 30,color: Colors.grey,),

            LabelValueRow(
              icon: Icons.category_outlined,
                labelText: "Category",
                valueText: ""
            ),
            Divider(height: 30,color: Colors.grey,),




          ],
        ),
      ),
    );
  }
}
