import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Recipe.dart';

void main() async {
  await initializeDateFormatting('ms_MY', null);

  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  final HomePageModel _model = HomePageModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageWidget(model: _model),
    );
  }
}