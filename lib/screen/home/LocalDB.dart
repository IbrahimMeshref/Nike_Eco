
import '../dblocallog/hivo.dart';

List <Map<String,dynamic>> json=[
  {
    "index":0,
    "image": 'assets/images/one-white-sneaker-shoe-isolated-white.jpg',
    "name": "White sneaker",
    "price":"302.00",
    "gender":"Men's Shoes",
    "description":'the White sneaker Unit Delivers Unrivaled,All-Day \nComfort.The Sleek,Running-Inspired Design \nRoots You To Everything Nike....',
    "number":"1",
    "Color":[0xffCB1D1D,0xff0B2F8B],
    "fav":StoragedataLogin.getfav(0),

  },
  {
    "index":1,
    "image": 'assets/images/wallpaperflare.com_wallpaper.jpg',
    "name": "Nike Jordan",
    "price":"752.00",
    "gender":"Men's Shoes",
    "description":'the  Nike Jordan Unrivaled,All-Day \nComfort.The Sleek,Running-Inspired Design \nRoots You To Everything Nike....',
    "number":"1",
    "Color":[0xff1F3267,0xffCB1D1D],
    "fav":StoragedataLogin.getfav(1),

  },
  {
    "index":2,
    "image": 'assets/images/fd56edd26a4546a27a004864553e05d9.png',
    "name": "Nike Air Max",
    "price":"800.00",
    "gender":"Men's Shoes",
    "number":"1",
    "description":'the Nike Air Max Unrivaled,All-Day \nComfort.The Sleek,Running-Inspired Design \nRoots You To Everything Nike....',
    "Color":[0xff2256B9,0xffA9CFEB],
    "fav":StoragedataLogin.getfav(2),
  },
  {
    "index":3,

    "image": 'assets/images/0cba520b88ffd0e623319d9af1f565c1.png',
    "name": "Nike Jordan",
    "price":"302.00",
    "number":"1",
    "gender":"Men's Shoes",
    "description":'the  Nike Jordan Unrivaled,All-Day \nComfort.The Sleek,Running-Inspired Design \nRoots You To Everything Nike....',
    "Color":[0xff2256B9,0xffA9CFEB],
    "fav":StoragedataLogin.getfav(3),
  },
  {
    "index":4,

    "image": 'assets/images/a03367bbc996407757ccecca791c866f.png',
    "name": "Nike Air Max 270",
    "number":"1",
    "price":"752.00",
    "gender":"Men's Shoes",
    "description":'the White sneaker Nike Jordan Unrivaled,All-Day \nComfort.The Sleek,Running-Inspired Design \nRoots You To Everything Nike....',
    "Color":[0xffA9CFEB,0xff2256B9],
    "fav":StoragedataLogin.getfav(4),
  },


];



List <String> categories=[
  "All Shoes",
  "Out Door",
  "Tennies",
  "Football",
];
Map<int,bool>fav={
  1:true,
  2:false,
};