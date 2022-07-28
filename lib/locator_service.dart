import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_york_times/core/platform/network_info.dart';
import 'package:new_york_times/feature/data/datasources/news_local_data_sources.dart';
import 'package:new_york_times/feature/data/datasources/news_remote_data_sourse.dart';
import 'package:new_york_times/feature/data/repositories/news_repository_impl.dart';
import 'package:new_york_times/feature/domain/repositories/news_repository.dart';
import 'package:new_york_times/feature/domain/usecases/get_all_news.dart';
import 'package:new_york_times/feature/presentation/bloc/news_list_cubit/news_list_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final serverLocator = GetIt.instance;

Future<void> init() async {
  // Cubit
  serverLocator.registerFactory(
    () => NewsListCubit(
      getAllNews: serverLocator(),
    ),
  );

  //UseCases
  serverLocator.registerLazySingleton(
    () => GetAllNews(
      serverLocator(),
    ),
  );

  //Repository
  serverLocator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      networkInfo: serverLocator(),
      remoteDataSourse: serverLocator(),
      localDataSources: serverLocator(),
    ),
  );

  serverLocator.registerLazySingleton<NewRemoteDataSourse>(
    () => NewsRemoteDataSourseImp(
      client: http.Client(),
    ),
  );

  serverLocator.registerLazySingleton<NewsLocalDataSources>(
    () => NewsLocalSourcesImp(
      sharedPreferences: serverLocator(),
    ),
  );

  //Core
  serverLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      serverLocator(),
    ),
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serverLocator.registerLazySingleton(
    () => sharedPreferences,
  );
  serverLocator.registerLazySingleton(
    () => http.Client(),
  );
  serverLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
