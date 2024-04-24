import 'package:dubai_recruitment/core/enums/jobType.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/widgets/iconTextRow.dart';
import 'package:dubai_recruitment/core/widgets/imageTextRow.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/widgets/chips.dart';
import '../../../company/presentation/pages/companyProfile.dart';
import '../../data/models/job.dart';
import '../pages/jobApplicants.dart';
import '../pages/jobView.dart';
import '../pages/postJob.dart';

class JobCard extends StatefulWidget {
  final bool isAdmin;
  final Job job;
  final Function? refresh;
  bool isBookmarked;
  JobCard(
      {Key? key,
      this.isAdmin = false,
      required this.job,
      this.refresh,
      this.isBookmarked = false})
      : super(key: key);

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: () {
          widget.isAdmin
              ? context.navigateTo(JobApplicantsView(
                  companyId: widget.job.company.id,
                  jobId: widget.job.id,
                ))
              : context.popUpPage(
                  JobView(
                    job: widget.job,
                  ),
                );
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
                      widget.job.title,
                      style: const TextStyle(
                        color: appDesign.colorText,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.isAdmin
                        ? Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await JobRemoteDataSource()
                                      .deleteJob(widget.job.id);
                                  widget.refresh!();
                                },
                                icon: const Icon(Icons.delete),
                                color: appDesign.red,
                              ),
                              IconButton(
                                onPressed: () {
                                  context.navigateTo(PostJobView(
                                    jobData: widget.job,
                                    isEdit: true,
                                    refresh: widget.refresh,
                                  ));
                                },
                                icon: const Icon(Icons.edit),
                                color: appDesign.colorPrimary,
                              ),
                            ],
                          )
                        : IconButton(
                            onPressed: () async {
                              if (widget.isBookmarked) {
                                await JobRemoteDataSource()
                                    .unFavoriteJob(widget.job.id);
                                widget.refresh!();
                              } else {
                                await JobRemoteDataSource()
                                    .favoriteJob(widget.job.id)
                                    .then((value) {
                                  // if(value.r)
                                  print(value);
                                  setState(() {
                                    widget.isBookmarked = true;
                                  });
                                });
                              }
                            },
                            icon: Icon(widget.isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_outline),
                            color: appDesign.colorPrimary,
                          ),
                  ],
                ),
                widget.isAdmin
                    ? const Row(
                        children: [
                          Icon(
                            Icons.paste,
                            color: appDesign.colorAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Applicants',
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
                          context.popUpPage(
                            CompanyProfileView(
                              company: widget.job.company,
                            ),
                          );
                        },
                        child: ImageTextRow(
                          company: widget.job.company,
                          imgUrl:
                              "https://www.linkyou.ca/wp-content/uploads/2023/10/cropped-Transparency-1-1024x281-1.png",
                        ),
                      ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextChip(
                        text: JobType.toStringValue(widget.job.jobType),
                      ),
                      TextChip(
                        text: widget.job.category.categoryName,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconTextRow(
                        icon: Icons.pin_drop_outlined,
                        txt: widget.job.company.address),
                    //Text("Open in: ${context.formatDateMonthDay(job.openDate)} - "),
                    // Text(context.formatDateMonthDay(job.closeDate)),

                    const Spacer(),
                    Text(
                      context.getTimeDifference(widget.job.createdAt),
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
