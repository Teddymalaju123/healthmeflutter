class ConfirmModel {
  int? dailyNo;
  String? day;
  String? food;
  String? lunch;
  String? dinner;
  String? exercise;
  String? descripex;
  String? calories;
  String? sleep;
  int? idtrainer;
  String? status;

  ConfirmModel(
      {this.dailyNo,
      this.day,
      this.food,
      this.lunch,
      this.dinner,
      this.exercise,
      this.descripex,
      this.calories,
      this.sleep,
      this.idtrainer,
      this.status});

  ConfirmModel.fromJson(Map<String, dynamic> json) {
    dailyNo = json['dailyNo'];
    day = json['day'];
    food = json['food'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    exercise = json['exercise'];
    descripex = json['descripex'];
    calories = json['calories'];
    sleep = json['sleep'];
    idtrainer = json['Idtrainer'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyNo'] = this.dailyNo;
    data['day'] = this.day;
    data['food'] = this.food;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['exercise'] = this.exercise;
    data['descripex'] = this.descripex;
    data['calories'] = this.calories;
    data['sleep'] = this.sleep;
    data['Idtrainer'] = this.idtrainer;
    data['status'] = this.status;
    return data;
  }
}