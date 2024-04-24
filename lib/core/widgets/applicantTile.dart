import 'dart:convert';

import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/job/data/models/applicant.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/applicantDetails.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../features/profile/presentation/pages/candidateCareerInfo.dart';

class ApplicantTile extends StatefulWidget {
  final Application application;
  final String compaynId;
  final String bookmarkId;
  final User? userData;
  final Function? refresh;
  const ApplicantTile(
      {super.key,
      required this.application,
      required this.compaynId,
      this.bookmarkId = '',
      this.userData,
      this.refresh});

  @override
  State<ApplicantTile> createState() => _ApplicantTileState();
}

class _ApplicantTileState extends State<ApplicantTile> {
  @override
  Widget build(BuildContext context) {
    String bookmarkId = widget.bookmarkId;
    return GestureDetector(
      child: ListTile(
        shape: const Border(
          bottom: BorderSide(color: appDesign.colorPrimary, width: 1),
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.memory(base64Decode(
              widget.application.userData != null
                  ? widget.application.userData!.userImage!.split('base64,')[1]
                  : widget.userData!.userImage != null
                      ? widget.userData!.userImage!.split('base64,')[1]
                      : '',
            )),
          ),
        ),
        title: Row(
          children: [
            Text(
              widget.application.userData?.fullName ??
                  widget.userData!.fullName,
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Text(
            //   '8:15 am',
            //   textAlign: TextAlign.right,
            //   style: TextStyle(
            //     color: Color(0xFF94A3B8),
            //     fontSize: 11,
            //     fontFamily: 'Inter',
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
          ],
        ),
        subtitle: Text(
          timeago.format(DateTime.parse(widget.application.date)),
          style: const TextStyle(
            color: Color(0xFF475569),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                if (widget.application.isBookmarked) {
                  var result = await CompanyDataSource()
                      .deleteBookmark(widget.compaynId, widget.application.id);
                  if (result.data['status'] ==
                      'Bookmarked Application Deleted Successfully') {
                    setState(() {
                      bookmarkId = '';
                    });
                  }
                } else {
                  var result = await CompanyDataSource().bookmarkApplicant(
                      widget.compaynId, widget.application.id);
                  if (result.data['status'] == 'Success') {
                    setState(() {
                      bookmarkId = result.data['data']['_id'];
                    });
                  }
                }
                widget.refresh!();
              },
              icon: Icon(
                widget.application.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                color: appDesign.colorPrimary,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.message,
            //     color: appDesign.colorPrimary,
            //   ),
            // ),
          ],
        ),
      ),
      onTap: () {
        context.navigateTo(
          ApplicantDetailsView(
              jobId: widget.application.jobId,
              applicantId:
                  widget.application.userData?.id! ?? widget.userData!.id!),
        );
      },
    );
  }
}
