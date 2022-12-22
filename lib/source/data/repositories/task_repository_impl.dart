import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/data/data_sources/task_api_service.dart';
import 'package:my_need/source/domain/repositories/task_repository.dart';

import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskApiService _taskApiService = TaskApiService();
  TaskRepositoryImpl();
  @override
  Future<DataState<List<TaskModel>>> getListTask() async {
    try {
      var snap = await _taskApiService.getListTask();
      if (snap.docs.isNotEmpty) {
        return DataSuccess(
            snap.docs.map((e) => TaskModel.fromSnap(e)).toList());
      }
      return const DataFailed('empty data');
    } catch (err) {
      return DataFailed(err);
    }
  }
}
