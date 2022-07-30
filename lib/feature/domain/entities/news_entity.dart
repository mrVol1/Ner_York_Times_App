import 'package:equatable/equatable.dart';
import 'package:new_york_times/feature/domain/entities/article_entity.dart';

class NewsEntity extends Equatable {
  final String? status;
  final String copyright;
  final String section;
  final String lastUpdated;
  final String numResult;
  final ArticleEntity results;

  const NewsEntity({
    required this.status,
    required this.copyright,
    required this.section,
    required this.lastUpdated,
    required this.numResult,
    required this.results,
  });

  @override
  List<Object?> get props =>
      [status, copyright, section, lastUpdated, numResult, results];
}
