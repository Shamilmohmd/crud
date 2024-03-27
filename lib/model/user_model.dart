class UsersModel{
  String? name;
  String? password;
  String? email;
  String? id;
  UsersModel({
    this.email,
    this.password,
    this.name,
    this.id
});

  Map<String,dynamic> toMap(){
    return{
      'name': this.name,
      'password': this.password,
      'email': this.email,
      'id': this.id,
    };
  }

 factory UsersModel.fromMap(Map<String,dynamic>map){
    return UsersModel(
    email: map['email'] ?? "",
    password: map['password'] ?? "",
    name: map['name'] ?? "",
    id: map['id'] ?? "",
    );
  }

  UsersModel copyWith({
    String? email,
    String? password,
    String? name,
    String? id
}){
    return UsersModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ??this.name,
      id: id ??this.id,
    );
  }



}