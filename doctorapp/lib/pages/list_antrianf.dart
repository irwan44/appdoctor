import 'package:doctorapp/pages/itemantrian.dart';
import 'package:doctorapp/utils/constant.dart';
import 'package:flutter/material.dart';

class AllAppointmentF extends StatefulWidget {
  const AllAppointmentF({Key? key}) : super(key: key);

  @override
  State<AllAppointmentF> createState() => _AllAppointmentFState();
}

class _AllAppointmentFState extends State<AllAppointmentF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: upcomingAppintment(),
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
