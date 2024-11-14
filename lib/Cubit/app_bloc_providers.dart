import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Cubit/cubits.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;
  
  const AppBlocProviders({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DropdownCubit()),
        BlocProvider(create: (_) => TabsIndexCubit()),
        BlocProvider(create: (_) => FavouriteCubit(false)),
        BlocProvider(create: (_) => CustomCounterCubit()),
        BlocProvider(create: (_) => SizeButtonCubit(0)),
         BlocProvider(create: (_) => TabsCubit(0)),

        
      ],
      child: child,
    );
  }
}
