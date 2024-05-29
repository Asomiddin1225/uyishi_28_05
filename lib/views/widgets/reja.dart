import 'package:flutter/material.dart';
import 'package:dars_45/model/App_settings.dart';

class PlansScreen extends StatefulWidget {
  @override
  _PlansScreenState createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  List<Reja> plans = [
    Reja(
      id: 1,
      title: '1-reja',
      description: 'Darsga borish',
      date: '2024-05-29',
    ),
    Reja(
      id: 2,
      title: '2-Reja',
      description:
          "Flutterda  AlertDialog\nekran ustiga yangi oyna ochishda ishlatiladi",
      date: '2023-05-30',
    ),
    Reja(
      id: 3,
      title: '3-Reja',
      description: 'dars qilish',
      date: '2023-05-31',
    ),
  ];

  void _addReja() {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Yangi Reja qo'shish"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Sarlavha'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Tavsif'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Sana (kun-oy-yil)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      dateController.text.isNotEmpty) {
                    plans.add(Reja(
                      id: plans.length + 1,
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dateController.text,
                    ));
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Qo'shish"),
            ),
          ],
        );
      },
    );
  }

  void _editReja(int index) {
    TextEditingController titleController =
        TextEditingController(text: plans[index].title);
    TextEditingController descriptionController =
        TextEditingController(text: plans[index].description);
    TextEditingController dateController =
        TextEditingController(text: plans[index].date);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rejani tahrirlash'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  plans[index] = Reja(
                    id: plans[index].id,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: dateController.text,
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Saqlash'),
            ),
          ],
        );
      },
    );
  }

  void _deleteReja(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reja')),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: ListTile(
                  title: Text(plans[index].title),
                  subtitle:
                      Text('${plans[index].description}\n${plans[index].date}'),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editReja(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteReja(index),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReja,
        child: Icon(Icons.add),
      ),
    );
  }
}
