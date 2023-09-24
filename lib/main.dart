import 'package:flutter/material.dart';
import 'package:imran_ipa/home_page.dart';
import 'package:imran_ipa/providers/image_provider.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/providers/upload_progress_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageRouteProvider()),
        ChangeNotifierProvider(create: (_) => ImgProvider()),
        ChangeNotifierProvider(create: (_) => UploadProgressProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'elRed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black)),
      home: const HomePage(),
    );
  }
}
