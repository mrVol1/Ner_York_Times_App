import 'package:dartz/dartz.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getAllNews(
      page); //Получение списка всех новостей с пагинацией int page
  //updateArticle(); //обноваление списка статьей - необязательный пункт для выполнения
}
