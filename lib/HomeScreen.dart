// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, missing_required_param, unused_local_variable, prefer_typing_uninitialized_variables, must_be_immutable, unused_import, avoid_unnecessary_containers, unused_label, avoid_single_cascade_in_expression_statements, sized_box_for_whitespace

import 'package:complete_login/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'ar.dart';
import 'reusecomponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'FCAI - HU',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                size: 24.0,
              ),
            ),
          ]),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("icon/back.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    defaultTextFormField(
                      password: false,
                      controller: emailController,
                      label: 'E-Mail Addrees',
                      type: TextInputType.emailAddress,
                      prefix: Icons.email,
                      HINT: 'Your Faculty ID Number',
                    ),
                    SizedBox(height: 15.0),
                    defaultTextFormField(
                      label: 'Password',
                      HINT: '*********',
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      password: isPassword,
                      prefix: Icons.password,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ImageRecognitionApp()),
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('SORRY !!!'),
                              content: Text('It\'s Not Available For Now'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Forget Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
