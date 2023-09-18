import 'package:chatapp_flutter/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  // final String text;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textcontroller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // signIn user
  Future<void> signIn() async {
     final authService=Provider.of<AuthService>(context, listen: false);
  try {
    await authService.signInWithEmailandPassword(emailController.text, passwordController.text);
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);

  }

  // get the authService
 
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.message,
                  size: 90,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome back you / ve been missed!',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                SizedBox(
                  height: 15,
                ),
                MyButton(onTap: signIn, text: 'Sign In'),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member ?'),
                    SizedBox(
                      width: 9,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                        child: Text(
                      'Register Now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
