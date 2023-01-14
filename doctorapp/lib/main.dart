// @dart=2.9

import 'package:doctorapp/pages/splash.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PackageInfo packageInfo;
  @override
  void initState() {
    super.initState();
    getPackage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: blue,
        primaryColorLight: primaryLightColor,
        scaffoldBackgroundColor: appBgColor,
      ),
      title: Constant.appName.isNotEmpty ? Constant.appName : "DTDoctor",
      home: const Splash(),
    );
  }

  void getPackage() async {
    packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    Constant.appName = appName;
    print(Constant.appName);

    print(
        "App Name : ${appName}, App Package Name : ${packageName}, App Version : ${version}, App build Number : ${buildNumber}");
  }
}
