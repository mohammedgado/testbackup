import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Helper/responsive.dart';
import 'package:recruitment/Views/Shared/CustomLoadingButton.dart';
import 'package:recruitment/Views/Shared/chips.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key});

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
          ModalBottomSheet(context);
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
                color: Color(0x26000000),
                blurRadius: 4,
                offset: Offset(0, 2),
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
                    const Text(
                      'Front end developer',
                      style: TextStyle(
                        color: appDesign.colorText,
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
                      color: appDesign.colorPrimary,
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: appDesign.colorAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'LinkYou.ca',
                      style: TextStyle(
                        color: Color(0xFF484C52),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    TextChip(
                      text: 'Junior',
                    ),
                    TextChip(
                      text: 'Full-time',
                    ),
                    TextChip(
                      text: 'Remote',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: appDesign.colorAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Toronto, Canada',
                      style: TextStyle(
                        color: Color(0xFF484C52),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Posted 4 days ago',
                      style: TextStyle(
                        color: appDesign.colorAccent,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> ModalBottomSheet(BuildContext context) {
    final RoundedLoadingButtonController applyBtnController =
        RoundedLoadingButtonController();
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        showDragHandle: true,
        isDismissible: false,
        enableDrag: false,
        builder: (BuildContext context) {
          return Container(
            height: Dimensions.heightPercentage(context, 90),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close)),
                    const Text(
                      'Status',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                      ),
                    ),
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Front end developer',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.business,
                                color: appDesign.colorAccent,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'LinkYou.ca',
                                style: TextStyle(
                                  color: Color(0xFF484C52),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_on_outlined,
                            color: appDesign.colorAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Toronto, Canada',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Experience level:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Junior',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Job type:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Full time',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Job location:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Remote',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Job Description:',
                          style: TextStyle(
                            color: appDesign.colorPrimary,
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, ',
                        style: TextStyle(
                          color: Color(0xFF484C52),
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CustomLoadingButton(
                        removePadding: true,
                        controller: applyBtnController,
                        // text: AppLocalizations.of(context)!.logIn,
                        text: 'Apply',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
