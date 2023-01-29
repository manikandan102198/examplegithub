import 'dart:convert';

import 'package:equatable/equatable.dart';

List<OrganizationListModel> organizationListModelFromJson(dynamic str) =>
    List<OrganizationListModel>.from(
        str.map((x) => OrganizationListModel.fromJson(x)));

String organizationListModelToJson(List<OrganizationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationListModel extends Equatable {
  const OrganizationListModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.url,
    required this.avatarUrl,
    this.description,
    this.publicMembersUrl,
  });

  final String login;
  final int id;
  final String nodeId;
  final String url;
  final String avatarUrl;
  final String? description;
  final String? publicMembersUrl;

  factory OrganizationListModel.fromJson(Map<String, dynamic> json) =>
      OrganizationListModel(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        avatarUrl: json["avatar_url"],
        description: json["description"],
        publicMembersUrl: json["public_members_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "url": url,
        "avatar_url": avatarUrl,
        "description": description,
        "public_members_url": publicMembersUrl,
      };

  @override
  List<Object?> get props =>
      [login, id, nodeId, url, avatarUrl, description, publicMembersUrl];
}
