import 'package:get_it/get_it.dart';
import 'package:my_need/core/app_repository.dart';
import 'package:my_need/source/core/usecases/get_list_task_usecase.dart';
import 'package:my_need/source/core/usecases/login_usecase.dart';
import 'package:my_need/source/data/repositories/auth_repository_impl.dart';
import 'package:my_need/source/data/repositories/task_repository_impl.dart';
import 'package:my_need/source/domain/repositories/auth_repository.dart';
import 'package:my_need/source/domain/repositories/task_repository.dart';

GetIt injector = GetIt.instance;

void setupLocator() {
  // Dependencies
  injector.registerSingleton<TaskRepository>(TaskRepositoryImpl());
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // UseCases
  injector
      .registerSingleton<GetListTaskUseCase>(GetListTaskUseCase(injector()));
  injector.registerSingleton<LoginUsecase>(LoginUsecase(injector()));
  // repositories
  injector.registerSingleton<AppRepository>(AppRepository());
}
