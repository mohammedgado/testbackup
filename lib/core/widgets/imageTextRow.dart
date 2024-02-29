import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/company/presentation/pages/companyProfile.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';

class ImageTextRow extends StatelessWidget {
  final Company company;
  final String imgUrl;


  ImageTextRow({super.key, required this.company, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.popUpPage(CompanyProfileView(company: company));
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey)),
            child: Image.network(
                imgUrl),
          ),
          SizedBox(width: 8),
          Text(
            company.companyName,
            style: const TextStyle(
              color: Color(0xFF484C52),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }


}
