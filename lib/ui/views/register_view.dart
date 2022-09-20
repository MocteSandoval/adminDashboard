import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/ui/inputs/cusotm_inputs.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    key: registerProvider.formKey,
                    child: Column(
                      children: [
                        // ---------- Nombre ----------

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                            return null;
                          },
                          onChanged: ((value) =>
                              registerProvider.nombre = value),
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: const Icon(Icons.person_add,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(height: 20),

                        // ---------- Email ----------

                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'El email no es válido';
                            }
                            if (value == null || value.isEmpty) {
                              return 'Este campo es obligatorio';
                            }

                            return null;
                          },
                          onChanged: ((value) =>
                              registerProvider.email = value),
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Dirección de correo, teléfono, email',
                              label: 'Usuario',
                              icon:
                                  const Icon(Icons.person, color: Colors.grey)),
                        ),
                        const SizedBox(height: 20),

                        // ---------- Contraseña ----------

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                            if (value.length < 8) {
                              return 'La contraseña debe de ser mínimo de 8 caractéres';
                            }
                            return null;
                          },
                          onChanged: ((value) =>
                              registerProvider.password = value),
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su contraseña',
                              label: '**********',
                              icon: const Icon(Icons.lock_outline_rounded,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPreseed: () {
                            registerProvider.validateForm();
                          },
                          text: 'Crear cuenta',
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Ya tengo cuenta',
                          onTap: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
