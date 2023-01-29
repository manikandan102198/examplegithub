import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static Future<void> share(String url) async =>
      await Share.share(url, subject: 'My Profile');
}
