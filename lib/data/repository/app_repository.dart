import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example_app_github/data/model/contributors_model.dart';

import '../../common/utilis/app_error.dart';
import '../../common/utilis/app_exception.dart';
import '../../data/core/api_client.dart';
import '../../data/model/organization_list_model.dart';
import '../../data/model/repository_list_model.dart';
import '../../data/model/repository_view_model.dart';
import '../../data/model/user_info_model.dart';
import '../core/app_constant.dart';
import '../model/content_model.dart';

class AppRepository {
  final _apiClient = ApiClient();
  final _appError = AppError();

  Future<Either<AppException, UserInfoModel>> getUserInfo(String token) async {
    try {
      final res = await _apiClient.get(AppConstant.user, token);
      return Right(UserInfoModel.fromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, List<RepositoryListModel>>> getListOfRepo(
      String name, String token) async {
    try {
      final res = await _apiClient.get(
          '${AppConstant.userPreferenceKey}/$name/${AppConstant.repos}', token);
      return Right(repositoryListModelFromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, List<OrganizationListModel>>> getListOfOrgs(
      String token) async {
    try {
      final res = await _apiClient.get(AppConstant.orgs, token);
      return Right(organizationListModelFromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, RepositoryViewModel>> getViewRepos(
      String token, Map data) async {
    try {
      final res = await _apiClient.get(
          '${AppConstant.repos}/${data['userName']}/${data['repoName']}',
          token);
      return Right(RepositoryViewModel.fromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, List<ContentModel>>> getReposContents(
      String token, Map data) async {
    try {
      final res = await _apiClient.get(
          '${AppConstant.repos}/${data['userName']}/${data['repoName']}/${AppConstant.contents}',
          token);
      return Right(contentModelFromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, List<ContributionModel>>> getReposContributors(
      String token, Map data) async {
    try {
      final res = await _apiClient.get(
          '${AppConstant.repos}/${data['userName']}/${data['repoName']}/${AppConstant.contributors}',
          token);
      return Right(contributionModelFromJson(res));
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }

  Future<Either<AppException, dynamic>> getReposBranches(
      String token, Map data) async {
    try {
      final res = await _apiClient.get(
          '${AppConstant.repos}/${data['userName']}/${data['repoName']}/${AppConstant.branches}',
          token);
      return Right(res);
    } on DioError catch (e) {
      return Left(_appError.exception(e));
    }
  }
}
