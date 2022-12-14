class Forums {
  late final String type;
  late final String message;
  late final List<ForumsData> data;

  Forums.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>ForumsData.fromJson(e)).toList();
  }

}

class ForumsData {

  late final String forumId;
  late final String title;
  late final String description;
  late final String? imageUrl;
  late final String userId;
  late final List<ForumLikes> forumLikes;
  late final List<ForumComments> forumComments;
  late final UserForums userForums;

  ForumsData.fromJson(Map<String, dynamic> json){
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if(json['ForumLikes'] != ""){
      forumLikes = List.from(json['ForumLikes']).map((e)=>ForumLikes.fromJson(e)).toList();
    }
    if(json['ForumComments'] != ""){
      forumComments = List.from(json['ForumComments']).map((e)=>ForumComments.fromJson(e)).toList();
    }
    
    userForums = UserForums.fromJson(json['user']);

  }
}

class ForumLikes {

  late final String forumId;
  late final String userId;

  ForumLikes.fromJson(Map<String, dynamic> json){
    forumId = json['forumId'];
    userId = json['userId'];
  }

}

class ForumComments {
  late final String forumCommentId;
  late final String forumId;
  late final String userId;
  late final String comment;

  ForumComments.fromJson(Map<String, dynamic> json){
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
  }

}

class UserForums {

  late final String firstName;
  late final String lastName;
  late final String imageUrl;

  UserForums.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }


}