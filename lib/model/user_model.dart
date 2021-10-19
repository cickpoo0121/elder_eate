class User {
  String? username;
  int? age;
  int? sex;
  double? weight;
  double? height;
  String? disease;
  String? line;

  User({
    this.username,
    this.age,
    this.sex,
    this.weight,
    this.height,
    this.disease,
    this.line,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'age': age,
      'sex': sex,
      'weight': weight,
      'height': height,
      'disease': disease,
      'line': line
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      age: json['age'],
      sex: json['sex'],
      weight: json['weight'],
      height: json['height'],
      disease: json['disease'],
      line: json['line'],
    );
  }
}
