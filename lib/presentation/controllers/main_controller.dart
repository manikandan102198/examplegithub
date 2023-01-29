
import 'package:get/get.dart';

import '../../common/providers/fire_auth_provider.dart';
import '../../common/utilis/local_preferences.dart';
import '../../data/core/app_constant.dart';
import '../../data/model/organization_list_model.dart';
import '../../data/model/repository_list_model.dart';
import '../../data/model/user_info_model.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/app_repository.dart';
import '../journeys/login/login_screen.dart';

class MainController extends GetxController {
  final _app = AppRepository();

  String name = '';
  String accessToken = '';
  UserInfoModel? userInfoModel;
  List<RepositoryListModel> repoList = [];
  List<OrganizationListModel> orgsList = [];
  RxInt tabIndex = 0.obs;
  RxString error = ''.obs;
  RxString repoOrgsError = ''.obs;
  RxBool homePageLoading = false.obs;
  RxBool repoLoading = false.obs;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future _loadData() async {
    final localData = LocalPreferences.getString(AppConstant.userPreferenceKey);
    if (localData != null) {
      final user = userModelFromJson(localData);
      accessToken = user.accessToken;
      name = user.userName!;
    }
    getUserInfo();
  }

  Future getUserInfo() async {
    homePageLoading.value = true;
    final res = await _app.getUserInfo(accessToken);
    homePageLoading.value = false;
    res.fold((l) => error.value = l.errorMsg, (r) => _addUserInfo(r));
  }

  void _addUserInfo(UserInfoModel res) {
    error.value = '';
    userInfoModel = res;
    if (tabIndex.value == 0) getUserRepos();
  }

  Future getUserRepos() async {
    repoLoading.value = true;
    final res = await _app.getListOfRepo(name, accessToken);
    repoLoading.value = false;
    res.fold((l) => repoOrgsError.value = l.errorMsg, (r) {
      repoOrgsError.value = '';
      repoList = r;
    });
  }

  Future getOrganizations() async {
    repoLoading.value = true;
    final res = await _app.getListOfOrgs(accessToken);
    repoLoading.value = false;
    res.fold((l) => repoOrgsError.value = l.errorMsg, (r) {
      repoOrgsError.value = '';
      orgsList = r;
    });
  }

  Future logout() async {
    await FireAuthProvider().signOut();
    await LocalPreferences.clear();
    return Get.offAll(() => LoginScreen());
  }
}
