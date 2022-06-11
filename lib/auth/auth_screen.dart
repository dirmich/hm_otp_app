import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hm_otp_app/constants.dart';
import 'package:hm_otp_app/auth/login.dart';
import 'package:hm_otp_app/auth/singup.dart';
import 'package:hm_otp_app/auth/social_buttons.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isSignup = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void toggleView() {
    setState(() {
      _isSignup = !_isSignup;
    });
    _isSignup ? _animationController.forward() : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width * .88,
                  height: size.height,
                  left: _isSignup ? -size.width * .76 : 0,
                  child: Container(color: loginBg, child: const Login()),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    height: size.height,
                    width: size.width * .88,
                    left: _isSignup ? size.width * .12 : size.width * .88,
                    // left: size.width * .88,
                    child: Container(
                      color: singupBg,
                      child: const SignUp(),
                    )),
                AnimatedPositioned(
                  duration: defaultDuration,
                  top: size.height * .1,
                  left: 0,
                  right: _isSignup ? -size.width * .12 : size.width * .12,
                  // right: size.width * .12,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white60,
                    child: SvgPicture.asset(
                      "animation_logo.svg",
                      color: _isSignup ? singupBg : loginBg,
                    ),
                  ),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    // width: size.width * .88,
                    bottom: size.height * .1,
                    left: 0,
                    right: _isSignup ? -size.width * .12 : size.width * .12,
                    child: const SocialButtons()),
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _isSignup ? size.height / 2 : size.height * .3,
                  left: _isSignup ? 20 : size.width * .44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _isSignup ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                    child: Transform.rotate(
                      // angle: (_isSignup ? -90 : 0) * pi / 180,
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          if (_isSignup) {
                            toggleView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: PADDING * .75),
                          width: 160,
                          // color: Colors.red,
                          child: Text(
                            "Log In".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isSignup ? size.height / 2 : size.height * .3,
                  right: !_isSignup ? 20 : size.width * .44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: !_isSignup ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                    child: Transform.rotate(
                      // angle: (_isSignup ? -90 : 0) * pi / 180,
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if (!_isSignup) {
                            toggleView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: PADDING * .75),
                          // width: 160,
                          // color: Colors.red,
                          child: Text(
                            "Sign Up".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
