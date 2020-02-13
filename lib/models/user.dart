class User {
  int _id;
  String _firstname;
  String _lastname;
  String _email;
  String _phonenumber;
  String _password;
  User.withId(
    this._id,
    this._password,
    this._email,
    this._firstname,
    this._lastname,
  );
  User(this._email, this._password,
      [this._firstname, this._lastname, this._phonenumber, this._id]);
  //getters
  int get id => _id;

  String get firstname => _firstname;

  set firstname(String value) {
    _firstname = value;
  }

  String get email => _email;
  String get password => _password;

  String get phonenumber => _phonenumber;

  set phonenumber(String value) {
    _phonenumber = value;
  } //setter

  set email(String newEmail) {
    if (newEmail.length <= 255) {
      this._email = newEmail;
    }
  }

  set password(String newPassword) {
    if (newPassword.length <= 255) {
      this._password = newPassword;
    }
  }

  set date(String newDate) {
    this.date = newDate;
  }

  //Convert a user object to a map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    if (firstname != null) {
      map['firstname'] = _firstname;
    }
    if (lastname != null) {
      map['lastname'] = _lastname;
    }
    if (phonenumber != null) {
      map['phonenumber'] = _phonenumber;
    }
    map['email'] = _email;
    map['password'] = _password;

    return map;
  }

  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._password = map['password'];
    this._email = map['email'];
    this._firstname = map['firstname'];
    this._phonenumber = map['phonenumber'];
    this._lastname = map['flastname'];
  }

  User.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _firstname = json['firstname'],
        _lastname = json['lastname'],
        _phonenumber = json['phonenumber'],
        _email = json['email'],
        _password = json['password'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        '_firstname': firstname,
        '_lastname': lastname,
        '_phonenumber': phonenumber,
        '_email': email,
        '_password': password,
      };

  String get lastname => _lastname;

  set lastname(String value) {
    _lastname = value;
  }
}
