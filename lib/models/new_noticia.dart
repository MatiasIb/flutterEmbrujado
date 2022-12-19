import 'dart:convert';

NewNoticia newNoticiaFromJson(String str) =>
    NewNoticia.fromJson(json.decode(str));

String newNoticiaToJson(NewNoticia data) => json.encode(data.toJson());

class NewNoticia {
  int? count;
  String? next;
  dynamic previous;
  List<Result> results;

  NewNoticia({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory NewNoticia.fromJson(Map<String, dynamic> json) => NewNoticia(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? title;
  String? body;
  List<int> tags;
  String? mainImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic> images;

  Result({
    this.id,
    this.title,
    this.body,
    required this.tags,
    this.mainImage,
    this.createdAt,
    this.updatedAt,
    required this.images,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        tags: List<int>.from(json["tags"].map((x) => x)),
        mainImage: json["main_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "main_image": mainImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
