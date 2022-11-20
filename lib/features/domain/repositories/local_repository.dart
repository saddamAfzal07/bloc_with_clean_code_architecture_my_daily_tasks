import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';
import 'package:sembast/sembast.dart';

abstract class LocalRepository {
  Future<void> addNewTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<List<TaskEntity>> getAllTask();
  Future<void> getNotification(TaskEntity task);
  Future<Database> openDataBase();
  Future<void> turnONNotification(TaskEntity task);
}
