import 'package:dartz/dartz.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>>
      getAllNews(); //Получение списка всех новостей с пагинацией int page
  //updateArticle(); //обноваление списка статьей - необязательный пункт для выполнения
}
