import 'package:flutter/material.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Helper/responsive.dart';
import 'package:recruitment/Views/Shared/CustomLoadingButton.dart';
import 'package:recruitment/Views/apply.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:recruitment/Helper/Constants.dart';

Future<void> jobDescriptionModal(BuildContext context) {
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
          child: Column(
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
                  // To put Status in the middle
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.close,
                        color: Colors.transparent,
                      )),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Front end developer',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 22,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Job matches your profile',
                            style: TextStyle(
                              color: Color(0xFF18B21E),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
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
                          const SizedBox(height: 16),
                          const Row(
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
                          const SizedBox(height: 16),
                          const Row(
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
                          const SizedBox(height: 16),
                          const Row(
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
                          const SizedBox(height: 16),
                          const Align(
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
                          const SizedBox(height: 16),
                          const Text(
                            'The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, ',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            'The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, ',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            'The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, The content is displayed here, ',
                            style: TextStyle(
                              color: Color(0xFF484C52),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
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
                            onPressed: () {
                              context.navigateTo(ApplyView());
                              applyBtnController.reset();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
