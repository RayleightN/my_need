import 'package:my_need/source/domain/entities/task.dart';

import '../../core/resources/data_state.dart';

abstract class TaskRepository {
  Future<DataState<List<Task>>> getListTask();
}
