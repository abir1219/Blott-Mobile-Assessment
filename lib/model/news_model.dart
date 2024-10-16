class NewsModel {
  String? category;
  int? datetime;
  String? headline;
  int? id;
  String? image;
  String? related;
  String? source;
  String? summary;
  String? url;

  NewsModel(
      {this.category,
        this.datetime,
        this.headline,
        this.id,
        this.image,
        this.related,
        this.source,
        this.summary,
        this.url});

  NewsModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] as String?;
    datetime = json['datetime'] as int?;
    headline = json['headline'] as String?;
    id = json['id'] as int?;
    image = json['image'] as String?;
    related = json['related'] as String?;
    source = json['source'] as String?;
    summary = json['summary'] as String?;
    url = json['url'] as String?;
  }
}
