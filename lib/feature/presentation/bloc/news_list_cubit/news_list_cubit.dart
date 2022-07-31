import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/core/error/failure.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';
import 'package:new_york_times/feature/domain/usecases/get_all_news.dart';
import 'package:new_york_times/feature/presentation/bloc/news_list_cubit/news_list_state.dart';
import 'dart:core';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHED_FAILURE_MESSAGE = 'Cache Failure';

class NewsListCubit extends Cubit<NewsState> {
  final GetAllNews getAllNews;

  NewsListCubit({required this.getAllNews}) : super(NewsEmpty());

  void loadNews() async {
    if (state is NewsLoading) return;

    final currentState = state;

    var oldNews = <NewsEntity>[];
    if (currentState is NewsLoaded) {
      oldNews = currentState.newsList;
    }

    emit(NewsLoading(oldNews));

    final failureOrNews = await getAllNews();

    failureOrNews
        .fold((error) => emit(NewsError(message: _mapFailureToMessage(error))),
            (character) {
      final news = (state as NewsLoading).oldNewsList;
      news.addAll(character);
      emit(NewsLoaded(news));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CasheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
