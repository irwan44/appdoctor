import 'dart:developer';

import 'package:doctorapp/model/timeschedule.dart';
import 'package:doctorapp/widgets/mysvgassetsimg.dart';
import 'package:doctorapp/widgets/mytext.dart';
import 'package:flutter/material.dart';

import 'package:doctorapp/utils/colors.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/myappbarwithback.dart';
import 'constant.dart';

class Utility {
  static void showToast(var msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: white,
        textColor: black,
        fontSize: 16);
  }

  static PreferredSize appBarCommon(var appBarTitle) {
    return PreferredSize(
      preferredSize: Size.fromHeight(Constant.appBarHeight),
      child: MyAppBarWithBack(
        abTitle: appBarTitle,
        fontSize: Constant.appBarTextSize,
        abBGColor: appBgColor,
        fontColor: white,
      ),
    );
  }

  static AppBar myAppBar(BuildContext context, String appBarTitle) {
    return AppBar(
      elevation: 0,
      backgroundColor: statusBarColor,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: toolbarGradientBG(),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: MySvgAssetsImg(
          imageName: "back.svg",
          fit: BoxFit.contain,
          imgHeight: 15,
          imgWidth: 19,
        ),
      ),
      title: MyText(
        mTitle: appBarTitle,
        mFontSize: 20,
        mFontStyle: FontStyle.normal,
        mFontWeight: FontWeight.normal,
        mTextAlign: TextAlign.center,
        mTextColor: white,
      ),
    );
  }

  static BoxDecoration textFieldBGWithBorder() {
    return BoxDecoration(
      color: white,
      border: Border.all(
        color: otherLightColor,
        width: .2,
      ),
      borderRadius: BorderRadius.circular(4),
      shape: BoxShape.rectangle,
    );
  }

  static BoxDecoration r4BGWithBorder() {
    return BoxDecoration(
      color: white,
      border: Border.all(
        color: otherLightColor,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(4),
      shape: BoxShape.rectangle,
    );
  }

  static BoxDecoration r4DarkBGWithBorder() {
    return BoxDecoration(
      color: blue,
      border: Border.all(
        color: primaryDarkColor,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(4),
      shape: BoxShape.rectangle,
    );
  }

  static BoxDecoration r10BGWithBorder() {
    return BoxDecoration(
      color: white,
      border: Border.all(
        color: otherLightColor,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(10),
      shape: BoxShape.rectangle,
    );
  }

  static BoxDecoration primaryDarkButton() {
    return BoxDecoration(
      color: blue,
      borderRadius: BorderRadius.circular(5),
      shape: BoxShape.rectangle,
    );
  }

  static BoxDecoration toolbarGradientBG() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          gradStartColor,
          gradEndColor,
        ],
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      shape: BoxShape.rectangle,
    );
  }

  static Html htmlTexts(var strText) {
    return Html(
      data: strText,
      onLinkTap: (url) async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.platformDefault,
          );
        } else {
          throw 'Could not launch $url';
        }
      },
      shrinkToFit: false,
      linkStyle:
          const TextStyle(decoration: TextDecoration.none, color: linkColor),
      defaultTextStyle: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 14,
          color: otherLightColor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: .2,
        ),
      ),
    );
  }

  static Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunchUrl(Uri.parse(phoneUri.toString()))) {
        await launchUrl(Uri.parse(phoneUri.toString()));
      }
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  static List<TimeScheduleModel> getTimeFromSlot(
      String duration, String startTime, String endTime) {
    List<TimeScheduleModel> timeList = [];
    DateFormat hhmmFormatter = DateFormat("HH:mm");
    DateFormat mmFormatter = DateFormat("hh:mm a");

    log('startTime => $startTime');
    log('endTime => $endTime');
    DateTime start = hhmmFormatter.parse(startTime);
    DateTime end = hhmmFormatter.parse(endTime);
    Duration durationGap = Duration(minutes: int.parse(duration));
    log('durationGap => $durationGap');
    log('start => $start');
    log('end => $end');

    log('start Milli => ${start.minute}');
    log('end Milli => ${end.minute}');
    Duration difference = end.difference(start);
    log('(1). difference => $difference');

    if (difference.isNegative) {
      DateTime dateMax = hhmmFormatter.parse("24:00");
      DateTime dateMin = hhmmFormatter.parse("00:00");
      difference = ((dateMax.difference(start)) + (end.difference(dateMin)));
      log('(2). difference => $difference');
    }

    int days = difference.inDays;
    double hours = difference.inHours % 24;
    double minutes = difference.inMinutes % 60;
    double seconds = difference.inSeconds % 60;
    log('==days=> $days');
    log('==hours=> $hours');
    log('==minutes=> $minutes');
    log('==seconds=> $seconds');

    double parts = 0;
    double totalMinutes = 0;

    if (hours > 0 && hours < 24) {
      totalMinutes = hours * 60;
      parts = (totalMinutes / double.parse(duration));
      log('parts : if ==> $parts');
    } else if (minutes > 0 && minutes < 60) {
      totalMinutes = totalMinutes + minutes;
      parts = (totalMinutes / double.parse(duration));
      log('parts : else if ==> $parts');
    }

    if (parts > 0) {
      for (int i = 0; i < parts; i++) {
        TimeScheduleModel scheduleModel = TimeScheduleModel();
        scheduleModel.setTime = mmFormatter.format(start);
        timeList.add(scheduleModel);
        DateTime dateTime = start.add(durationGap);
        start = dateTime;
        log('newTime :==> ${mmFormatter.format(start)}');
      }
    }

    return timeList;
  }
}
