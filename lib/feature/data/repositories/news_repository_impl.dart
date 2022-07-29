import 'package:new_york_times/core/error/exception.dart';
import 'package:new_york_times/core/platform/network_info.dart';
import 'package:new_york_times/feature/data/datasources/news_local_data_sources.dart';
import 'package:new_york_times/feature/data/datasources/news_remote_data_sourse.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:new_york_times/feature/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  late final NewRemoteDataSourse remoteDataSourse;
  late final NetworkInfo networkInfo;
  late final NewsLocalDataSources localDataSources;

  NewsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSourse,
    required this.localDataSources,
  });
  @override
  Future<Either<Failure, List<NewsEntity>>> getAllNews(page) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await remoteDataSourse.getAllNews();
        // localDataSources.newsToCash(remoteNews);
        return Right(remoteNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationNews = await localDataSources.getLastNewsFromCash();
        return Right(locationNews);
      } on CasheException {
        return Left(CasheFailure());
      }
    }
  }
}
