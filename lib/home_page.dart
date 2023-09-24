import 'package:flutter/material.dart';
import 'package:imran_ipa/page_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageSelector(),
    );
  }
}
