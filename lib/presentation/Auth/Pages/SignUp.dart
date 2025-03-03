import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon, FontAwesomeIcons;
import 'package:samman2/Common/helper/Navigation/Navigation.dart' show AppNavigator;
import 'package:samman2/Common/helper/UserType/userType.dart';

import 'package:samman2/presentation/Auth/Pages/RadioBUTTONBLOC/radiobutton_cubit.dart';
import 'package:samman2/presentation/Auth/Pages/SignIn.dart' show Signin;
import 'package:samman2/presentation/Auth/Pages/checkboxbloc/checkbox_cubit.dart' show CheckboxCubit, CheckboxState;
import 'package:samman2/presentation/Auth/Pages/passwordvisible/ispasswordvisible__cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool ispasswordvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                    Text("Sign up",
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
                                text: "Already Have an Account? ",
                              ),
                              TextSpan(
                                text: "Sign In",
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  AppNavigator.push(context, Signin());
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
                        _RadioButton(),
                        Namefield(),
                        _emailTextfield(),
                        _passwordfield(),
                        _Addressfield(),
                        _emergencyContactfield(),
                        _TermsandConditon(),
                        const SizedBox(height: 10,),
                       _CreateAccountButton(),
                        const SizedBox(height: 10,),
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
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
                  hintText: "abcxyz@gmail.com/986545322",
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

  Widget Namefield() {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full Name",
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "John Doe",
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
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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

  Widget _CreateAccountButton(){
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
                  child: Text("Create Account")))),
    );
  }

  Widget _orContinyeWith()
  {
    return Column(
      children: [
        Text("Or Continue With"),
        const SizedBox(height: 10,),
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

  Widget _Addressfield() {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Address",
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "kathmandu",
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
  Widget _emergencyContactfield() {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Emergency Contact",
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "98111111111111",
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

  Widget _RadioButton(){
    return BlocBuilder<RadioButtonCubit, String>(
      builder: (context, selectedvalue) {
        return Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select User Type:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio<String>
                    (value: "Elder",
                    groupValue: selectedvalue,
                    onChanged:
                        (value){
                      context.read<RadioButtonCubit>().selectOption(value!);
                    },
                    activeColor: Color(0xFF6A2566),

                  ),
                  const Text("Elder"),
                  Radio<String>
                    (value: "Family",
                    groupValue: selectedvalue,
                    onChanged:
                        (value){
                      context.read<RadioButtonCubit>().selectOption(value!);
                    },
                    activeColor: Color(0xFF6A2566),

                  ),
                  const Text("Family"),
                  Radio<String>
                    (value: "Caregiver",
                    groupValue: selectedvalue,
                    onChanged:
                        (value){
                      context.read<RadioButtonCubit>().selectOption(value!);
                    },
                    activeColor: Color(0xFF6A2566),

                  ),
                  const Text("Caregiver"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

Widget _TermsandConditon(){
    return BlocBuilder<CheckboxCubit,CheckboxState>(
  builder: (context, state) {
    return CheckboxListTile(
      title: Text("I agree to the Terms and Conditions"),
        value: state.isChecked,
        onChanged: (value){
          context.read<CheckboxCubit>().toggleCheckbox();
        },
      controlAffinity: ListTileControlAffinity.leading,
    );
  },
);
}
}






