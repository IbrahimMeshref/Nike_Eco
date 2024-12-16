import 'package:flutter/material.dart';

import '../dblocallog/hivo.dart';
import '../home/LocalDB.dart';
import '../home/homescreen.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  /*List<Map<String, dynamic>> json = [
    {
      "index": "0",
      "image": 'assets/images/one-white-sneaker-shoe-isolated-white.jpg',
      "name": "White sneaker",
      "price": "302.00",
      "fav": true,
    },
    {
      "index": "1",
      "image": 'assets/images/wallpaperflare.com_wallpaper.jpg',
      "name": "Nike Jordan",
      "price": "752.00",
      "fav": true,
    },
    {
      "index": "2",
      "image": 'assets/images/fd56edd26a4546a27a004864553e05d9.png',
      "name": "Nike Air Max",
      "price": "800.00",
      "fav": false,
    },
  ];*/

  // Filter only favorite items
  List<Map<String, dynamic>> get favouriteItems =>
      json.where((item) => item['fav'] == true).toList();

  // Toggle favorite status
  void toggleFavorite(int index) {
    setState(() {

      if(json[index]["fav"]){
        StoragedataLogin.addtfav(index,false);
       // json[i]["fav"]=false;
      }else{
        StoragedataLogin.addtfav(index,true);
        //json[i]["fav"]=true;
      }
      json[index]['fav'] = !json[index]['fav'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      appBar: AppBar(
        title: const Text("Favourite"),
        centerTitle: true,
        leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child:InkWell(child: CircleAvatar(child: Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),backgroundColor: Color.fromRGBO(255, 255, 255, 1),),
              onTap: ()
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );

              },
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: favouriteItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8, // Adjust item height
          ),
          itemBuilder: (context, index) {
            final item = favouriteItems[index];
            return Card(color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Center(
                          child: Image.asset(
                            item['image'],
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            toggleFavorite(json.indexOf(item));
                          },
                          child: Icon(
                            Icons.favorite,
                            color: item['fav'] ? Colors.red : Colors.grey,size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10,left: 18),
                    child: Text(
                      item['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,left: 18),
                    child: Text(
                      "\$${item['price']}",
                      style: const TextStyle(
                          fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(backgroundColor: Color(item['Color'][0]),radius: 9,),
                        SizedBox(width: 7,),
                        CircleAvatar(backgroundColor: Colors.red,radius: 9,),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
