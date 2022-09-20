import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String nombre = '';
  String email = '';
  String password = '';

  validateForm() {
    formKey.currentState!.validate();
  }
}
