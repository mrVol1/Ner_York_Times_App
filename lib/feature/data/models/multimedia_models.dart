import 'package:new_york_times/feature/domain/entities/multimedia_entity.dart';

class MultimediaModel extends MultimediaEntity {
  MultimediaModel(
      {required super.url,
      required super.format,
      required super.height,
      required super.width,
      required super.type,
      required super.subtype,
      required super.caption,
      required super.copyright});

  factory MultimediaModel.fromJson(Map<String, dynamic> json) {
    return MultimediaModel(
      url: json['url'] as String,
      format: json['format'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      caption: json['caption'] as String,
      copyright: json['copyright'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'format': format,
      'height': height,
      'width': width,
      'type': type,
      'subtype': subtype,
      'caption': caption,
      'copyright': copyright,
    };
  }
}
