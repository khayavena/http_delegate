import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_example/features/post/bloc/get_posts_event.dart';
import 'package:http_example/features/post/bloc/get_posts_state.dart';
import 'package:http_example/features/post/bloc/result_status.dart';

import '../repository/post_repository.dart';

///Preferable each bloc should focus on single functionality to avoid multiple states
/// in different widgets being updated unnecessarily and also avoid conditional
/// operations on which state to update. Having single responsibility also makes
/// your block clean and simple.

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final UserRepository repository;

  GetUsersBloc({required this.repository}) : super(GetUsersState()) {
    on<GetUsersEvent>((event, emit) async {
      emit(await _getUsersToState(event));
    });
  }

  Future<GetUsersState> _getUsersFailureToState() async {
    return state.buildWith(state: ResultStatus.failed, results: []);
  }

  Future<GetUsersState> _getUsersToState(GetUsersEvent event) async {
    final results = await repository.getPosts();
    if (results.isEmpty) {
      return _getUsersFailureToState();
    }
    return state.buildWith(state: ResultStatus.done, results: results);
  }
}
