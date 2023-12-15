class Person {
  String? name;
  String? phoneNumber;

  Person({this.name, this.phoneNumber});

  Person.fromJson(Map<String, dynamic> json)
      : name = "${json["first_name"]} ${json["last_name"]}",
        phoneNumber = json["number_phone"];
}
