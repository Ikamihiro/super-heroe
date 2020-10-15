import 'package:coolsql/core/managers/http/http_manager.dart';
import 'package:coolsql/core/managers/local/local_manager.dart';
import 'package:coolsql/src/data/datasources/heroi_local.dart';
import 'package:coolsql/src/presentation/blocs/heroi/heroi_bloc.dart';
import 'src/data/datasources/heroi_http.dart';
import 'src/data/repositories/heroi_repository.dart';
import 'src/domain/repositories/heroi_repository.dart';
import 'src/domain/usecases/usecases.dart';
import 'package:get_it/get_it.dart';

/// Registrador de objetos instanciados,
/// usado para registrar as dependências da aplicação
final getIt = GetIt.instance;

/// Método para registrar as dependências da aplicação
/// utilizando o conceito de `Singleton`
Future<void> setup() async {
  await setupExternal();
  await setupDataSources();
  await setupRepositories();
  await setupUseCases();
  await setupBloc();
}

/// Método para registrar os `BLoCs`
/// utilizando `Singleton`
Future<void> setupBloc() async {
  getIt.registerLazySingleton<HeroiBloc>(
    () => HeroiBloc(
      pegarHeroiPorNome: getIt<PegarHeroiPorNome>(),
      pegarHeroisPesquisados: getIt<PegarHeroisPesquisados>(),
    ),
  );
}

/// Método para registrar os `Managers`
/// utilizando `Singleton`
Future<void> setupExternal() async {
  getIt.registerLazySingleton<LocalManager>(
    () => LocalManagerImpl(),
  );
  getIt.registerLazySingleton<HttpManager>(
    () => HttpManagerImpl(),
  );
}

/// Método para registrar os `DataSources`
/// utilizando `Singleton`
Future<void> setupDataSources() async {
  // DataSources
  getIt.registerLazySingleton<HeroiRemoteSource>(
    () => HeroiRemoteSourceImpl(
      manager: getIt<HttpManager>(),
    ),
  );
  getIt.registerLazySingleton<HeroiLocalSource>(
    () => HeroiLocalSourceImpl(
      manager: getIt<LocalManager>(),
    ),
  );
}

/// Método para registrar os `Repositories`
/// utilizando `Singleton`
Future<void> setupRepositories() async {
  // Repositories
  getIt.registerLazySingleton<HeroiRepository>(
    () => HeroiRepositoryImpl(
      remoteSource: getIt<HeroiRemoteSource>(),
      localSource: getIt<HeroiLocalSource>(),
    ),
  );
}

/// Método para registrar os `UseCases`
/// utilizando `Singleton`
Future<void> setupUseCases() async {
  // UseCases
  getIt.registerLazySingleton(
    () => PegarHeroisPesquisados(
      repository: getIt<HeroiRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PegarHeroiPorNome(
      repository: getIt<HeroiRepository>(),
    ),
  );
}
