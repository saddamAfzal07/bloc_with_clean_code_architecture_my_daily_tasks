import 'package:my_daily_tasks/features/domain/repositories/local_repository.dart';

class GetAllTaskUseCase {
  final LocalRepository localRepository;

  GetAllTaskUseCase({required this.localRepository});
  Future<void> call() {
    return localRepository.getAllTask();
  }
}
