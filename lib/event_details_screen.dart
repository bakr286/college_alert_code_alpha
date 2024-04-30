import 'package:college_alert_application/DefaultScreen.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  final AlertData event;

  EventDetailsScreen({required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.event.details, style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 16.0),
            Text("Date: ${widget.event.time.toString().substring(0, 16)}"),
          ],
        ),
      ),
    );
  }
}
