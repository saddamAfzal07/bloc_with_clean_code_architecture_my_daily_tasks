import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    final int? id,
    final String? title,
    final String? colorIndex,
    final String? time,
    final String? isCompletedTask,
    final String? isNotification,
    final String? taskType,
  }) : super(
            id: id!,
            colorIndex: colorIndex!,
            isCompletedTask: isCompletedTask!,
            isNotification: isNotification!,
            time: time!,
            title: title!,
            taskType: taskType!);
  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      colorIndex: json['colorIndex'],
      time: json['time'],
      isCompletedTask: json['isCompletedTask'],
      isNotification: json['isNotification'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'title': title,
      'colorIndex': colorIndex,
      'time': time,
      'isCompletedTask': isCompletedTask,
      'isNotification': isNotification,
    };
  }
}
