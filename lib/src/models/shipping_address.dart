import 'package:equatable/equatable.dart';

import '../helpers.dart';

class ShippingAddress extends Equatable {
  final String firstName; // required
  final String lastName; // required
  final String company;
  final String address1; // required
  final String address2;
  final String city; // required
  final String state; // required
  final String postcode;
  final String country; // required
  final String email;
  final String phone;

  ShippingAddress({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  List<Object> get props => [
        firstName,
        lastName,
        company,
        address1,
        address2,
        city,
        state,
        postcode,
        country,
        email,
        phone,
      ];

  @override
  bool get stringify => true;

  ShippingAddress copyWith({
    String firstName,
    String lastName,
    String company,
    String address1,
    String address2,
    String city,
    String state,
    String postcode,
    String country,
    String email,
    String phone,
  }) {
    return ShippingAddress(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      company: company ?? this.company,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      state: state ?? this.state,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return MapHelper.filterNulls<String, dynamic>({
      'first_name': firstName,
      'last_name': lastName,
      'company': company,
      'address_1': address1,
      'address_2': address2,
      'city': city,
      'state': state,
      'postcode': postcode,
      'country': country,
      'email': email,
      'phone': phone,
    });
  }

  factory ShippingAddress.fromMap(Map<String, dynamic> map) {
    map = MapHelper.remap<String, dynamic>(map, _fromMap);
    if (map == null) return null;

    return ShippingAddress(
      firstName: map['firstName'],
      lastName: map['lastName'],
      company: map['company'],
      address1: map['address1'],
      address2: map['address2'],
      city: map['city'],
      state: map['state'],
      postcode: map['postcode'],
      country: map['country'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}

Map<String, dynamic> _fromMap(Map<String, dynamic> map) {
  return {
    'firstName': map['first_name'],
    'lastName': map['last_name'],
    'company': map['company'],
    'address1': map['address_1'],
    'address2': map['address_2'],
    'city': map['city'],
    'state': map['state'],
    'postcode': map['postcode'],
    'country': map['country'],
    'email': map['email'],
    'phone': map['phone'],
  };
}
