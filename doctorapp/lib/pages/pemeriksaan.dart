import 'dart:developer';

import 'package:doctorapp/pages/tambah_obat.dart';
import 'package:doctorapp/utils/colors.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:doctorapp/utils/strings.dart';
import 'package:doctorapp/utils/utility.dart';
import 'package:doctorapp/widgets/mynetworkimg.dart';
import 'package:doctorapp/widgets/mysvgassetsimg.dart';
import 'package:doctorapp/widgets/mytext.dart';
import 'package:doctorapp/widgets/mytextformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WritePrescription extends StatefulWidget {
  const WritePrescription({Key? key}) : super(key: key);

  @override
  State<WritePrescription> createState() => _WritePrescriptionState();
}

class _WritePrescriptionState extends State<WritePrescription> {
  final mSymptomsController = TextEditingController();
  final mDiagnosisController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
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
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    fit: BoxFit.fill,
                    imgHeight: 70,
                    imgWidth: 70,
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
                          mTitle: "Tonya Burns",
                          mTextAlign: TextAlign.start,
                          mTextColor: white,
                          mFontSize: 16,
                          mFontStyle: FontStyle.normal,
                          mFontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: terakhirdiperiksa,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: text70OpacColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "February 12, 2022",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          prescriptionTabs(),
        ],
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: statusBarColor,
      flexibleSpace: Container(
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
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: MySvgAssetsImg(
          imageName: "back.svg",
          fit: BoxFit.contain,
          imgHeight: Constant.backBtnHeight,
          imgWidth: Constant.backBtnWidth,
        ),
      ),
      title: MyText(
        mTitle: pemeriksaan,
        mFontSize: 20,
        mFontStyle: FontStyle.normal,
        mFontWeight: FontWeight.normal,
        mTextAlign: TextAlign.center,
        mTextColor: white,
      ),
    );
  }

  Widget prescriptionTabs() {
    return Expanded(
      child: DefaultTabController(
        length: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: blue,
              indicatorWeight: 3,
              unselectedLabelColor: tabDefaultColor,
              tabs: <Widget>[
                Tab(text: history),
                Tab(text: pemeriksaan),
                Tab(text: laboratorium1),
                Tab(text: radiologi1),
                Tab(text: resep),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: boxBorderColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  historyTab(),
                  diagnosisTab(),
                  laboratorium(),
                  radiologi(),
                  prescriptionTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget historyTab() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int position) => Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            log("$position Item Clicked!");
          },
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 44,
            ),
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 44,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: MyText(
                          mTitle: '${position + 1}st Konsultasi',
                          mFontSize: 14,
                          mFontStyle: FontStyle.normal,
                          mFontWeight: FontWeight.normal,
                          mTextAlign: TextAlign.start,
                          mMaxLine: 1,
                          mOverflow: TextOverflow.ellipsis,
                          mTextColor: textTitleColor,
                        ),
                      ),
                      MyText(
                        mTitle: 'April 05',
                        mFontSize: 12,
                        mFontStyle: FontStyle.normal,
                        mFontWeight: FontWeight.normal,
                        mTextAlign: TextAlign.center,
                        mMaxLine: 1,
                        mOverflow: TextOverflow.ellipsis,
                        mTextColor: otherLightColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.5,
                  color: boxBorderColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                MyText(
                  mTitle: symptoms_,
                  mFontSize: 12,
                  mFontWeight: FontWeight.normal,
                  mFontStyle: FontStyle.normal,
                  mTextAlign: TextAlign.start,
                  mTextColor: otherLightColor,
                ),
                const SizedBox(
                  height: 4,
                ),
                MyText(
                  mTitle: "Sakit kepala berat",
                  mFontSize: 14,
                  mFontWeight: FontWeight.normal,
                  mFontStyle: FontStyle.normal,
                  mTextAlign: TextAlign.start,
                  mTextColor: textTitleColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyText(
                  mTitle: diagnosis_,
                  mFontSize: 12,
                  mFontWeight: FontWeight.normal,
                  mFontStyle: FontStyle.normal,
                  mTextAlign: TextAlign.start,
                  mTextColor: otherLightColor,
                ),
                const SizedBox(
                  height: 4,
                ),
                MyText(
                  mTitle: "Dapatkan pil untuk menyembuhkan",
                  mFontSize: 14,
                  mFontWeight: FontWeight.normal,
                  mFontStyle: FontStyle.normal,
                  mTextAlign: TextAlign.start,
                  mTextColor: textTitleColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyText(
                  mTitle: prescription_,
                  mFontSize: 12,
                  mFontWeight: FontWeight.normal,
                  mFontStyle: FontStyle.normal,
                  mTextAlign: TextAlign.start,
                  mTextColor: otherLightColor,
                ),
                const SizedBox(
                  height: 4,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int position) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MyText(
                        mTitle: "Parasetamol",
                        mFontSize: 14,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: textTitleColor,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: otherLightColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          MyText(
                            mTitle: "250 mg",
                            mFontSize: 12,
                            mFontWeight: FontWeight.normal,
                            mTextAlign: TextAlign.start,
                            mTextColor: textTitleColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: otherLightColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          MyText(
                            mTitle: "Tablet",
                            mFontSize: 12,
                            mFontWeight: FontWeight.normal,
                            mTextAlign: TextAlign.start,
                            mTextColor: textTitleColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget diagnosisTab() {
    var mAnalyst;
    var mObjective;
    var mSubyektive;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              //===== Symptoms =====//
              MyText(
                mTitle: subjektive,
                mFontSize: 12,
                mFontWeight: FontWeight.normal,
                mFontStyle: FontStyle.normal,
                mTextAlign: TextAlign.start,
                mTextColor: textTitleColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 140,
                ),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: Utility.r10BGWithBorder(),
                alignment: Alignment.topCenter,
                child: MyTextFormField(
                  mHint: textHere,
                  mController: mSubyektive,
                  mObscureText: false,
                  mMaxLine: 1,
                  mReadOnly: true,
                  mHintTextColor: textHintColor,
                  mTextColor: textTitleColor,
                  mkeyboardType: TextInputType.text,
                  mTextInputAction: TextInputAction.next,
                  mInputBorder: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              MyText(
                mTitle: objective,
                mFontSize: 12,
                mFontWeight: FontWeight.normal,
                mFontStyle: FontStyle.normal,
                mTextAlign: TextAlign.start,
                mTextColor: textTitleColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 140,
                ),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: Utility.r10BGWithBorder(),
                alignment: Alignment.topCenter,
                child: MyTextFormField(
                  mHint: textHere,
                  mController: mObjective,
                  mObscureText: false,
                  mMaxLine: 1,
                  mReadOnly: true,
                  mHintTextColor: textHintColor,
                  mTextColor: textTitleColor,
                  mkeyboardType: TextInputType.text,
                  mTextInputAction: TextInputAction.next,
                  mInputBorder: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              MyText(
                mTitle: analyst,
                mFontSize: 12,
                mFontWeight: FontWeight.normal,
                mFontStyle: FontStyle.normal,
                mTextAlign: TextAlign.start,
                mTextColor: textTitleColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 140,
                ),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: Utility.r10BGWithBorder(),
                alignment: Alignment.topCenter,
                child: MyTextFormField(
                  mHint: textHere,
                  mController: mAnalyst,
                  mObscureText: false,
                  mMaxLine: 1,
                  mReadOnly: true,
                  mHintTextColor: textHintColor,
                  mTextColor: textTitleColor,
                  mkeyboardType: TextInputType.text,
                  mTextInputAction: TextInputAction.next,
                  mInputBorder: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Align(
                child: diagnosisSaveButton(),
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget laboratorium() {
    return Center(
      child: MyText(
        mTitle: 'Coming Soon...',
        mFontSize: 16,
        mFontWeight: FontWeight.bold,
        mFontStyle: FontStyle.normal,
        mTextAlign: TextAlign.start,
        mTextColor: accentColor,
      ),
    );
  }

  Widget radiologi() {
    return Center(
      child: MyText(
        mTitle: 'Coming Soon...',
        mFontSize: 16,
        mFontWeight: FontWeight.bold,
        mFontStyle: FontStyle.normal,
        mTextAlign: TextAlign.start,
        mTextColor: accentColor,
      ),
    );
  }

  Widget prescriptionTab() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int position) => Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  log("$position Item Clicked!");
                },
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 44,
                  ),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 44,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: MyText(
                                mTitle: 'Paracetamol (250mg)',
                                mFontSize: 14,
                                mFontStyle: FontStyle.normal,
                                mFontWeight: FontWeight.normal,
                                mTextAlign: TextAlign.start,
                                mMaxLine: 1,
                                mOverflow: TextOverflow.ellipsis,
                                mTextColor: textTitleColor,
                              ),
                            ),
                            MySvgAssetsImg(
                              imageName: "delete.svg",
                              fit: BoxFit.cover,
                              imgHeight: 22,
                              imgWidth: 22,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: boxBorderColor,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MyText(
                        mTitle: whenToTake,
                        mFontSize: 12,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: otherLightColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      MyText(
                        mTitle: "Sesudah Makan",
                        mFontSize: 14,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: textTitleColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyText(
                        mTitle: duration,
                        mFontSize: 12,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: otherLightColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      MyText(
                        mTitle: "5 hari",
                        mFontSize: 14,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: textTitleColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyText(
                        mTitle: additionalNote,
                        mFontSize: 12,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: otherLightColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      MyText(
                        mTitle: "Ambil satu tablet 3 kali sehari.",
                        mFontSize: 14,
                        mFontWeight: FontWeight.normal,
                        mFontStyle: FontStyle.normal,
                        mTextAlign: TextAlign.start,
                        mTextColor: textTitleColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          addMedicineButton(),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }

  Widget addMedicineButton() {
    return InkWell(
      focusColor: primaryColor,
      onTap: () {
        log("Clicked on Add Medicine Button!");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddMedicine()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: Constant.buttonHeight,
        decoration: Utility.primaryDarkButton(),
        alignment: Alignment.center,
        child: MyText(
          mTitle: tambahobat,
          mTextColor: white,
          mTextAlign: TextAlign.center,
          mFontSize: 16,
          mFontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget diagnosisSaveButton() {
    return InkWell(
      focusColor: primaryColor,
      onTap: () => log("Clicked on Diagnosis Save Button!"),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: Constant.buttonHeight,
        decoration: Utility.primaryDarkButton(),
        alignment: Alignment.center,
        child: MyText(
          mTitle: save.toUpperCase(),
          mTextColor: white,
          mTextAlign: TextAlign.center,
          mFontSize: 16,
          mFontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
