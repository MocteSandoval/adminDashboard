import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? token;

  login(String email, String password) {
    //TODO: Peticion http
    token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

    print('Almacenar JWT: $token');

    //TODO: Navegar al dashboard

    notifyListeners();
  }
}
