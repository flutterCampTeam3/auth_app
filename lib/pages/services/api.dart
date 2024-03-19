import 'dart:convert';
import 'package:http/http.dart' as http;
class Api{
 //-------------------- SignUP in function-----------------
Future createUser({
    required String name,
     required String email,
      required String password}) async{
        const url = "";

        final uri =Uri.parse(url);

        final userInfo= {
           "name": name,
        "email": email,
        "password": password
        };
        //Request
        final request = await http.post(uri,body: userInfo);
        final res =json.decode(request.body);
        // return(request.statusCode);
      }
      //-------------------- LogIn function-----------------
      Future logIn ({
        required String email,
        required String password})async{
          const url = "";
          final uri=Uri.parse(url);
          final userInfo ={

           "email": email,
        "password": password,
          };
          //Request
          final request =await http.post(uri,body: userInfo);
          final res =json.decode(request.body);
          return res;
        }
        //-------------------- Get all Fodo function----------------- 
          Future getDataFood()async{
                String link ="https://foodish-api.com/api/";
               final uri = Uri.parse(link);
              final  response = await http.get(uri);

             final responsejson =json.decode(response.body);
             print("responsejson");

         Map foodimag= responsejson;
         print(responsejson.toString());
         print(foodimag["image"]);
           return foodimag["image"];

}
      }

