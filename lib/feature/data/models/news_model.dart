import 'package:new_york_times/feature/data/models/article_model.dart';
import 'package:new_york_times/feature/domain/entities/article_entity.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required super.status,
      required super.copyright,
      required super.section,
      required super.lastUpdated,
      required super.numResult,
      required super.results});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String,
      section: json['section'] as String,
      lastUpdated: json['lastUpdated'] as String,
      numResult: json['numResult'] as String,
      results: json['results'] != null
          ? ArticleModel.fromJson(json['results'])
          : null as ArticleEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'copyright': copyright,
      'section': section,
      'lastUpdated': lastUpdated,
      'numResult': numResult,
      'results': results,
    };
  }
}
