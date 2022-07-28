import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';
import 'package:new_york_times/feature/domain/repositories/news_repository.dart';

class GetAllNews {
  final NewsRepository newsRepository;
  GetAllNews(this.newsRepository);

  Future<Either<Failure, List<NewsEntity>>> call(PageNewsParams params) async {
    return await newsRepository.getAllNews(params.page);
  }
}

class PageNewsParams extends Equatable {
  final int page;

  const PageNewsParams({required this.page});

  @override
  List<Object> get props => [page];
}
