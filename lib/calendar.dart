import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class Calendar extends StatefulWidget
{
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CalendarState createState() => new CalendarState();
}

class CalendarState extends State<Calendar>
{
  DateTime _currentDate = DateTime(2018, 8, 1);
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
          onDayPressed: (DateTime date) {
            this.setState(() => _currentDate = date);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
          markedDates: _markedDate,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: false,
        ),
      ),
    );
  }
}