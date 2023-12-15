import 'package:flutter/material.dart';
import 'person_model.dart';
import 'person_service.dart';

class HomeScreen extends StatelessWidget {
  final PersonService personService = PersonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set out appbar title.
        title: Text('Daftar Nomor Telepon'),
      ),
      body: Container(
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snaphot) {
              if (snaphot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          child: ListView.builder(
                              itemCount: snaphot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snaphot.data?[index];

                                return ListTile(
                                  title: Text(currentPerson!.name!),
                                  subtitle: Text(
                                      "Phone: ${currentPerson.phoneNumber}"),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (snaphot.hasError) {
                return Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 82.0,
                  ),
                );
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
