class Friend {
  final String id;
  final String name;
  final String age;

  Friend({this.name, this.age, this.id});

  Friend.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'],
        age = snapshot['age'];

  Map<String, String> toJson() {
    return {'name': name, 'age': age};
  }
}