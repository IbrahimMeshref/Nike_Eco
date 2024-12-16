import 'dart:convert';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../cart/mycart.dart';
import '../const.dart';
import '../dblocalcart/hivo.dart';
import '../dblocallog/hivo.dart';
import '../diohelper/urlapi.dart';
import '../login/login_screen.dart';
import '../profile/cubit/profile_cubit.dart';
import '../profile/model/ProfileModel.dart';
import '../profile/profil.dart';
import 'LocalDB.dart';
import 'itemscreen.dart';

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

  Color iconColor = Colors.grey;
@override
void initState() {
  context.read<ProfileCubit>().profile();
  StoragedataCart.getcart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SideMenu(
        key: _endSideMenuKey,
        inverse: true,
        // end side menu
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
                  appBar: buildAppBar(),
                  backgroundColor:Color(0xffF7F7F9),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                              child:  TextFormField(

                                  decoration: InputDecoration(
                                    hintText: 'Looking for Shoes',
                                    contentPadding: EdgeInsets.all(12),
                                    suffixIcon:Icon(
                                             Icons.search,
                                        color: Colors.grey,
                                      ),
                                    focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8.0),

                                    ),
                                  ),

                                ),


                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Select Category",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(43, 43, 43, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 40,
                                width: width,
                                child: ListView.separated(
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: (){
                                      Get.offAll(itemScreen());
                                    },
                                    child: buildContainer(categories[index]),

                                    
                                  ),
                                  itemCount: categories.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    width: 16,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Popular Shoes",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(43, 43, 43, 1))),
                                  Spacer(),
                                  InkWell(
                                    child: Text("See all",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(13, 110, 253, 1))),
                                    onTap: () {
                                      Get.to(itemScreen());
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 230,
                                width: width,
                                child: ListView.separated(
                                  itemBuilder: (context, index) => InkWell(
                                    child: buildItem(
                                      indexx:index,
                                        width: width,
                                        image: json[index]["image"],
                                        name: json[index]["name"],
                                        price: json[index]["price"]),
                                    onTap: () {
                                      //print();

                                     // Get.off(Carts());
                                      //Get.offAll(;
                                      /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context,index) => itemScreen(),
                      ),
                    );*/
                                    },
                                  ),
                                  itemCount: json.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    width: 16,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(43, 43, 43, 1)),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                                    width: width,
                                    height: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 20, 0, 0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Summer Sale",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        43, 43, 43, 1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Text(
                                            "15% OFF",
                                            style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF674DC5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(190, 0, 36, 25),
                                    child: Image.asset(
                                      'assets/images/Nike-Zoom-Moc-The-10th_1_.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(190, 60, 36, 0),
                                    child: Image.asset(
                                      'assets/images/Ellipse 3.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 85, 0, 0),
                                    child:
                                        Image.asset("assets/images/Vector.png"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(320, 39, 0, 0),
                                    child:
                                        Image.asset("assets/images/Vector.png"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(130, 29, 0, 0),
                                    child:
                                        Image.asset("assets/images/Vector.png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: CurvedNavigationBar(
                    backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                    items: [
                      CurvedNavigationBarItem(
                        child: Icon(
                          CupertinoIcons.house,
                          color: iconColor,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(CupertinoIcons.heart, color: iconColor),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: iconColor,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(Icons.notifications_none, color: iconColor),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          CupertinoIcons.person,
                          color: iconColor,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      print(index);
                      if(index==2)  {  Get.to((Carts()));setState(() {});}
                      if(index==4) {Get.to((Profile()));setState(() {});}
                      setState(() {
                        iconColor = Color.fromRGBO(13, 110, 253, 1);
                      });// Handle button tap
                    },
                  ),
                ))));
  }

  Container buildItem(
      {required int indexx,
        required double width,
      required String image,
      required String name,
      required String price}) {
    return Container(
      width: width * 0.43,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/heart.png',
                  width: 14,
                  height: 16,
                ),
              ],
            ),
            Image.asset(
              image,
              width: 130,
              height: 110,
            ),
            SizedBox(
              height: 10,
            ),
            Text("BEST SELLER",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(13, 110, 253, 1))),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromRGBO(106, 106, 106, 1)),
            ),
            Row(
              children: [
                Text(
                  '\$${price}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(43, 43, 43, 1)),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    //cart.add(json[currentIndex]);
                  },
                  child: InkWell(
                    onTap:(){
                     // StoragedataCart.cart.add(json[indexx]);
                      bool find=false;
                      for(int i=0;i<StoragedataCart.cart.length;i++){
                        if(StoragedataCart.cart[i]["index"]==json[indexx]['index'])
                        {
                            find=true;
                        }
                      }
                      if(find==false)
                      {
                        StoragedataCart.addcart(text: json[indexx]);
                        //print(json[indexx]);
                        Fluttertoast.showToast(msg: "Add Successful",
                          backgroundColor: Colors.blue,
                          fontSize: 17,

                        );
                      }else{
                        Fluttertoast.showToast(msg: "Already in Cart",
                          backgroundColor: Colors.blue,
                          fontSize: 17,

                        );
                      }
                    },
                    child: Container(
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(13, 110, 253, 1),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(String text) {
    return Container(
      width: 108,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color.fromRGBO(43, 43, 43, 1)),
      )),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(

      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
          backgroundColor: Color.fromRGBO(247, 247, 247, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0,0, 30),
                  child: Image.asset(
                    'assets/images/Highlight_05.png',
                    width: 20,
                    height: 19,
                  ),
                ),
              Column(
                children: [
                  SizedBox(height: 10,),
                  Text(
                    "Explore",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 44,
                        color: Color.fromRGBO(43, 43, 43, 1)),
                  ),
                ],
              ),
            ],
          ),
          leading: BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
      return InkWell(
      child:  CircleAvatar(
       radius:29 ,
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/images/Hamburger.png',
        ),
      ),
      onTap: () { toggleMenu();
      setState(() {

      });
      }
      );
  },
),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Carts(),
                    ),
                  );
                },
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/bag-2.png',
                    width: 44,
                    height: 44,
                  ),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ]),
    );
  }
}

Widget buildMenu(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  //backgroundColor: Colors.white,
                  radius: 60.0,
                  backgroundImage: NetworkImage(picture1),
                ),
                SizedBox(height: 20.0),
                BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    if (state is ProfileLoading){
      return  Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ));
    }
    ProfileModel stucheck = context.read<ProfileCubit>().profileModel;
    return Text(
                  "Hey, ${stucheck.data?.name}",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                );
  },
),
                SizedBox(height: 50.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
            leading: const Icon(Icons.person_outlined,
                size: 30.0, color: Colors.white),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
             /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Carts(),
                ),
              );*/
              Get.to(Carts());
            },
            leading: const Icon(Icons.shopping_cart,
                size: 30.0, color: Colors.white),
            title: const Text(
              "My Cart",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.favorite, size: 30.0, color: Colors.white),
            title: const Text(
              "Favorite",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            onTap: () {
              StoragedataLogin.cleartoken();
              Get.offAll(LoginScreen());
              ApiUrl.pro.clear();

            },
            leading: const Icon(Icons.logout, size: 20.0, color: Colors.white),
            title: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
