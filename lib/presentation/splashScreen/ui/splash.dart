import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:samman2/Common/helper/Navigation/Navigation.dart';
import 'package:samman2/Core/configs/assets/app_images.dart';
import 'package:samman2/presentation/Auth/Pages/SignIn.dart';
import 'package:samman2/presentation/Auth/Pages/SignUp.dart' show Signup;

import '../Bloc/splash_cubit.dart'
    show Authenticated, SplashCubit, SplashState, Unauthenticated;

import '../Bloc/splash_cubit.dart' show SplashState;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSecondText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Future <void> _Startanimation() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _showSecondText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is Authenticated){
            AppNavigator.pushReplacement(context, Signin());
          }
          if(state is Unauthenticated){
           AppNavigator.pushAndRemove(context, Signup());
          }
        },
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.splash)),
                  ),
                ),
                SizedBox(height: 20,),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText("WELCOME TO SAMMAN",
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                  totalRepeatCount: 1,
                  onFinished: () {
                    _Startanimation();
                  },
                ),
                SizedBox(height: 20,),
                if (_showSecondText)
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Smart. Reliable. Compassionate \n"
                            " Care—Powered by AI.",
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                SizedBox(height: 70,),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    color: Color(0xFF89BBAFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
