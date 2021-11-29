import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Dismissible(
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Delete Item'),
                    content: Text('Are You Sure?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Yes'))
                    ],
                  );
                },
              );
            },
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/person1.png')))),
              ),
              title: Text(
                faker.person.firstName(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(faker.lorem.sentence(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, color: Colors.black45)),
              trailing: Icon(Icons.phone),
            ),
          );
        },
      ),
    );
  }
}
