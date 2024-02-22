import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/job.dart';
import 'package:dubai_recruitment/features/job/data/repositories/jobsRepo.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsBloc.dart';
import 'package:dubai_recruitment/features/job/presentation/manager/jobsState.dart';
import 'package:dubai_recruitment/features/job/presentation/widgets/jobCardShimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/searchField.dart';
import '../manager/jobsEvent.dart';
import '../widgets/jobCard.dart';

class FindJobHomeView extends StatelessWidget {
  const FindJobHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
          appBar: AppBar(), widgetContext: context, showBackButton: false),
      body: RepositoryProvider<JobsRepo>(
        create: (context) => JobsRepo(jobRemoteDataSource: JobRemoteDataSource()),

        child: BlocProvider(
          create: (context) => JobsBloc(context.read<JobsRepo>())..add(GetAllJobsEvent()),

          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(),
                vertical: 16),
            child: Column(
              children: [
                SearchInput(),
                SizedBox(height: 8),
                SearchInput(
                  isLocation: true,
                ),

                BlocBuilder<JobsBloc, JobsState>(
                  builder: (context, state) {
                    if (state is JobsLoadingState) {

                      return  Expanded(

                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index){

                            return JobCardShimmer();
                          },

                        ),
                      );
                    } else
                      if (state is JobsReceivedDataState<List<Job>>){

                        return Expanded(

                          child: ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (context,index){

                              return JobCard(job: state.data[index]);
                            },

                          ),
                        );
                    }else
                      if(state is JobsErrorState){
                        //TODO: ERROR PAGE
                        return Text(state.msg);
                      }

                        return SizedBox();

                      },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
