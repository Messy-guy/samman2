import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon, FontAwesomeIcons;
import 'package:samman2/Common/helper/Navigation/Navigation.dart';
import 'package:samman2/presentation/Auth/Pages/SignUp.dart' show SignUp;
import 'package:samman2/presentation/Auth/Pages/passwordvisible/ispasswordvisible__cubit.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool ispasswordvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFD1C5ED),
                    Color(0xFFF0B5F2),
                  ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  )
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                minimum: EdgeInsets.only(left: 20, top: 80),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign In",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                              ),
                              TextSpan(
                                text: "Sign Up",
                                recognizer:TapGestureRecognizer()..onTap = (){
    AppNavigator.push(context, SignUp());
    },
                              )
                            ]
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _emailTextfield(),
                        _passwordfield(),
                        _Textbutton(),
                        const SizedBox(height: 70,),
                        _SigninButton(),
                        const SizedBox(height: 50,),
                        _orContinyeWith(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _emailTextfield() {
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email/Phone Number",
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "abcxyz@gmail.com",
                  hintStyle: TextStyle(
                    color: Colors.black87.withOpacity(0.4),
                    fontSize: 13,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF6A2566),
                          width: 3
                      )
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF6A2566),
                          width: 3
                      )
                  )
              ),
            ),
          ],
        )
    );
  }

  Widget _passwordfield() {
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password",
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            BlocBuilder<IspasswordvisibleCubit, bool>(
  builder: (context, isObsecured) {
    return TextField(
              obscureText: isObsecured,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: TextStyle(
                    color: Colors.black87.withOpacity(0.4),
                    fontSize: 13,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF6A2566),
                          width: 3
                      )
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF6A2566),
                          width: 3
                      )
                  ),
                  suffixIcon: IconButton(

                      onPressed : ()=>context.read<IspasswordvisibleCubit>().toogle(),

                      icon: Icon(isObsecured? Icons.visibility_off : Icons.visibility,)),
              ),
            );
  },
),
          ],
        )
    );
  }
  Widget _Textbutton(){
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0,top: 15),
        child: TextButton(onPressed: (){
          //moves to password recovery page screen
        }, child:Text("forget password",
          style: TextStyle(
              fontSize: 15
          ),
        ), ),
      ),
    );
  }

  Widget _SigninButton(){
    return Center(
      child: ElevatedButton(
          onPressed: (){

      },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Ink(
              decoration:BoxDecoration(
                gradient: LinearGradient(
                    begin:Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFFE988EA),
                  Color(0xFFB299DE),
                ]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                 padding: EdgeInsets.only(left: 100,right: 100,top: 20,bottom: 20),
                  child: Text("Sign In")))),
    );
  }

Widget _orContinyeWith()
{
  return Column(
    children: [
      Text("Or Continue With"),
      const SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            //login with facebook
          },
              icon: Icon(Icons.facebook,
              size: 35,
                color: Colors.blueAccent,
              ),
      ),
          SizedBox(width: 20,),
          IconButton(onPressed: (){
            //login with facebook
          },
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: 30,
              color: Colors.red,
            ),
          )
        ],
      ),
    ],
  );
}

}






