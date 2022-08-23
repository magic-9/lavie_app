class User{
  String? type;
  String? message;
  UserData? data;

  User.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data =  UserData.fromJson(json['data']['user']);
  }
}

class UserData{
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  // String? address;
  String? role;


  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    // address = json['address'] == null ? "" : json['address'];
    role = json['role'];
  }
}

class UserError {
  int? statusCode;
  String? message;
  String? error;

  UserError.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] == null ? 400 : json['statusCode'];
    message = json['message'].toString();
    error = json['error'];
  }

}