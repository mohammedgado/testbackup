import 'package:dubai_recruitment/core/enums/jobType.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/widgets/iconTextRow.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/widgets/chips.dart';
import '../../../company/presentation/pages/companyProfile.dart';
import '../../data/models/job.dart';
import '../pages/jobApplicants.dart';
import '../pages/jobView.dart';
import '../pages/postJob.dart';


class JobCard extends StatelessWidget {

  final bool isAdmin;
  final Job job ;
  const JobCard({Key? key, this.isAdmin = false, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: () {
          isAdmin
              ? context.navigateTo(const JobApplicantsView())
              : context.popUpPage(JobView(job: job,));
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      job.title,
                      style: TextStyle(
                        color: appDesign.colorText,
                        fontSize: 17,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    isAdmin
                        ? Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          color: appDesign.red,
                        ),
                        IconButton(
                          onPressed: () {
                            context.navigateTo(const PostJobView());
                          },
                          icon: const Icon(Icons.edit),
                          color: appDesign.colorPrimary,
                        ),
                      ],
                    )
                        : IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
                      color: appDesign.colorPrimary,
                    ),
                  ],
                ),
                isAdmin
                    ? Row(
                  children: [
                    Icon(
                      Icons.paste,
                      color: appDesign.colorAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '99+ Applicants',
                      style: TextStyle(
                        color: Color(0xFF484C52),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
                    : GestureDetector(
                  onTap: () {
                    context.popUpPage(CompanyProfileView(company: job.company, ));
                  },
                  child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Container(height: 50,width: 50,
                    
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(15),
                       border: Border.all(color: Colors.grey)
                     ),

                     child: Image.network("https://www.linkyou.ca/wp-content/uploads/2023/10/cropped-Transparency-1-1024x281-1.png"),
                     ),
                      SizedBox(width: 8),
                      Text(
                        'LinkYou.ca',
                        style: TextStyle(
                          color: appDesign.colorText,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    TextChip(
                      text: JobType.toStringValue(job.jobType),),
                    TextChip(
                      text: job.category.categoryName,)
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconTextRow(icon: Icons.pin_drop_outlined, txt: job.company.address)
                   ,
                    //Text("Open in: ${context.formatDateMonthDay(job.openDate)} - "),
                   // Text(context.formatDateMonthDay(job.closeDate)),

                    Spacer(),
                    Text(
                      context.getTimeDifference(job.createdAt),
                      style: const TextStyle(
                        color: appDesign.colorAccent,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}