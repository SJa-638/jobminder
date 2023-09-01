// dart class
class Company {

  final String name;
  Company({required this.name});

  factory Company.fromJson(Map<String, Object> json) {
    return Company(
      name: json['name'] as String
    );
  }
}