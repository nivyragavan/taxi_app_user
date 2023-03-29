import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taxi_user_app/constants/colors.dart';
import 'package:taxi_user_app/services/apiservice.dart';
import 'package:taxi_user_app/view/authentication/login_screen.dart';


enum ButtonState { init, loading, done }

class RegisterScreen extends StatefulWidget {
 const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();

   final email = TextEditingController();

  final contact = TextEditingController();

  final password = TextEditingController();

  ButtonState state = ButtonState.init;

  bool isLoading = false;

  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    final isDone = state == ButtonState.done;
    final isStretched = isAnimating || state == ButtonState.init;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                        width: Get.width * 0.6,
                        height: Get.height * 0.4,
                        child: Image.asset('assets/icons/vlogo.png')),
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: name,
                      cursorColor: blueGreen,
                      decoration: InputDecoration(
                        // contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: contact,
                      cursorColor: blueGreen,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        // contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value?.length != 10) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: email,
                      cursorColor: blueGreen,
                      decoration: InputDecoration(
                        // contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: password,
                      cursorColor: blueGreen,
                      decoration: InputDecoration(
                        // contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    AnimatedContainer(
                      width: state == ButtonState.init ? 300 : 70,
                      height: 50,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      onEnd: () =>
                          setState(() =>
                          isAnimating = !isAnimating
                          ),
                      child: isStretched
                          ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blueGreen,),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                state = ButtonState.loading;
                              });
                              await Future.delayed(const Duration(seconds: 3));
                              setState(() {
                                state = ButtonState.done;
                              });
                              await Future.delayed(const Duration(seconds: 3));
                              setState(() {
                                state = ButtonState.init;
                              });
                              var data = await APIService().userRegister(name
                                  .text, contact.text, email.text, password.text);
                              if (data["statusCode"] == 1) {
                                print('success');
                                Fluttertoast.showToast(
                                    msg: 'Registered Successfully');
                                Get.to(LoginScreen());
                              } else {
                                Fluttertoast.showToast(msg: '${data["message"]}');
                              }
                            }
                          },
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ))
                          : buildSmallButton(isDone),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                        TextButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child:  Text('Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                              color: blueGreen
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  buildSmallButton(bool isDone) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: isDone ? Colors.green : blueGreen,
      child: Center(
        child: isDone
            ? const Icon(
          Icons.done,
          size: 40,
          color: Colors.white,
        )
            : const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
