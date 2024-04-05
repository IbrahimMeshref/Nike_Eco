import 'package:hive/hive.dart';

class StoragedataCart{
  static const cartt='cart';
  static var mybox2=Hive.box(cartt);
  static List <dynamic> cart=[];
  static Future<void> addcart({required Map<String,dynamic>text}) async {
    cart.add(text);
    await mybox2.put(cartt, cart);

  }

  static void getcart() {
  //mybox2.clear();
    if(mybox2.isNotEmpty) cart=(mybox2.get(cartt));
  }
  static Future<void> updatecart() async {
    await mybox2.put(cartt, cart);
  }
  static Future<void> deletcart(int index) async {
    cart.removeAt(index);
    await mybox2.put(cartt, cart);
  }
}