import 'dart:convert';

import 'package:new_york_times/core/error/exception.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewRemoteDataSourse {
  // Calls the https://api.nytimes.com/svc/topstories/v2/home.json?&api-key=z5jeiAVE5HhRKGaoC8twMEvZFhw1YtXc endpoint
  Future<List<NewsModel>> getAllNews();
}

class NewsRemoteDataSourseImp implements NewRemoteDataSourse {
  final http.Client client;

  NewsRemoteDataSourseImp({required this.client});
  @override
  Future<List<NewsModel>> getAllNews() => _getNewsFromUrl(
      'https://api.nytimes.com/svc/topstories/v2/home.json?&api-key=z5jeiAVE5HhRKGaoC8twMEvZFhw1YtXc');

  Future<List<NewsModel>> _getNewsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final news = json.decode(response.body);
      return (news['status'] as List)
          .map(
            (e) => NewsModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
