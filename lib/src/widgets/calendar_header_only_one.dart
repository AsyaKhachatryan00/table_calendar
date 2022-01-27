import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHeaderOnlyOne extends StatelessWidget {
  final DateTime focusedMonth;
  final Function(DragUpdateDetails details) onHorizontalDragUpdate;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final SwiperController controller;

  const CalendarHeaderOnlyOne(
      {required this.focusedMonth,
      required this.controller,
      required this.onHorizontalDragUpdate,
      required this.onLeftChevronTap,
      required this.onRightChevronTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: GestureDetector(
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          child: Swiper(
              controller: controller,
              itemCount: 12,
              index: focusedMonth.month,
              viewportFraction: 0.2,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (Months.values[index].index + 1 == focusedMonth.month) {
                  return Text(
                    DateFormat('MMM').format(focusedMonth),
                    style: getStyle(
                        fontSize: 26,
                        color: Color.fromRGBO(72, 124, 164, 1),
                        weight: FontWeight.w500),
                  );
                }
                return _month(Months.values[index]);
              }),
        ));
  }

  Widget _month(Months month) {
    return Container(
      child: Text(
        month.getMonths(),
        style: getStyle(),
      ),
    );
  }

  TextStyle getStyle(
      {FontWeight? weight = FontWeight.w500,
      double? fontSize = 26,
      String fontFamily = 'Quicksand',
      FontStyle? fontStyle = FontStyle.normal,
      Color? color = const Color.fromRGBO(133, 145, 154, 1),
      double? height}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: weight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        height: height,
        color: color);
  }
}
