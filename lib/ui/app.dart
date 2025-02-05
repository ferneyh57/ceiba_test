import 'package:ceiba_app/ui/config/injector/di.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc.dart';
import 'package:ceiba_app/ui/pages/user/bloc/user_bloc.dart';
import 'package:ceiba_app/ui/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (BuildContext context) => locator<PostBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => locator<UserBloc>()
        ),
      ],
      child: MaterialApp(
          title: 'Prueba de ingreso',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: false,
          ),
          home: const UserPage()),
    );
  }
}
