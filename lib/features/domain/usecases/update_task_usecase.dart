import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';
import 'package:my_daily_tasks/features/domain/repositories/local_repository.dart';

class UpdateTaskUseCase {
  final LocalRepository localRepository;

  UpdateTaskUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.updateTask(task);
  }
}
