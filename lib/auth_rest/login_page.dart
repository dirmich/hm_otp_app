import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#283b71'),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: .3,
          key: UniqueKey(),
          child: Form(
            key: globalKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'ShoppingAppLogo.png',
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormHelper.inputFieldWidget(context, 'username', 'UserName',
                    (val) {
                  if (val.isEmpty) {
                    return "Username can't be empty";
                  }
                }, (val) {
                  username = val;
                },
                    paddingLeft: 0,
                    paddingRight: 0,
                    contentPadding: 24,
                    borderColor: Colors.white,
                    borderFocusColor: Colors.white,
                    borderRadius: 10,
                    textColor: Colors.white,
                    hintColor: Colors.white.withOpacity(.5),
                    prefixIconPaddingLeft: 20,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    showPrefixIcon: true,
                    prefixIconColor: Colors.white),
                const SizedBox(
                  height: 16,
                ),
                FormHelper.inputFieldWidget(context, 'password', 'Password',
                    (val) {
                  if (val.isEmpty) {
                    return "Username can't be empty";
                  }
                }, (val) {
                  username = val;
                },
                    paddingLeft: 0,
                    paddingRight: 0,
                    contentPadding: 24,
                    obscureText: hidePassword,
                    borderColor: Colors.white,
                    borderFocusColor: Colors.white,
                    borderRadius: 10,
                    textColor: Colors.white,
                    hintColor: Colors.white.withOpacity(.5),
                    prefixIconPaddingLeft: 20,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    showPrefixIcon: true,
                    prefixIconColor: Colors.white,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Forget password?',
                          style: const TextStyle(color: Colors.white),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Forget password");
                            })
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormHelper.submitButton("Login", () {},
                    btnColor: Colors.transparent,
                    borderColor: Colors.white,
                    txtColor: Colors.white,
                    borderRadius: 10),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.white.withOpacity(.7)),
                    ),
                    TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/register');
                          })
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
