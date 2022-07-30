import 'package:equatable/equatable.dart';
import 'package:new_york_times/feature/domain/entities/multimedia_entity.dart';

class ArticleEntity extends Equatable {
  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String uri;
  final String byline;
  final String? itemType;
  final String? updatedDate;
  final String? createdDate;
  final String? publishedDate;
  final String? materialTypeFacet;
  final String? kicker;
  final List<dynamic>? desFacet;
  final List<dynamic>? orgFacet;
  final List<dynamic>? perFacet;
  final List<dynamic>? geoFacet;
  final MultimediaEntity? multimedia;
  final String? shortUrl;

  const ArticleEntity(
      {required this.section,
      required this.subsection,
      required this.title,
      required this.abstract,
      required this.url,
      required this.uri,
      required this.byline,
      required this.itemType,
      required this.updatedDate,
      required this.createdDate,
      required this.publishedDate,
      required this.materialTypeFacet,
      required this.kicker,
      required this.desFacet,
      required this.orgFacet,
      required this.perFacet,
      required this.geoFacet,
      required this.multimedia,
      required this.shortUrl});

  @override
  List<Object?> get props => [
        section,
        subsection,
        title,
        abstract,
        url,
        uri,
        byline,
        itemType,
        updatedDate,
        createdDate,
        publishedDate,
        materialTypeFacet,
        kicker,
        desFacet,
        orgFacet,
        perFacet,
        geoFacet,
        multimedia,
        shortUrl
      ];
}
