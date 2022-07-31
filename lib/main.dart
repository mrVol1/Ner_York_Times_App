import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/common/app_colors.dart';
import 'package:new_york_times/feature/presentation/bloc/news_list_cubit/news_list_cubit.dart';
import 'package:new_york_times/feature/presentation/pages/news_screen.dart';
import 'package:new_york_times/locator_service.dart';
import 'package:new_york_times/locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListCubit>(
      create: (context) => serverLocator<NewsListCubit>()..loadNews(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.mainBackground,
        ),
        home: const HomePage(),
      ),
    );
  }
}
