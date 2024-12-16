import 'package:hive/hive.dart';

class StoragedataLogin{
  static const login='login';
  static const fav='fav';
  static var mybox=Hive.box(login);
  static var mybox2=Hive.box(fav);
  static Future<void> addtoken(String text) async {
    await mybox.put(login, text);

  }
  static String gettoken() {
    if(mybox.isNotEmpty)  return mybox.get(login);
    else return "";
  }
  static void cleartoken(){
    mybox.clear();
  }

  static Future<void> addtfav(int index,bool fav) async {
    await mybox2.put(index, fav);
    print(mybox2.get(index));
  }
  static bool getfav(int index) {
    if(mybox2.isNotEmpty&&(mybox2.get(index)==true||mybox2.get(index)==false))  return mybox2.get(index);
    else return false;
  }


}
