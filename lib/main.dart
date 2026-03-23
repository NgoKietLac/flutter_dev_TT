import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/data/repositories/music_repositories_impl.dart';
import 'package:flutter_application_1/module/domain/usecases/usecase_get_music.dart';
import 'package:flutter_application_1/module/presentation/cubit/music_cubit.dart';
import 'package:flutter_application_1/module/presentation/cubit/theme_cubit.dart';
import 'package:flutter_application_1/module/presentation/pages/home_music.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final repository = MusicRepositoriesImpl();
  final getMusicUseCase = GetMusicUseCase(repository);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MusicCubit(getMusicUseCase: getMusicUseCase)..loadMusicData(),
          child: const MyApp(),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Music',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: const HomeMusic(),
          // home: ListPage(),
        );
      },
    );
  }
}
