import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../const.dart';
import '../profile/profil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side menu
      type: SideMenuType.slideNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(context),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        background: Color(0xFF0995dc),
        key: _sideMenuKey,
        menu: buildMenu(context),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => toggleMenu(),
              ),
            ),
            body: Center(child: Text('hello')),

          ),
        ),
      ),
    );
  }

}
Widget buildMenu(BuildContext context) =>

   SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 23),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CircleAvatar(
                //backgroundColor: Colors.white,
                radius: 60.0,
                backgroundImage: NetworkImage(picture1),
              ),
              SizedBox(height: 20.0),
              Text(
                "Hey, Ibrahim Meshref",
                style: TextStyle(color: Colors.white,fontSize: 17),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));

          },
          leading: const Icon(Icons.person_outlined, size: 30.0, color: Colors.white),
          title: const Text("Profile",    style: TextStyle(color: Colors.white,fontSize: 17),),
          textColor: Colors.white,
          dense: true,
        ),
        SizedBox(height: 20,),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.shopping_cart,
              size: 30.0, color: Colors.white),
          title: const Text("My Cart",    style: TextStyle(color: Colors.white,fontSize: 17),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        SizedBox(height: 20,),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.favorite,
              size: 30.0, color: Colors.white),
          title: const Text("Favorite",    style: TextStyle(color: Colors.white,fontSize: 17),),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        SizedBox(height: 20,),
        Divider(
          color: Colors.white,
          thickness: 2,
        ),
        SizedBox(height: 5,),
        ListTile(
          onTap: () {},
          leading:
          const Icon(Icons.logout, size: 20.0, color: Colors.white),
          title: const Text("Sign Out",    style: TextStyle(color: Colors.white,fontSize: 17),),
          textColor: Colors.white,
          dense: true,


          // padding: EdgeInsets.zero,
        ),

      ],
    ),
  );

