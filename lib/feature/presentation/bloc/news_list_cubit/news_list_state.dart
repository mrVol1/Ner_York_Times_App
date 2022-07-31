import 'package:equatable/equatable.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsEmpty extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  final List<NewsEntity> oldNewsList;

  const NewsLoading(this.oldNewsList);
  @override
  List<Object?> get props => [oldNewsList];
}

class NewsLoaded extends NewsState {
  final List<NewsEntity> newsList;

  const NewsLoaded(this.newsList);

  @override
  List<Object?> get props => [newsList];
}

class NewsError extends NewsState {
  final String message;

  const NewsError({required this.message});
  @override
  List<Object?> get props => [message];
}
