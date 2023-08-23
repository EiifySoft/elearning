import 'package:elearning/features/auth/login/bloc/login_bloc.dart';
import 'package:elearning/features/auth/register/bloc/register_bloc.dart';
import 'package:elearning/features/counter/bloc/counter_bloc.dart';
import 'package:elearning/features/main/build_main/bloc/main_bloc.dart';
import 'package:elearning/features/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlockProvider {
  static get provider => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => MainBloc()),
        BlocProvider(create: (context) => CounterBloc()),
      ];
}
