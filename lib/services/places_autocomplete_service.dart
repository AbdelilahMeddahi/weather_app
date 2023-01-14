import 'package:http/http.dart' as http;


class placesService {
   static Future<String?> fetchUrl(Uri uri,{Map<String,String>? headers}) async{
     final response = await http.get(uri,headers: headers);
     return response.body;
   }
}
