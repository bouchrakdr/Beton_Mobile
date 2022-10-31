import 'package:get/get.dart';
import 'package:hasnaoui/Model/model.user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WrapperOnBoardingController extends GetxController{
  late bool first;
  var isUpdating = false;

  void switchBool() {
    isUpdating= !isUpdating;
    update();
  }

  getUser()async {
    switchBool();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    first =  preferences.getString("token" ) == null ? true : false;
    switchBool();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }
}