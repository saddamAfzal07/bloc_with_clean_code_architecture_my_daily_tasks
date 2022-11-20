import 'package:my_daily_tasks/features/data/local_dara_source/local_data_source.dart';
import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';
import 'package:my_daily_tasks/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class LocalRepositoryImp extends LocalRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImp(this.localDataSource);
  @override
  Future<void> addNewTask(TaskEntity task) async =>
      localDataSource.addNewTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) async =>
      localDataSource.deleteTask(task);

  @override
  Future<List<TaskEntity>> getAllTask() async => localDataSource.getAllTask();

  @override
  Future<void> getNotification(TaskEntity task) async =>
      localDataSource.getNotification(task);

  @override
  Future<Database> openDataBase() async => localDataSource.openDataBase();

  @override
  Future<void> turnONNotification(TaskEntity task) async =>
      localDataSource.turnONNotification(task);

  @override
  Future<void> updateTask(TaskEntity task) async =>
      localDataSource.updateTask(task);
}
