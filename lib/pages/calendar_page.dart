import 'package:flutter/material.dart';
import 'calendar_pages/basics_example.dart';
import 'calendar_pages/events_example.dart';
import 'calendar_pages/multi_example.dart';
import 'calendar_pages/range_example.dart';


class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Wydarzenia'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: Text('Basics'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableBasicsExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Range Selection'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableRangeExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Events'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableEventsExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Multiple Selection'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableMultiExample()),
            ),
          ),
        ],
      ),
    ),
  );
}