import 'package:get_it/get_it.dart';
import 'package:najme/CA/Data/DataSource/subjects_data_source.dart';
import 'package:najme/CA/Domain/Repositories/subjects_repo.dart';
import 'package:najme/CA/Domain/UseCases/subjects_use_case.dart';

import '../../Data/RepositoriesImpl/subjects_repo_impl.dart';
import '../../Features/Home/Cubit/home_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Cubit
    sl.registerFactory(() => HomeCubit());

    /// Use Cases
    sl.registerLazySingleton(() => GetSubjectsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<SubjectsRepository>(
        () => SubjectsRepositoryImpl(sl()));

    /// Data Source
    sl.registerLazySingleton<SubjectsDataSource>(
        () => GetSubjectsDataSourceImpl());
  }
}
