import 'package:example_app_github/presentation/journeys/view_repository/list_of_branches.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/content_model.dart';
import '../../data/model/contributors_model.dart';
import '../../data/model/repository_view_model.dart';
import '../../data/repository/app_repository.dart';
import '../widgets/widget_constant.dart';
import 'main_controller.dart';

class RepositoryController extends GetxController {
  final _appRepository = AppRepository();
  final _mainCtrl = Get.find<MainController>();
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  RxString contentError = ''.obs;
  List branches = [];
  List<ContentModel> contentModel = [];
  List<ContributionModel> contributorsList = [];
  late RepositoryViewModel repositoryViewModel;

  Future getRepoInfos(String userName, String repoName) async {
    isLoading.value = true;
    updateRepo();
    final res = await _appRepository.getViewRepos(
        _mainCtrl.accessToken, {'userName': userName, 'repoName': repoName});
    isLoading.value = false;
    res.fold((l) => error.value = l.errorMsg,
        (r) => _repoInfo(r, userName, repoName));
    updateRepo();
  }

 void _repoInfo(RepositoryViewModel res, String userName, String repoName) {
    error.value = '';
    repositoryViewModel = res;
    _getRepoContents(userName, repoName);
    _getAllBranches(userName, repoName);
  }

  Future _getRepoContents(String userName, String repoName) async {
    isLoading.value = true;
    updateRepo();
    final res = await _appRepository.getReposContents(
        _mainCtrl.accessToken, {'userName': userName, 'repoName': repoName});
    isLoading.value = false;
    res.fold((l) => null, (r) => _addContent(r, userName, repoName));
    updateRepo();
  }

  Future _getRepoContributors(String userName, String repoName) async {
    final res = await _appRepository.getReposContributors(
        _mainCtrl.accessToken, {'userName': userName, 'repoName': repoName});
    res.fold((l) => null, (r) => contributorsList = r);
    updateRepo();
  }

  Future _getAllBranches(String userName, String repoName) async {
    final res = await _appRepository.getReposBranches(
        _mainCtrl.accessToken, {'userName': userName, 'repoName': repoName});
    res.fold((l) => null, (r) => branches = r);
    updateRepo();
  }

 void _addContent(List<ContentModel> res, String userName, String repoName) {
    contentModel = res;
    contentModel.sort((a, b) {
      final isContain = a.name.contains('.');
      if (!isContain) return -1;
      return 1;
    });
    _getRepoContributors(userName, repoName);
  }

  void showBranches() {
    Get.bottomSheet(
      const ListOfBranches(),
      shape: WidgetConstant.buttonShape,
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  void updateRepo() => update(['repo']);
}
