import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/add_user.dart';
import 'package:crud/api_page.dart';
import 'package:crud/banner_page.dart';
import 'package:crud/crud_Page.dart';
import 'package:crud/edit_user.dart';
import 'package:crud/home_Page.dart';
import 'package:crud/home_page2.dart';
import 'package:crud/login_page.dart';
import 'package:crud/newPage.dart';
import 'package:crud/phone_page.dart';
import 'package:crud/profile_page.dart';
import 'package:crud/refresh_page.dart';
import 'package:crud/sign_page.dart';
import 'package:crud/splash_screen.dart';
import 'package:crud/verify_page.dart';
import 'package:crud/viva/viva_splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

var w;
var h;
var username;
var image;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        supportedLocales: [
          Locale(
            "en"
          ),
        ],
        localizationsDelegates: [
          CountryLocalizations.delegate
        ],
        theme: ThemeData(
        ),
        debugShowCheckedModeBanner: false,
        home: vivaSplashscreen(),
      ),
    );
  }
}

