import 'dart:convert';

import 'package:get/get.dart';
import 'package:hasnaoui/Model/model.matiere.dart';
import 'package:hasnaoui/Model/model.user.dart';
import 'package:hasnaoui/Service/homeService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  bool error = false;
  String nameUser = "";


  List<MatiereModel> matieres = [
    MatiereModel(name: "Ciments"),
    MatiereModel(name: "Sables"),
    MatiereModel(name: "Adjuvants"),
    MatiereModel(name: "Graviers"),
  ];

  var isUpdating = false;

  void switchBool() {
    isUpdating= !isUpdating;
    update(["update"]);
  }

  getUser()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var local = preferences.getString('user') ?? "";
    var jsonData = jsonDecode(local);
    UserModel user = UserModel.fromJson(jsonData);
    nameUser = "Hi ${user.nom} ${user.prenom}";
  }

  getMatieres() async {
    switchBool();
    for(int i = 0 ; i<matieres.length;++i){
      var response = await HomeService.getMatiere(matieres[i].name);
      if(response.error){
        error =true;
        break;
      } else {
        matieres[i].tst = response.data ?? 0;
      }
    }
    switchBool();
  }
}
