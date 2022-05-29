import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:provider/provider.dart';
import 'package:titans_crypto/constants/colors.dart';

import '../../constants/storage.dart';
import '../../widgets/textfield_widget.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/AuthScreen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _selected = ValueNotifier('Sign in');
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(AppStorage.wallpaper),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF777777),
                      size: 35,
                    )),
                const SizedBox(height: 30),
                Center(
                  child: AdvancedSegment(
                      borderRadius: BorderRadius.circular(10),
                      controller: _selected,
                      segments: const {
                        'Sign in': 'Sign in',
                        'Sign up': 'Sign up',
                      },
                      sliderDecoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      inactiveStyle: const TextStyle(
                        color: Color(0xFF777777),
                        fontWeight: FontWeight.normal,
                      ),
                      activeStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                      sliderOffset: 4.0,
                      sliderColor: AppColors.bgColor,
                      itemPadding: const EdgeInsets.symmetric(
                        // EdgeInsets
                        horizontal: 60,
                        vertical: 15,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                _form()
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign in",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 50,
        ),
        _label("Email"),
        _buildUserIdField(),
        const SizedBox(height: 30),
        _label("Password"),
        _buildPasswordField(),
        _forgotPass(),
        const SizedBox(height: 30),
        _signButton()
      ],
    );
  }

  Widget _label(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 14, color: Color(0xFFA7AFB7)),
    );
  }

  Widget _buildUserIdField() {
    return TextFieldWidget(
      padding: const EdgeInsets.only(top: 10.0),
      hint: "Enter Your Email",
      inputType: TextInputType.emailAddress,
      icon: Icons.person,
      textController: _userEmailController,
      inputAction: TextInputAction.next,
      autoFocus: false,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      // errorText: "Email is invalid",
    );
  }

  Widget _buildPasswordField() {
    return TextFieldWidget(
      hint: "Enter you Password",
      isObscure: true,
      padding: const EdgeInsets.only(top: 10.0, bottom: 30),
      icon: Icons.lock,
      textController: _passwordController,
      focusNode: _passwordFocusNode,
      // errorText: "Password is invalid",
    );
  }

  Widget _forgotPass() {
    return InkWell(
        onTap: () {},
        child: Text(
          "Forgot password?",
          style: TextStyle(
              fontSize: 14, color: const Color(0xFF5ED5A8).withOpacity(0.8)),
        ));
  }

  Widget _signButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor)),
          child: const Text("Sigin in",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black))),
    );
  }
}
