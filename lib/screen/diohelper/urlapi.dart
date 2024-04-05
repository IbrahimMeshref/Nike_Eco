class ApiUrl{
  static const baseUrl ="https://student.valuxapps.com/api/";
  static const login = "login";
  static const register = "register";
  static const banners = "banners";
  static const profile="profile";
  static String message='';
  static String messageup='';
  static List<Map<String,String>>pro=[
    {
      'name':"",
      'email':"",
      'phone':"",
      'image':"",
    }
  ];


}
class Profileee{
   late String ?name;
   late String ?email;
   late String ?phone;
  Profileee({  this.name,  this.email,  this.phone});
}