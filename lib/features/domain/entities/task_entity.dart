class TaskEntity {
  int id;
  final String title;
  final String colorIndex;
  final String time;
  final bool isCompletedTask;
  final bool isNotification;
  final String taskType;

  TaskEntity({
    required this.id,
    required this.title,
    required this.colorIndex,
    required this.time,
    required this.isCompletedTask,
    required this.isNotification,
    required this.taskType,
  });
}
