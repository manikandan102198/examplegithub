import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ContributionModel> contributionModelFromJson(dynamic str) =>
    List<ContributionModel>.from(
        (str).map((x) => ContributionModel.fromJson(x)));

String contributionModelToJson(List<ContributionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContributionModel extends Equatable {
  const ContributionModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.type,
    required this.siteAdmin,
    required this.contributions,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String type;
  final bool siteAdmin;
  final int contributions;

  factory ContributionModel.fromJson(Map<String, dynamic> json) =>
      ContributionModel(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
        contributions: json["contributions"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "type": type,
        "site_admin": siteAdmin,
        "contributions": contributions,
      };

  @override
  List<Object?> get props => [
        login,
        id,
        nodeId,
        avatarUrl,
        gravatarId,
        url,
        htmlUrl,
        siteAdmin,
        contributions
      ];
}
