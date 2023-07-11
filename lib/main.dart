import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/presentation/home/page/home_page.dart';
import 'package:flutter_graphql_example/presentation/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          title: 'Graphql Example',
          home: const HomePage()),
    );
  }
}
