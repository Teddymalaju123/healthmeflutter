class Modulefood {
  int? id;
  String? food;
  String? calories;
  String? waytype;

  Modulefood({this.id, this.food, this.calories, this.waytype});

  Modulefood.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    food = json['food'];
    calories = json['calories'];
    waytype = json['waytype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['food'] = this.food;
    data['calories'] = this.calories;
    data['waytype'] = this.waytype;
    return data;
  }
}
