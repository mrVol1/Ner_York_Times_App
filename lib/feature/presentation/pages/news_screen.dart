import 'package:flutter/material.dart';
import 'package:new_york_times/feature/presentation/widgets/news_list_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
      ),
      body: const NewsList(),
    );
  }
}
