import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

dateFormat(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm").parse(date);
  var inputDate = DateTime.parse(tempDate.toString());
  var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
  var outputDate = outputFormat.format(inputDate);
  return outputDate.toString();
}

dateToStringFormat(DateTime? dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime!);
}


bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 650;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
