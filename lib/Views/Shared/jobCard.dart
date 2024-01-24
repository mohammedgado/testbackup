import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Views/Shared/chips.dart';
import 'package:recruitment/Views/jobDescription.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: () {
          jobDescriptionModal(context);
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
}
