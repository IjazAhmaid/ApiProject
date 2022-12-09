// ignore_for_file: unnecessary_getters_setters

class UsersModels {
  int? _id;
  String? _name;
  String? _username;
  String? _email;
  Address? _address;
  String? _phone;
  String? _website;
  Company? _company;

  UsersModels(
      {int? id,
      String? name,
      String? username,
      String? email,
      Address? address,
      String? phone,
      String? website,
      Company? company}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (username != null) {
      _username = username;
    }
    if (email != null) {
      _email = email;
    }
    if (address != null) {
      _address = address;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (website != null) {
      _website = website;
    }
    if (company != null) {
      _company = company;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  Address? get address => _address;
  set address(Address? address) => _address = address;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get website => _website;
  set website(String? website) => _website = website;
  Company? get company => _company;
  set company(Company? company) => _company = company;

  UsersModels.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['username'] = _username;
    data['email'] = _email;
    if (_address != null) {
      data['address'] = _address!.toJson();
    }
    data['phone'] = _phone;
    data['website'] = _website;
    if (_company != null) {
      data['company'] = _company!.toJson();
    }
    return data;
  }
}

class Address {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  Address(
      {String? street,
      String? suite,
      String? city,
      String? zipcode,
      Geo? geo}) {
    if (street != null) {
      _street = street;
    }
    if (suite != null) {
      _suite = suite;
    }
    if (city != null) {
      _city = city;
    }
    if (zipcode != null) {
      _zipcode = zipcode;
    }
    if (geo != null) {
      _geo = geo;
    }
  }

  String? get street => _street;
  set street(String? street) => _street = street;
  String? get suite => _suite;
  set suite(String? suite) => _suite = suite;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get zipcode => _zipcode;
  set zipcode(String? zipcode) => _zipcode = zipcode;
  Geo? get geo => _geo;
  set geo(Geo? geo) => _geo = geo;

  Address.fromJson(Map<String, dynamic> json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = _street;
    data['suite'] = _suite;
    data['city'] = _city;
    data['zipcode'] = _zipcode;
    if (_geo != null) {
      data['geo'] = _geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? _lat;
  String? _lng;

  Geo({String? lat, String? lng}) {
    if (lat != null) {
      _lat = lat;
    }
    if (lng != null) {
      _lng = lng;
    }
  }

  String? get lat => _lat;
  set lat(String? lat) => _lat = lat;
  String? get lng => _lng;
  set lng(String? lng) => _lng = lng;

  Geo.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = _lat;
    data['lng'] = _lng;
    return data;
  }
}

class Company {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  Company({String? name, String? catchPhrase, String? bs}) {
    if (name != null) {
      _name = name;
    }
    if (catchPhrase != null) {
      _catchPhrase = catchPhrase;
    }
    if (bs != null) {
      _bs = bs;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get catchPhrase => _catchPhrase;
  set catchPhrase(String? catchPhrase) => _catchPhrase = catchPhrase;
  String? get bs => _bs;
  set bs(String? bs) => _bs = bs;

  Company.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['catchPhrase'] = _catchPhrase;
    data['bs'] = _bs;
    return data;
  }
}
