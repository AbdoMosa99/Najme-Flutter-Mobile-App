import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najme/CA/Features/Home/Cubit/home_cubit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final List<SingleChildWidget> _appProviders = [
    BlocProvider(
      create: (context) => HomeCubit(),
    ),
  ];

  static Widget multiProviders({
    required Widget child,
  }) {
    return MultiProvider(
      providers: _appProviders,
      child: child,
    );
  }
}
