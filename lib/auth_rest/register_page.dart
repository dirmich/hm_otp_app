import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;

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
            child: _RegisterUI(context),
          ),
        ),
      ),
    );
  }

  Widget _RegisterUI(BuildContext context) {
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
                    'Register',
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
                FormHelper.inputFieldWidget(context, 'email', 'E-mail', (val) {
                  if (val.isEmpty) {
                    return "Email can't be empty";
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
                      Icons.mail,
                    ),
                    showPrefixIcon: true,
                    prefixIconColor: Colors.white),
                const SizedBox(
                  height: 16,
                ),
                FormHelper.submitButton("Register", () {},
                    btnColor: Colors.transparent,
                    borderColor: Colors.white,
                    txtColor: Colors.white,
                    borderRadius: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
