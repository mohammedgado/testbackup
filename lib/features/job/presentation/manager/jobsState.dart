import 'package:equatable/equatable.dart';

import '../../data/models/job.dart';






//TODO: we use equatable to make sure that no more than one instance of this

abstract class JobsState extends Equatable {}


class JobsLoadingState extends JobsState {
  @override
  // TODO: implement props For Equatable
  List<Object?> get props => [];


}

class JobsReceivedDataState<T> extends JobsState {
 final T data;

  //TODO: We created this constructor because data must be with me to be received data state
  JobsReceivedDataState({ required this.data});


  @override
  // TODO: implement props For Equatable to never do two instance of JobssData
  List<Object?> get props => [data];


}

class JobsErrorState extends JobsState {
 final String msg;

  //TODO: we created this constructor because we need the error message in this state
  JobsErrorState({required this.msg});

  @override
  // TODO: implement props For Equatable
  List<Object?> get props => [];


}