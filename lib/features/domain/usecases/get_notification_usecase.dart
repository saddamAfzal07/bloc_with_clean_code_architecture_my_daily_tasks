import 'package:my_daily_tasks/features/domain/entities/task_entity.dart';
import 'package:my_daily_tasks/features/domain/repositories/local_repository.dart';

class GetNotificationUseCase {
  final LocalRepository localRepository;

  GetNotificationUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.getNotification(task);
  }
}
