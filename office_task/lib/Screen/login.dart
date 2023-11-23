import 'package:flutter/material.dart';
import 'package:office_task/Screen/landing.dart';
import 'package:office_task/Screen/singlepage.dart';

import '../Repository/loginApi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool showPassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 40),
                  child: Text(
                    "Welcome to Kitwosd Restro System",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 40, top: 10),
                child: Text(
                    "Enter your phone number or email addressfor sigin. Enjoy your food"),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("EMAIL ADDRESS"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder()
                      // border: InputBorder.none,

                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  // onSaved: (value) {
                  //   _email = value!;
                  // },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("PASSWORD"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                child: TextFormField(
                  obscureText: !showPassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    focusColor: Color.fromARGB(66, 234, 223, 223),
                    suffixIcon: IconButton(
                      icon: Icon(!showPassword
                          ? Icons.visibility_off
                          : Icons.visibility_sharp),
                      onPressed: () {
                        setState(
                          () {
                            showPassword = !showPassword;
                          },
                        );
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,

                  // onSaved: (value) {
                  //   _password = value!;
                  // },
                ),
              ),
              Expanded(
                child: Align(
                    // alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 45,
                        width: double.infinity,
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      final loggedIn = await login(
                                          emailController.text,
                                          passwordController.text);
                                      if (mounted) {
                                        if (loggedIn) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Success")));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      landingpage()));
                                        } else {}
                                      }
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Something went wrong")));
                                      }
                                    }
                                  }
                                },
                                child: Text(' SignIn')))),
              )
            ],

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Text("Don't have an account? "),
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const Registerform(),
            //               ));
            //         },
            //         child: const Text(
            //           'Sign Up',
            //           style: TextStyle(color: Colors.deepOrange, fontSize: 16),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ),
        ),
      ),
    );
  }
}
