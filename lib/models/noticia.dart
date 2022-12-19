import 'dart:convert';

Noticia noticiaFromJson(String str) => Noticia.fromJson(json.decode(str));

String noticiaToJson(Noticia data) => json.encode(data.toJson());

class Noticia {
  Noticia({
    this.id,
    this.title,
    this.body,
    required this.tags,
    this.mainImage,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  int? id;
  String? title;
  String? body;
  List<dynamic> tags;
  String? mainImage;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> images;

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
