
class CurrentUser {

  late final String type;
  late final String message;
  late final CurrentUserData data;

  CurrentUser.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = CurrentUserData.fromJson(json['data']);
  }

}

class CurrentUserData {

  late final String userId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String imageUrl;
  late final String role;
  late final List<UserNotification> userNotification;

  CurrentUserData.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    role = json['role'];
    userNotification = List.from(json['UserNotification']).map((e)=>UserNotification.fromJson(e)).toList();
  }

}

class UserNotification {

  late final String notificationId;
  late final String userId;
  late final String imageUrl;
  late final String message;
  late final String createdAt;

  UserNotification.fromJson(Map<String, dynamic> json){
    notificationId = json['notificationId'];
    userId = json['userId'];
    imageUrl = json['imageUrl'] == null ? "" : json['imageUrl'];
    message = json['message'];
    createdAt = json['createdAt'];
  }


}
