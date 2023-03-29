import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_user_app/constants/colors.dart';
import 'package:taxi_user_app/view/authentication/register_screen.dart';
import 'package:taxi_user_app/view/home_screen.dart';

import '../../services/apiservice.dart';



class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final box = GetStorage();

  final formKey = GlobalKey<FormState>();

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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                      width: 600,
                      height: 400,
                      child: Image.asset('assets/icons/vlogo.png')),
                  const Text(
                    'LOGIN TO CONTINUE',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: contact,
                    cursorColor: blueGreen,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                       // contentPadding: const EdgeInsets.all(10),
                        hintText: 'Enter your Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2))),
                    validator: (value) {
                      if (value?.length != 10) {
                        return "Enter registered phone number";
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: password,
                    cursorColor: blueGreen,
                    decoration: InputDecoration(
                      //  contentPadding: const EdgeInsets.all(10),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your password";
                      }
                    },
                  ),
                  const SizedBox(height: 25),
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
                            var data = await APIService().userLogin(contact.text, password.text);
                            if (data["statusCode"] == 1) {
                              box.write('userId', data['body']['userId']);
                              print(data['body']['userId']);
                              print('success');
                              Fluttertoast.showToast(
                                  msg: 'LoggedIn Successfully');
                              Get.to(HomeScreen());
                            } else {
                              Fluttertoast.showToast(msg: '${data["message"]}');
                            }
                          }
                        },
                        // onPressed: (){
                        //   Get.to(HomeScreen());
                        // },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ))
                        : buildSmallButton(isDone),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                      TextButton(
                        onPressed: () {
                          Get.to( RegisterScreen());
                        },
                        child:  Text('Register',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blueGreen,
                                letterSpacing: 2)),
                      ),
                    ],
                  )
                ],
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
