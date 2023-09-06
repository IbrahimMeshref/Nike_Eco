class ApiUrl{
  static const baseUrl ="https://student.valuxapps.com/api/";
  static const login = "login";
  static const register = "register";
  static const banners = "banners";
  static const profile="profile";
  static List<Map<String,String>>pro=[
    {
      'name':"Ibrahim Meshref",
      'email':"",
      'phone':"",
    }
  ];


}
class Profileee{
   late String ?name;
   late String ?email;
   late String ?phone;
  Profileee({  this.name,  this.email,  this.phone});
}