class TinyUrl {
  String url;
  String domain;
  String alias;
  String tags;
  DateTime expiresAt;
  String description;

  TinyUrl({
    required this.url,
    required this.domain,
    required this.alias,
    required this.tags,
    required this.expiresAt,
    required this.description,
  });
}
