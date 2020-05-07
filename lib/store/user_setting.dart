import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_setting.g.dart';

class UserSetting = _UserSettingBase with _$UserSetting;

abstract class _UserSettingBase with Store {
  SharedPreferences prefs;
  static const String ZOOM_QUALITY_KEY = "zoom_quality";
  @observable
  int zoomQuality = 0;
  @action
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    zoomQuality = prefs.getInt(ZOOM_QUALITY_KEY);
  }

  @action
  Future<void> change(int value) async {
    await prefs.setInt(ZOOM_QUALITY_KEY, value);
    zoomQuality = value;
  }
}