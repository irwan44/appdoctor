import 'dart:developer';

import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:badges/badges.dart';
import 'package:doctorapp/pages/list_antrianf.dart';
import 'package:doctorapp/pages/editprofilef.dart';
import 'package:doctorapp/pages/homef.dart';
import 'package:doctorapp/pages/notifications.dart';
import 'package:doctorapp/pages/medical_record.dart';
import 'package:doctorapp/utils/colors.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:doctorapp/utils/strings.dart';
import 'package:doctorapp/utils/utility.dart';
import 'package:doctorapp/widgets/myassetsimg.dart';
import 'package:doctorapp/widgets/mysvgassetsimg.dart';
import 'package:doctorapp/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  late String appBarTitle;
  late bool isHomePage, isRoundCorner;
  final navigationPages = [
    const HomeF(),
    const AllAppointmentF(),
    const PrescriptionF(),
    const EditProfileF(),
  ];

  @override
  initState() {
    super.initState();
    appBarTitle = Constant.appName;
    isHomePage = true;
    isRoundCorner = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appBgColor,
      appBar: appBarTitle == "Resep" ? null : homeAppBar(),
      body: navigationPages.elementAt(currentIndex),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: statusBarColor,
      flexibleSpace: Visibility(
        visible: isRoundCorner,
        replacement: Container(
          decoration: Utility.toolbarGradientBG(),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                gradStartColor,
                gradEndColor,
              ],
            ),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          AwesomeDrawerBar.of(context)!.toggle();
        },
        icon: MySvgAssetsImg(
          imageName: "drawer.svg",
          fit: BoxFit.contain,
          imgHeight: 13,
          imgWidth: 22,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: isHomePage,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyAssetsImg(
                  imageName: "app_icon.png",
                  fit: BoxFit.contain,
                  imgHeight: 22,
                  imgWidth: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          MyText(
            mTitle: appBarTitle,
            mFontSize: 20,
            mFontStyle: FontStyle.normal,
            mFontWeight: FontWeight.normal,
            mTextAlign: TextAlign.center,
            mTextColor: white,
          )
        ],
      ),
      actions: <Widget>[
        Visibility(
          visible: isHomePage,
          maintainSize: appBarTitle == resep ? false : true,
          maintainAnimation: true,
          maintainState: true,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Notifications()));
            },
            icon: Badge(
              position: BadgePosition.bottomStart(bottom: 8, start: 8),
              badgeColor: white,
              badgeContent: MyText(
                mTitle: '5',
                mFontSize: 8,
                mFontStyle: FontStyle.normal,
                mFontWeight: FontWeight.normal,
                mTextAlign: TextAlign.center,
                mTextColor: primaryColor,
              ),
              child: MySvgAssetsImg(
                imageName: "notification.svg",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Visibility(
          visible: appBarTitle == resep,
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          child: IconButton(
            onPressed: () {},
            icon: MySvgAssetsImg(
              imageName: "search.svg",
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }

  void onNavigationClick(int value) {
    log('$value');
    // Respond to item press.
    setState(() {
      currentIndex = value;
      switch (value) {
        case 0:
          {
            appBarTitle = Constant.appName;
            isHomePage = true;
            isRoundCorner = true;
          }
          break;
        case 1:
          {
            appBarTitle = anterian;
            isHomePage = false;
            isRoundCorner = false;
          }
          break;
        case 2:
          {
            appBarTitle = resep;
            isHomePage = false;
            isRoundCorner = true;
          }
          break;
        case 3:
          {
            appBarTitle = editProfile;
            isHomePage = false;
            isRoundCorner = true;
          }
          break;
      }
    });
  }
}
