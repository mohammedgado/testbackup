import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/exitButton.dart';
import 'package:dubai_recruitment/core/widgets/iconTextRow.dart';
import 'package:dubai_recruitment/core/widgets/imageTextRow.dart';
import 'package:dubai_recruitment/core/widgets/label_value_row.dart';
import 'package:dubai_recruitment/core/widgets/roundedLoadingButton.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/repositories/jobsRepo.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsBloc.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsEvent.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/enums/jobType.dart';
import '../../../../core/layoutHelpers/responsive.dart';
import '../../../../core/widgets/CustomLoadingButton.dart';
import '../../data/models/job.dart';
import 'apply.dart';

class JobView extends StatelessWidget {
  final Job job;
  JobView({Key? key, required this.job}) : super(key: key);
  late LayoutHelper layoutHelper;
  final buttonController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    layoutHelper = LayoutHelper(context);
    return Scaffold(
      body: RepositoryProvider(
        create: (context) =>
            JobsRepo(jobRemoteDataSource: JobRemoteDataSource()),
        child: BlocProvider(
          create: (context) => JobsBloc(context.read<JobsRepo>()),
          child: Container(
              height: context.screenHeight,
              color: appDesign.colorPrimary,
              padding: EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: layoutHelper.mainHorizontalPadding()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in the x, y direction
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ExitButton(),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Text(
                          context.getTimeDifference(job.createdAt),
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ),
                      Text(
                        job.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      ImageTextRow(
                          company: job.company,
                          imgUrl:
                              "https://www.linkyou.ca/wp-content/uploads/2023/10/cropped-Transparency-1-1024x281-1.png"),
                      const SizedBox(height: 16),
                      IconTextRow(
                        txt: job.category.categoryName,
                        icon: Icons.format_list_bulleted_outlined,
                        width: 200,
                      ),
                      const SizedBox(height: 16),
                      IconTextRow(
                          txt: JobType.toStringValue("${job.jobType}"),
                          icon: Icons.shopping_bag),
                      const SizedBox(height: 16),
                      IconTextRow(
                          txt: job.company.address, icon: Icons.pin_drop),
                      const SizedBox(height: 16),
                      const SizedBox(height: 36),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Text(
                              'Job Description',
                              style: TextStyle(
                                color: appDesign.colorPrimary,
                                fontSize: 17,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(job.description)
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<JobsBloc, JobsState>(
                        builder: (context, state) {
                          if (state is JobsReceivedDataState) {
                            print("ENter SUCC");
                            buttonController.success();
                          } else if (state is JobsErrorState) {
                            //Todo: Erorr handling
                            buttonController.reset();
                            //return  Text(state.msg);
                          }

                          return CustomLoadingButton(
                              controller: buttonController,
                              text: "Apply",
                              onPressed: () async {
                                BlocProvider.of<JobsBloc>(context)
                                    .add(ApplyJobEvent(job.id));
                              });
                        },
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
