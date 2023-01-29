import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ContentModel> contentModelFromJson(dynamic str) => List<ContentModel>.from(
    (str).map((x) => ContentModel.fromJson(x)));

String contentModelToJson(List<ContentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContentModel extends Equatable{
 const ContentModel({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.gitUrl,
    this.downloadUrl,
    required this.type,
    required this.links,
  });

  final String name;
  final String path;
  final String sha;
  final int size;
  final String url;
  final String htmlUrl;
  final String gitUrl;
  final String? downloadUrl;
  final Type type;
  final Links links;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        name: json["name"],
        path: json["path"],
        sha: json["sha"],
        size: json["size"],
        url: json["url"],
        htmlUrl: json["html_url"],
        gitUrl: json["git_url"],
        downloadUrl: json["download_url"],
        type: typeValues.map[json["type"]]!,
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "path": path,
        "sha": sha,
        "size": size,
        "url": url,
        "html_url": htmlUrl,
        "git_url": gitUrl,
        "download_url": downloadUrl,
        "type": typeValues.reverse[type],
        "_links": links.toJson(),
      };
      
        @override 
        List<Object?> get props => [name,sha,size,url,htmlUrl,gitUrl,downloadUrl,links];
}

class Links {
  Links({
    required this.self,
    required this.git,
    required this.html,
  });

  final String self;
  final String git;
  final String html;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        git: json["git"],
        html: json["html"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "git": git,
        "html": html,
      };
}

enum Type { FILE, DIR }

final typeValues = EnumValues({"dir": Type.DIR, "file": Type.FILE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
