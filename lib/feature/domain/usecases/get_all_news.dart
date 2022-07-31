import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:new_york_times/feature/domain/repositories/news_repository.dart';

class GetAllNews {
  final NewsRepository newsRepository;
  GetAllNews(this.newsRepository);

  Future<Either<Failure, List<NewsModel>>> call() async {
    return await newsRepository.getAllNews();
  }
}
