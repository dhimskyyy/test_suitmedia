import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final List<UserModel> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    if (isRefresh) {
      _currentPage = 1;
      _users.clear();
      _hasMore = true;
    }

    final url =
        Uri.parse('https://reqres.in/api/users?page=$_currentPage&per_page=10');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> userJson = data['data'];

      if (userJson.isEmpty) {
        _hasMore = false;
      } else {
        final newUsers = userJson.map((json) => UserModel.fromJson(json)).toList();
        _users.addAll(newUsers.cast<UserModel>());
        _currentPage++;
      }
    } else {
      _hasMore = false;
    }

    _isLoading = false;
    notifyListeners();
  }
}
