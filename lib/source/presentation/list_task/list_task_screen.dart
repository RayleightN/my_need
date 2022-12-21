import 'package:flutter/material.dart';
import 'package:my_need/core/widgets/mother_page.dart';
import 'package:my_need/source/domain/entities/task.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MNMotherPage(
      screenTitle: 'Task',
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _buildTaskItem(
          Task(content: 'content', title: 'title'),
        ),
        itemCount: 10,
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return Column(
      children: [Text('${task.title}'), Text('${task.content}')],
    );
  }
}
