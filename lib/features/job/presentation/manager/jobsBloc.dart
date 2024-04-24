import 'package:bloc/bloc.dart';

import '../../data/repositories/jobsRepo.dart';
import 'jobsEvent.dart';
import 'jobsState.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepo jobsRepo;

  //TODO: initial state happen at first we must pass it to the bloc constructor
  //TODO: inject JobsRepo in the block class to can use it here
  JobsBloc(this.jobsRepo) : super(JobsLoadingState()) {
    //TODO: this take the event that you want to do
    //TODO: async because it network call
    on<GetAllJobsEvent>((event, emit) async {
      emit(JobsLoadingState());
      try {
        //TODO: because it a lengthy operation must be await
        final jobs = await jobsRepo.getAllJobs();
        //TODO: change the state and send the data in emit
        emit(JobsReceivedDataState(data: jobs));
      } catch (error) {
        emit(JobsErrorState(msg: error.toString()));
      }
    });

    on<ApplyJobEvent>((event, emit) async {
      emit(JobsLoadingState());
      try {
        final createdJobResponse = await jobsRepo.applyJob(event.jobId);
        emit(JobsReceivedDataState(data: createdJobResponse));
      } catch (error) {
        emit(JobsErrorState(msg: error.toString()));
      }
    });

    on<FilterJobsEvent>(
      (event, emit) async {
        emit(JobsLoadingState());
        try {
          //TODO: because it a lengthy operation must be await
          final jobs =
              await jobsRepo.filterJobs(event.jobTitle, event.jobDistrict);
          //TODO: change the state and send the data in emit
          emit(JobsReceivedDataState(data: jobs));
        } catch (error) {
          emit(JobsErrorState(msg: error.toString()));
        }
      },
    );
  }
}
