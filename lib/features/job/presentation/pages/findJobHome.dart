import 'dart:math';

import 'dart:async';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/constant.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/job.dart';
import 'package:dubai_recruitment/features/job/data/repositories/jobsRepo.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsBloc.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsState.dart';
import 'package:dubai_recruitment/features/job/presentation/widgets/jobCardShimmer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/searchField.dart';
import '../manager/jobsEvent.dart';
import '../widgets/jobCard.dart';

class FindJobHomeView extends StatefulWidget {
  const FindJobHomeView({super.key});

  @override
  State<FindJobHomeView> createState() => _FindJobHomeViewState();
}

class _FindJobHomeViewState extends State<FindJobHomeView> {
  TextEditingController jobTitleC = TextEditingController();
  TextEditingController districtC = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose4
    jobTitleC.dispose();
    districtC.dispose();
    super.dispose();
  }

  bool _hasTextDistrict = false;

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: false,
      ),
      body: RepositoryProvider<JobsRepo>(
        create: (context) =>
            JobsRepo(jobRemoteDataSource: JobRemoteDataSource()),
        child: BlocProvider(
          create: (context) =>
              JobsBloc(context.read<JobsRepo>())..add(GetAllJobsEvent()),
          child: BlocBuilder<JobsBloc, JobsState>(
            builder: (context, state) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 16,
                ),
                children: [
                  SearchInput(
                    controller: jobTitleC,
                    onSubmitted: (jobTitle) {
                      context
                          .read<JobsBloc>()
                          .add(FilterJobsEvent(jobTitleC.text, districtC.text));
                    },
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey.withAlpha(120),
                      ),
                    ),
                    child: DropdownMenu(
                        controller: districtC,
                        leadingIcon: const Icon(
                          Icons.location_pin,
                          color: appDesign.colorAccent,
                        ),
                        onSelected: (a) {
                          setState(() {
                            _hasTextDistrict = true;
                          });
                          context.read<JobsBloc>().add(
                              FilterJobsEvent(jobTitleC.text, districtC.text));
                        },
                        trailingIcon: _hasTextDistrict
                            ? InkWell(
                                child: const Icon(Icons.clear),
                                onTap: () {
                                  setState(() {
                                    _hasTextDistrict = false;
                                  });
                                  districtC.clear();
                                  context.read<JobsBloc>().add(FilterJobsEvent(
                                      jobTitleC.text, districtC.text));
                                },
                              )
                            : null,
                        expandedInsets: const EdgeInsets.all(0),
                        hintText: 'Enter location',
                        enableSearch: true,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                        ),
                        dropdownMenuEntries: [
                          ...Constant.dubaiDistricts
                              .map((e) => DropdownMenuEntry(value: e, label: e))
                        ]),
                  ),
                  // SearchInput(
                  //   controller: districtC,
                  //   isLocation: true,
                  //   onSubmitted: (district) {
                  //     context.read<JobsBloc>().add(
                  //         FilterJobsEvent(jobTitleC.text, districtC.text));
                  //   },
                  // ),
                  if (state is JobsLoadingState)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const JobCardShimmer();
                      },
                    )
                  else if (state is JobsReceivedDataState<List<Job>>)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return JobCard(job: state.data[index]);
                      },
                    )
                  else if (state is JobsErrorState)
                    Text(state.msg) // TODO: ERROR PAGE
                  else
                    const SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
