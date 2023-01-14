import 'package:doctorapp/pages/itemantrian.dart';
import 'package:doctorapp/utils/colors.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:doctorapp/utils/strings.dart';
import 'package:doctorapp/utils/utility.dart';
import 'package:doctorapp/widgets/mysvgassetsimg.dart';
import 'package:doctorapp/widgets/mytext.dart';
import 'package:flutter/material.dart';

class AllUpcomingAppointment extends StatefulWidget {
  const AllUpcomingAppointment({Key? key}) : super(key: key);

  @override
  State<AllUpcomingAppointment> createState() => _AllUpcomingAppointmentState();
}

class _AllUpcomingAppointmentState extends State<AllUpcomingAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 14),
        child: upcomingAppintment(),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: statusBarColor,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: Utility.toolbarGradientBG(),
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
        mTitle: anterian,
        mFontSize: 20,
        mFontStyle: FontStyle.normal,
        mFontWeight: FontWeight.normal,
        mTextAlign: TextAlign.center,
        mTextColor: white,
      ),
    );
  }

  Widget upcomingAppintment() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Constant.dummyDataList.length,
      itemBuilder: (BuildContext context, int position) =>
          UpcomingAppointmentItem(
        Constant.dummyDataList[position].title,
        Constant.dummyDataList[position].subTitle,
        Constant.dummyDataList[position].imageUrl,
        Constant.dummyDataList[position].mobileNumber,
        Constant.dummyDataList[position].date,
        Constant.dummyDataList[position].status,
      ),
    );
  }
}
