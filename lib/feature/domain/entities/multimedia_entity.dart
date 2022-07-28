class MultimediaEntity {
  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  const MultimediaEntity(
      {required this.url,
      required this.format,
      required this.height,
      required this.width,
      required this.type,
      required this.subtype,
      required this.caption,
      required this.copyright});
}
