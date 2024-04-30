import 'package:college_alert_application/DefaultScreen.dart';
import 'package:flutter/material.dart';

String title = '';
String description = '';
String selectedCategory = 'Personal';
DateTime selectedDateTime = DateTime(0);
final _formKey = GlobalKey<FormState>();

class AlertAddingScreen extends StatefulWidget {
  const AlertAddingScreen({Key? key}) : super(key: key);

  @override
  State<AlertAddingScreen> createState() => _AlertAddingScreenState();
}

class _AlertAddingScreenState extends State<AlertAddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Alert'),
        shadowColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  title = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onChanged: (value) {
                  description = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                },
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButton<String>(
                hint: const Text('Select a category'),
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('time'),
                    onPressed: () => _selectDateTime(context),
                    
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedDateTime != DateTime(0)
                            ? selectedDateTime.toString().substring(0, 16)
                            : 'Time selected:none'),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      if (selectedCategory == 'Personal') {
                        Personal.add(
                          AlertData(
                            title: title,
                            details: description,
                            category: selectedCategory.toString(),
                            time: selectedDateTime,
                          ),
                        );
                      }

                      if (selectedCategory == 'Educational') {
                        Educational.add(
                          AlertData(
                            title: title,
                            details: description,
                            category: selectedCategory.toString(),
                            time: selectedDateTime,
                          ),
                        );
                      }

                      if (selectedCategory == 'Work') {
                        Work.add(
                          AlertData(
                            title: title,
                            details: description,
                            category: selectedCategory.toString(),
                            time: selectedDateTime,
                          ),
                        );
                      }
                      setState(() {
                        selectedDateTime=DateTime(0);
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                      );
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }
}
