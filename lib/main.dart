import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:rupa_lama_webiste/portfolio_home_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupa Lama - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}