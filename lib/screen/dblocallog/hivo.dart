import 'package:hive/hive.dart';

class Storagedata{
  static const notesbox='not_box';
  static var mybox=Hive.box(notesbox);

  static Future<void> addtoken(String text) async {
    await mybox.put(notesbox, text);

  }
  static String gettoken() {
    if(mybox.isNotEmpty)  return mybox.get(notesbox);
    else return "";
  }
/*
  static Future<void> updatenote() async {
    await mybox.put(notesbox, notes);
  }

  static Future<void> deletenote(int index) async {
    notes.removeAt(index);
    await mybox.put(notesbox, notes);
  }

 */
  static void cleartoken(){
    mybox.clear();
  }


}