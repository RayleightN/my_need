import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/domain/entities/task.dart';
import 'package:my_need/source/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<DataState<List<Task>>> getListTask() {
    /// call api here
    throw UnimplementedError();
  }
}
