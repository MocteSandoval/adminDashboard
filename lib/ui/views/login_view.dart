import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final formProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    key: formProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'El email no es válido';
                            }
                            return null;
                          },
                          onChanged: (value) => formProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                              hint: 'Dirección de correo, teléfono, email',
                              label: 'Usuario',
                              icon:
                                  const Icon(Icons.person, color: Colors.grey)),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe de ser de 6 caractéres';
                            }
                            return null;
                          },
                          onChanged: (value) => formProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: _buildInputDecoration(
                              hint: '**********',
                              label: 'Contraseña',
                              icon: const Icon(Icons.lock_outline_rounded,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPreseed: () {
                            final isValid = formProvider.validateForm();
                            if (isValid) {
                              authProvider.login(
                                  formProvider.email, formProvider.password);
                            }
                          },
                          text: 'Ingresar',
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Nueva cuenta',
                          onTap: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  InputDecoration _buildInputDecoration({
    required String hint,
    required String label,
    required Icon icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        hintText: hint,
        label: Text(label),
        prefixIcon: icon,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey));
  }
}
