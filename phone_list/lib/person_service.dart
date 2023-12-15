import 'person_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PersonService {
  Future<List<Person>> fetchPersons() async {
    String jsonString = await rootBundle.loadString("assets/phone_list.json");
    Map peopleData = jsonDecode(jsonString);

    final peoples = <Person>[];
    peopleData['result'].forEach((v) {
      peoples.add(Person.fromJson(v));
    });
    return peoples;
  }
}
