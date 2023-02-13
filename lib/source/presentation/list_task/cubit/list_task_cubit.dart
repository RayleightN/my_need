import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_need/source/injector.dart';

import '../../../domain/usecases/get_list_task_usecase.dart';
import '../../../domain/entities/task.dart';

part 'list_task_state.dart';

class ListTaskCubit extends Cubit<ListTaskState> {
  final GetListTaskUseCase _getListTaskUseCase = injector<GetListTaskUseCase>();
  ListTaskCubit() : super(ListTaskInitial());

  void getListTask() async {
    final res = await _getListTaskUseCase.call();
    if (res.data != null && res.data!.isNotEmpty) {
      emit(state.copyWith(tasks: res.data));
    }
  }
}
