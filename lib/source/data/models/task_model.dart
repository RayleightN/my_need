import 'package:my_need/source/domain/entities/task.dart';

class TaskModel extends Task {
  const TaskModel({
    String? id,
    String? title,
    String? content,
  }) : super(
          id: id,
          title: title,
          content: content,
        );
  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
