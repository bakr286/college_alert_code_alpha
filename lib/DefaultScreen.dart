import 'package:college_alert_application/AlertAddingScreen.dart';
import 'package:college_alert_application/event_details_screen.dart';

import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertAddingScreen()),
              );
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text('college alerts',style: TextStyle( fontWeight: FontWeight.bold),),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to alerts management',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  categoryPersonal(),
                  categoryEducational(),
                  categoryWork(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AlertData {
  final String title;
  final String details;
  final String category;
  final DateTime time;
  AlertData({
    required this.title,
    required this.details,
    required this.category,
    required this.time,
  });
}

final List<String> categories = ['Personal', 'Educational', 'Work'];
final List<AlertData> Personal = [];
final List<AlertData> Educational = [];
final List<AlertData> Work = [];

class categoryPersonal extends StatefulWidget {
  @override
  State<categoryPersonal> createState() => _categoryPersonalState();
}

class _categoryPersonalState extends State<categoryPersonal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient:
                  const LinearGradient(colors: [Colors.yellow, Colors.orange])),
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Personal.length,
              itemBuilder: (content, index) {
                final event = Personal[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(event: event),
                      ),
                    ),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(event.title),
                          Text(event.time.toString().substring(10, 16)),
                          Text(event.time.toString().substring(0, 10)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class categoryEducational extends StatefulWidget {
  @override
  State<categoryEducational> createState() => _categoryEducationalState();
}

class _categoryEducationalState extends State<categoryEducational> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Educational',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 225, 255),
                Colors.blueAccent,
                Colors.blue
              ])),
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Educational.length,
              itemBuilder: (content, index) {
                final event = Educational[index];
                if (event.category == 'Educational') {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(event: event),
                        ),
                      ),
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.lightBlueAccent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(event.title),
                            Text(event.time.toString().substring(10, 16)),
                            Text(event.time.toString().substring(0, 10)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}

class categoryWork extends StatefulWidget {
  @override
  State<categoryWork> createState() => _categoryWorkState();
}

class _categoryWorkState extends State<categoryWork> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Work',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  colors: [Colors.greenAccent, Colors.green])),
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Work.length,
              itemBuilder: (content, index) {
                final event = Work[index];
                if (event.category == 'Work') {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(event: event),
                        ),
                      ),
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(event.title),
                            Text(event.time.toString().substring(10, 16)),
                            Text(event.time.toString().substring(0, 10)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
