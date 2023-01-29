import 'dart:convert';

import 'package:equatable/equatable.dart';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel extends Equatable {
 const UserInfoModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.organizationsUrl,
    required this.type,
    required this.siteAdmin,
    this.name,
    this.company,
    required this.blog,
    this.location,
    this.email,
    this.bio,
    this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String organizationsUrl;
  final String type;
  final bool siteAdmin;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final dynamic bio;
  final String? twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        organizationsUrl: json["organizations_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
        name: json["name"],
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        email: json["email"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "organizations_url": organizationsUrl,
        "type": type,
        "site_admin": siteAdmin,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "email": email,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        publicRepos,
        publicGists,
        bio,
        email,
        following,
        followingUrl,
        id,
        followers,
        followersUrl,
        avatarUrl,
        name,
        login,
      ];
}
