String userTable = 'userTable';
String userFirstName = 'firstName';
String userLastName = 'lastName';
String userId = 'id';

class UserData {
  // int? id;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toMap() {
    var map = <String, Object?>{
      userFirstName: firstName,
      userLastName: lastName,
      //userId : id,
    };
    return map;
  }

  UserData(this.firstName, this.lastName); //UserData(); this.id

  UserData.fromMap(Map<dynamic, dynamic> map) {
    //id = map[userId];
    firstName = map[userLastName];
    lastName = map[userFirstName];
  }
}
