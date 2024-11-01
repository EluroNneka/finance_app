class NewsData {
  int? datetime;
  String? headline;
  String? image;
  String? source;
  String? url;

  NewsData({this.datetime, this.headline, this.image, this.source, this.url});

  NewsData.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'] as int;
    headline = json['headline'] as String;
    image = json['image'] as String;
    source = json['source'] as String;
    url = json['url'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['headline'] = headline;
    data['image'] = image;
    data['source'] = source;
    data['url'] = url;
    return data;
  }
}
