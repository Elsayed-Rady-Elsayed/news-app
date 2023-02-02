import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:your_news/models/artical_model.dart';
class Api{
  static final String apikey="b3393317b812467fa11eb5b3bbb41b67";
  static Future<List<Artical>> getarticals() async {
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=b3393317b812467fa11eb5b3bbb41b67');
    var response = await http.get(url);
    List<Artical>list=[];
    if(response.statusCode==200){
      var responsebody = jsonDecode(response.body)["articles"];
      print(responsebody);
      for(var x in responsebody)
        {
          Artical i = Artical( x["title"], x["description"], x["url"], x["urlToImage"]);
          list.add(i);
        }
      return list;
    }
  return list;
  }
  static Future<List<Artical>> GetCatogerieArticals(String category) async {
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apikey');
    var response = await http.get(url);
    List<Artical>list=[];
    if(response.statusCode==200){
      var responsebody = jsonDecode(response.body)["articles"];
      print(responsebody);
      for(var x in responsebody)
      {
        Artical i = Artical( x["title"], x["description"], x["url"], x["urlToImage"]);
        list.add(i);
      }
      return list;
    }
    return list;
  }
}