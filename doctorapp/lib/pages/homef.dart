import 'package:doctorapp/pages/list_antrian.dart';
import 'package:doctorapp/pages/medical_record.dart';
import 'package:doctorapp/pages/itemantrian.dart';
import 'package:doctorapp/utils/colors.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:doctorapp/utils/strings.dart';
import 'package:doctorapp/utils/utility.dart';
import 'package:doctorapp/widgets/my_colors.dart';
import 'package:doctorapp/widgets/my_font_size.dart';
import 'package:doctorapp/widgets/mynetworkimg.dart';
import 'package:doctorapp/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/widgets/custom_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeF extends StatefulWidget {
  const HomeF({Key? key}) : super(key: key);

  @override
  State<HomeF> createState() => _HomeFState();
}

class _HomeFState extends State<HomeF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: myHomePage(),
    );
  }

  Widget myHomePage() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        doctorDetails(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
        ),
        const SizedBox(height: 15),
        Container(),
        const SizedBox(height: 15),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                CustomCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrescriptionF()));
                  },
                  shadow: false,
                  width: double.infinity,
                  bgColor: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                        shadow: false,
                        height: 50,
                        width: 50,
                        bgColor: blue,
                        borderRadius: BorderRadius.circular(100),
                        // child: Center(
                        //   child: Icon(
                        //     MyFlutterApp.group_95,
                        //     color: MyColors.white,
                        //   ),
                        // )
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "History Medical Record",
                        style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Menunjukan Data Medical Record Pasien",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.blackText.withOpacity(.8),
                          fontSize: MyFontSize.small3,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllUpcomingAppointment()));
                  },
                  shadow: false,
                  width: double.infinity,
                  bgColor: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                        shadow: false,
                        height: 50,
                        width: 50,
                        bgColor: blue,
                        borderRadius: BorderRadius.circular(100),
                        // child: Center(
                        //     child: Icon(
                        //   MyFlutterApp.group_96,
                        //   color: MyColors.white,
                        // ))
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Antrian Pasien",
                        style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Menunjukan Data Antrian Pasien",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.blackText.withOpacity(.8),
                          fontSize: MyFontSize.small3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                CustomCard(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PrescriptionF()));
                  },
                  shadow: false,
                  width: double.infinity,
                  bgColor: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                          shadow: false,
                          height: 50,
                          width: 50,
                          bgColor: blue,
                          borderRadius: BorderRadius.circular(100),
                          child: Center(
                              child: Icon(
                            Icons.money_sharp,
                            color: MyColors.white,
                          ))),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Pendapatan",
                        style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: MyFontSize.medium1,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Menunjukan Data Pendapatan Docter",
                        style: TextStyle(
                          color: MyColors.blackText.withOpacity(.8),
                          fontSize: MyFontSize.small3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget doctorDetails() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      decoration: Utility.toolbarGradientBG(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            clipBehavior: Clip.antiAlias,
            child: MyNetworkImage(
              imageUrl:
                  "https://img.freepik.com/free-photo/smiling-touching-arms-crossed-room-hospital_1134-799.jpg?w=1380&t=st=1661764029~exp=1661764629~hmac=7dd3e6e6123ce11be849005fcd980783ef83cb41704771e891cecffe79937b92",
              fit: BoxFit.fill,
              imgHeight: 106,
              imgWidth: 100,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText(
                    mTitle: "Dr. Musa Nurahman",
                    mTextAlign: TextAlign.start,
                    mTextColor: white,
                    mFontSize: 22,
                    mFontStyle: FontStyle.normal,
                    mFontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  MyText(
                    mTitle: "Cancer Specialist",
                    mTextAlign: TextAlign.start,
                    mTextColor: text70OpacColor,
                    mFontSize: 14,
                    mFontStyle: FontStyle.normal,
                    mFontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MyText(
                        mTitle: "Klinik",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      MyText(
                        mTitle: ":",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      MyText(
                        mTitle: "Omega Raya",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MyText(
                        mTitle: "Politeknik",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      MyText(
                        mTitle: ":",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                      MyText(
                        mTitle: "Dokter Umum",
                        mTextAlign: TextAlign.start,
                        mTextColor: text70OpacColor,
                        mFontSize: 14,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
