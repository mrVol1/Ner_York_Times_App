import 'package:new_york_times/feature/data/models/multimedia_models.dart';
import 'package:new_york_times/feature/domain/entities/article_entity.dart';
import 'package:new_york_times/feature/domain/entities/multimedia_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {required super.section,
      required super.subsection,
      required super.title,
      required super.abstract,
      required super.url,
      required super.uri,
      required super.byline,
      required super.itemType,
      required super.updatedDate,
      required super.createdDate,
      required super.publishedDate,
      required super.materialTypeFacet,
      required super.kicker,
      required super.desFacet,
      required super.orgFacet,
      required super.perFacet,
      required super.geoFacet,
      required super.multimedia,
      required super.shortUrl});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      url: json['url'] as String,
      uri: json['uri'] as String,
      byline: json['byline'] as String,
      itemType: json['itemType'] as String?,
      updatedDate: json['updatedDate'] as String?,
      createdDate: json['createdDate'] as String?,
      publishedDate: json['publishedDate'] as String?,
      materialTypeFacet: json['materialTypeFacet'] as String?,
      kicker: json['kicker'] as String?,
      desFacet: json['desFacet'] as List?,
      orgFacet: json['orgFacet'] as List?,
      perFacet: json['perFacet'] as List?,
      geoFacet: json['geoFacet'] as List?,
      multimedia: json['multimedia'] != null
          ? MultimediaModel.fromJson(json['multimedia'])
          : null as MultimediaEntity?,
      shortUrl: json['shortUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'subsection': subsection,
      'title': title,
      'abstract': abstract,
      'url': url,
      'uri': uri,
      'byline': byline,
      'itemType': itemType,
      'updatedDate': updatedDate,
      'createdDate': createdDate,
      'publishedDate': publishedDate,
      'materialTypeFacet': materialTypeFacet,
      'kicker': kicker,
      'desFacet': desFacet,
      'orgFacet': orgFacet,
      'perFacet': perFacet,
      'geoFacet': geoFacet,
      'multimedia': multimedia,
      'shortUrl': shortUrl,
    };
  }
}
