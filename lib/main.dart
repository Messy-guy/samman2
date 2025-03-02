import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samman2/presentation/Auth/Pages/passwordvisible/ispasswordvisible__cubit.dart' show IspasswordvisibleCubit;
import 'package:samman2/presentation/splashScreen/Bloc/splash_cubit.dart';
import 'package:samman2/presentation/splashScreen/ui/splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appstarted()),
        BlocProvider(create: (context) => IspasswordvisibleCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF0B5F2),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
