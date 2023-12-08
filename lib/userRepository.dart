import 'package:api_test/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class userRepository {
  Future<List<User>> fetchUsers() async{
    final response =
        await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonUsers = json.decode(response.body);
      List<User> users = jsonUsers.map((json) => User.fromJson(json)).toList();
      return users; 
    } else { 
      throw Exception('Erreur de chargement');
    }
  }
}