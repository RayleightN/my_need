import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_task_state.dart';

class ListTaskCubit extends Cubit<ListTaskState> {
  ListTaskCubit() : super(ListTaskInitial());
}
