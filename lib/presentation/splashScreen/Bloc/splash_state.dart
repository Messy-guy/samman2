part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class DisplaySplash extends SplashState {}

class Authenticated extends SplashState {}

class Unauthenticated extends SplashState {}
