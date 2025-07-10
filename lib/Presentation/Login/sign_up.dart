import 'package:advice_generator/Presentation/Provider/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Let\'s get started!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 38, 66),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Create your new account',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 38, 66),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/sign-up.jpg')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your username";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => {
                            if (formKey.currentState!.validate())
                              {
                                context.push('/home'),
                                context.read<UsernameProvider>().getUserName(
                                  usernameController.text,
                                ),
                              },
                          },
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 38, 66),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
