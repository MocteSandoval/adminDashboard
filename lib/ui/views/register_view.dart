import 'package:admin_dashboard/ui/inputs/cusotm_inputs.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                // validator: ,
                style: const TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: const Icon(Icons.person_add, color: Colors.grey)),
              ),
              const SizedBox(height: 20),
              TextFormField(
                // validator: ,
                style: const TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Dirección de correo, teléfono, email',
                    label: 'Usuario',
                    icon: const Icon(Icons.person, color: Colors.grey)),
              ),
              const SizedBox(height: 20),
              TextFormField(
                // validator: ,
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
                onPreseed: () {},
                text: 'Crear cuenta',
              ),
              const SizedBox(height: 20),
              LinkText(
                text: 'Ya tengo cuenta',
                onTap: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
