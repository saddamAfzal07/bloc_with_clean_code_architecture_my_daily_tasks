import 'package:my_daily_tasks/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class OpenDataBaseUseCase {
  final LocalRepository localRepository;

  OpenDataBaseUseCase({required this.localRepository});
  Future<Database> call() {
    return localRepository.openDataBase();
  }
}
