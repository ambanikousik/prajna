import 'package:hive/hive.dart';
import 'package:meta/meta.dart';


class Settings{
 static Box _settingBox = Hive.box('AppSettings');

  static setFingerPrint({@required useFingerPrint}){
    _settingBox.put("fingerPrint", useFingerPrint);
  }

 static bool getFingerPrint()  => _settingBox.get("fingerPrint")??false;

}