import 'package:equatable/equatable.dart';


//we use equatable to make sure that no more than one instance of this

abstract class JobsEvent extends Equatable {}

class GetAllJobsEvent extends JobsEvent {

  @override
  List<Object?> get props => [];

}

class ApplyJobEvent extends JobsEvent {
  String jobId;

  ApplyJobEvent(this.jobId);

  @override
  List<Object?> get props => [jobId];

}