import 'package:flutter/material.dart';
import 'list_of_doctors.dart';
import 'form.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class CalendarScreen extends StatelessWidget
{
  CalendarScreen({Key key, this.record}) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Calendar(
        title: 'Meeting with ' + this.record.name,
        record: this.record,
      ),
    );
  }
}


class Calendar extends StatefulWidget
{
  Calendar({Key key, this.title, this.record}) : super(key: key);

  final String title;
  final Record record;

  @override
  CalendarState createState() => new CalendarState(record);
}

class CalendarState extends State<Calendar>
{
  DateTime _currentDate = DateTime.now();
  List<DateTime> _markedDate = [];

  CalendarState(Record record) {
    if (record.meetings != null) {
      for (var meeting in record.meetings) {
        this._markedDate.add(meeting['date']);
      }
    }
  }

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
            if (!_markedDate.contains(date) &&
                date.isAfter(DateTime.now())) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new FormRegister())
              );
            }
         //   this.setState(() => _currentDate = date);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
         markedDateWidget: new Positioned(
             child: Container(
               color: Colors.red,
             )
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