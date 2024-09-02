// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final String adress;

  const User({
    required this.name,
    required this.adress,
  });

  User copyWith({
    String? name,
    String? adress,
  }) {
    return User(
      name: name ?? this.name,
      adress: adress ?? this.adress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'adress': adress,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      adress: map['adress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, adress: $adress)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.adress == adress;
  }

  @override
  int get hashCode => name.hashCode ^ adress.hashCode;
}
