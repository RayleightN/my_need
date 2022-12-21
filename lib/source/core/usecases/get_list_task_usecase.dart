import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/core/usecases/usecase.dart';
import 'package:my_need/source/domain/entities/task.dart';
import 'package:my_need/source/domain/repositories/task_repository.dart';

class GetListTaskUseCase implements UseCase<DataState<List<Task>>, dynamic> {
  final TaskRepository _taskRepository;
  GetListTaskUseCase(this._taskRepository);

  @override
  Future<DataState<List<Task>>> call({dynamic params}) {
    return _taskRepository.getListTask();
  }
}
