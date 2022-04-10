import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider_app/Model/model.dart';

class RemoteServices {
  Future<Todo?> fetchTodos() async {
    Todo? result;

    const uri = 'https://jsonplaceholder.typicode.com/todos';

    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = Todo.fromJson(item);
      } else {
        print('error');
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
