import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Peticion http
    token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
    LocalStorage.prefs.setString('token', token!);

    //TODO: Navegar al dashboard

    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
