import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel {
  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  final Address address;
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final String phone;

  /// A necessary factory constructor for creating a new UserModel instance
  /// from a map. Pass the map to the generated `_$UserModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, UserModel.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserModelToJson`.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Address {
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  /// A necessary factory constructor for creating a new Address instance
  /// from a map. Pass the map to the generated `_$AddressFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Address.
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AddressToJson`.
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });

  final String lat;
  final String long;

  /// A necessary factory constructor for creating a new Geolocation instance
  /// from a map. Pass the map to the generated `_$GeolocationFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Geolocation.
  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$GeolocationToJson`.
  Map<String, dynamic> toJson() => _$GeolocationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Name {
  Name({
    required this.firstname,
    required this.lastname,
  });

  final String firstname;
  final String lastname;

  /// A necessary factory constructor for creating a new Name instance
  /// from a map. Pass the map to the generated `_$NameFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Name.
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NameToJson`.
  Map<String, dynamic> toJson() => _$NameToJson(this);
}
