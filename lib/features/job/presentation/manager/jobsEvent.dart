import 'package:equatable/equatable.dart';

//we use equatable to make sure that no more than one instance of this

abstract class JobsEvent extends Equatable {}

class GetAllJobsEvent extends JobsEvent {
  @override
  List<Object?> get props => [];
}

class FilterJobsEvent extends JobsEvent {
  final String jobTitle;
  final String jobDistrict;
  FilterJobsEvent(this.jobTitle, this.jobDistrict);
  @override
  List<Object?> get props => [jobTitle, jobDistrict];
}

class ApplyJobEvent extends JobsEvent {
  String jobId;

  ApplyJobEvent(this.jobId);

  @override
  List<Object?> get props => [jobId];
}
