import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/core/widgets/mother_page.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/source/domain/entities/task.dart';
import 'package:my_need/source/presentation/list_task/cubit/list_task_cubit.dart';
import 'package:my_need/utils/colors.dart';
import 'package:my_need/utils/font_scale.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTaskCubit cubit = ListTaskCubit();
    return BlocProvider(
      create: (context) => cubit..getListTask(),
      child: MNMotherPage(
        screenTitle: 'Task',
        child: BlocBuilder<ListTaskCubit, ListTaskState>(
            builder: (context, state) {
          if (state is ListTaskInitial) return Container();
          if (state.tasks == null) {
            return const Center(
              child: Text('error'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: margin16),
            itemBuilder: (context, index) =>
                _buildTaskItem(state.tasks![index]),
            itemCount: state.tasks!.length,
          );
        }),
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: padding8),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: borderDefault,
      ))),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: mainGreenColor),
            // child: Image.network(
            //   'https://cdn-icons-png.flaticon.com/512/2098/2098402.png',
            //   fit: BoxFit.contain,
            // ),
          ),
          widthBox12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${task.title}').regularContext14(color: titleTextColor),
                Text('${task.content}').regularContext12(color: bodyTextColor),
              ],
            ),
          ),
          widthBox12,
          const Icon(
            Icons.menu,
            color: inactiveIconColor,
          ),
        ],
      ),
    );
  }
}
