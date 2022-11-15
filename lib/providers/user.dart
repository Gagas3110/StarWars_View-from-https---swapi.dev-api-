class User {
  double? id;
  String? userCode;
  double? companyId;
  double? employeeId;
  double? roleId;
  User({
    this.id,
    this.userCode,
    this.companyId,
    this.employeeId,
    this.roleId,
  });

  factory User.map(List<dynamic> obj) => User(
        id: double.parse(obj[0]),
        userCode: obj[1],
        companyId: double.parse(obj[2]),
        employeeId: double.parse(obj[3]),
        roleId: double.parse(obj[4]),
      );

  double? get _id => id;
  String? get _userCode => userCode;
  double? get _companyId => companyId;
  double? get _employeeId => employeeId;
  double? get _roleId => roleId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["userCode"] = _userCode;
    map["companyId"] = _companyId;
    map["employeeId"] = _employeeId;
    map["roleId"] = _roleId;
    return map;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? gender;
  String? email;
  String? phoneNo;
  String? password;
  String? token;
  String? imageProfileUrl;
  Users(this.firstName, this.lastName, this.birthDate, this.gender, this.email,
      this.phoneNo, this.password, this.token, this.imageProfileUrl);

  Users.inmap(dynamic obj) {
    this.id = obj['id'];
    this.email = obj['email'];
    this.password = obj['password'];
    this.token = obj['token'];
  }
  int? get _id => id;
  String? get _firstName => firstName;
  String? get _email => email;
  String? get _password => password;
  String? get _token => token;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["email"] = _email;
    map["password"] = _password;
    map["token"] = _token;
    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}
