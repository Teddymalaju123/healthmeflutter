class ConfirmModel {
  int? dailyNo;
  String? food;
  String? exercise;
  String? calories;
  String? sleep;
  int? idtrainer;
  String? status;
  ConfirmModel(
      {this.dailyNo,
      this.food,
      this.exercise,
      this.calories,
      this.sleep,
      this.idtrainer,
      this.status});

  ConfirmModel.fromJson(Map<String, dynamic> json) {
    dailyNo = json['dailyNo'];
    food = json['food'];
    exercise = json['exercise'];
    calories = json['calories'];
    sleep = json['sleep'];
    idtrainer = json['Idtrainer'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyNo'] = this.dailyNo;
    data['food'] = this.food;
    data['exercise'] = this.exercise;
    data['calories'] = this.calories;
    data['sleep'] = this.sleep;
    data['Idtrainer'] = this.idtrainer;
    data['status'] = this.status;
    return data;
  }
}
