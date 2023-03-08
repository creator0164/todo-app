import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier{
  TodoProvider() {
    this.fetchTasks();
  }

  List<Todo> _todos = [];
  List<Todo> get todos {
    return [..._todos];
  }

  fetchTasks() async {
    final String url = 'http://127.0.0.1:8000/api/v1/?format=json';
    var response = await http.get(
      Uri.parse(url)
    );
    print(response.body);
    if (response.statusCode == 200){
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
    }
}
}