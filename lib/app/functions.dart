import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isNumeric(String num) {
  return RegExp(r'^-?[0-9]+$').hasMatch(num);
}

dateFormat(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm").parse(date);
  var inputDate = DateTime.parse(tempDate.toString());
  var outputFormat = DateFormat('dd MMMM yyyy HH:mm');
  var outputDate = outputFormat.format(inputDate);
  return outputDate.toString();
}

dateFormat2(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
  var inputDate = DateTime.parse(tempDate.toString());
  var outputFormat = DateFormat('dd MMMM yyyy');
  var outputDate = outputFormat.format(inputDate);
  return outputDate.toString();
}

dateToStringFormat(DateTime? dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime!);
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 700;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 700;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
