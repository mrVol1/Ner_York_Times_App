import 'dart:convert';

import 'package:new_york_times/core/error/exception.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalDataSources {
  Future<List<NewsModel>> getLastNewsFromCash();
  Future<void> newsToCash(List<NewsModel> news);
}

const cacahedNewsList = 'CACHED_NEWS_LIST';

class NewsLocalDataSourcesImp implements NewsLocalDataSources {
  late final SharedPreferences sharedPreferences;

  NewsLocalDataSourcesImp({required this.sharedPreferences});

  @override
  Future<List<NewsModel>> getLastNewsFromCash() {
    final jsonNewsList = sharedPreferences.getStringList(cacahedNewsList);
    if (jsonNewsList!.isNotEmpty) {
      return Future.value(
          jsonNewsList.map((e) => NewsModel.fromJson(json.decode(e))).toList());
    } else {
      throw CasheException();
    }
  }

  @override
  Future<void> newsToCash(List<NewsModel> news) {
    final List<String> jsonNewsList =
        news.map((e) => json.encode(e.toJson())).toList();

    sharedPreferences.setStringList(cacahedNewsList, jsonNewsList);
    print('News to write Cache: ${jsonNewsList.length}');
    return Future.value(jsonNewsList);
  }
}
