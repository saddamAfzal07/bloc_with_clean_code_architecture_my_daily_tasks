import 'dart:async';

import 'package:my_daily_tasks/features/data/local_dara_source/local_data_source.dart';
import 'package:my_daily_tasks/features/data/model/task_model.dart';
import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImpl implements LocalDataSource {
  late Completer<Database> _dbOpenCompleter;
  Future<Database> get _db async => _dbOpenCompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  Future _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = await join(appDocumentDir.path, "task.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }

  @override
  Future<void> addNewTask(TaskEntity task) async {
    final newTask = TaskModel(
      id: task.id,
      title: task.title,
      colorIndex: task.colorIndex,
      time: task.time,
      isCompletedTask: task.isCompletedTask,
      isNotification: task.isNotification,
      taskType: task.taskType,
    ).tojson();
    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTask() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);
    final recordSnapshots = await _taskStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((task) {
      final taskData = TaskModel.fromJson(task.value);
      taskData.id = task.key;
      return taskData;
    }).toList();
  }

  @override
  Future<void> getNotification(TaskEntity task) {
    // TODO: implement getNotification
    throw UnimplementedError();
  }

  @override
  Future<Database> openDataBase() {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _initDatabase();
    }
    return _dbOpenCompleter.future;
  }

  @override
  Future<void> turnONNotification(TaskEntity task) {
    // TODO: implement turnONNotification
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final newTask = TaskModel(
      id: task.id,
      title: task.title,
      colorIndex: task.colorIndex,
      time: task.time,
      isCompletedTask: task.isCompletedTask == true ? false : true,
      isNotification: task.isNotification,
      taskType: task.taskType,
    ).tojson();
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }
}
