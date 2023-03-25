class UserInfo {
  String? username;
  String? password;
  String? email;
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? gender;
  String? dateofbirth;
  String? weight;
  String? height;
  String? goaloption;
  String? targetweight;
  String? dateoftarget;
  String? wayoption;
  String? typeuser;
  String? imagepassusertrianer;

  UserInfo(
      {this.username,
      this.password,
      this.email,
      this.firstname,
      this.lastname,
      this.phonenumber,
      this.gender,
      this.dateofbirth,
      this.weight,
      this.height,
      this.goaloption,
      this.targetweight,
      this.dateoftarget,
      this.wayoption,
      this.typeuser,
      this.imagepassusertrianer});

  UserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phonenumber = json['phonenumber'];
    gender = json['gender'];
    dateofbirth = json['dateofbirth'];
    weight = json['weight'];
    height = json['height'];
    goaloption = json['goaloption'];
    targetweight = json['targetweight'];
    dateoftarget = json['dateoftarget'];
    wayoption = json['wayoption'];
    typeuser = json['typeuser'];
    imagepassusertrianer = json['imagepassusertrianer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phonenumber'] = this.phonenumber;
    data['gender'] = this.gender;
    data['dateofbirth'] = this.dateofbirth;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['goaloption'] = this.goaloption;
    data['targetweight'] = this.targetweight;
    data['dateoftarget'] = this.dateoftarget;
    data['wayoption'] = this.wayoption;
    data['typeuser'] = this.typeuser;
    data['imagepassusertrianer'] = this.imagepassusertrianer;
    return data;
  }
}