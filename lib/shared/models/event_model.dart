import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';
import 'friend_model.dart';
import 'item_model.dart';

class EventModel extends BaseModel {
  final String id;
  final String name;
  final DateTime? created;
  final double value;
  final double paid;
  final List<ItemModel> items;
  final List<FriendModel> friends;

  int get people => friends.length;
  double get valueSplit =>
      double.parse((calcValue / friends.length).toStringAsFixed(2));
  double get calcValue => items.isNotEmpty
      ? items
          .reduce((value, element) =>
              value = value.copyWith(value: value.value + element.value))
          .value
      : 0.0;
  double get remainingValue => value - paid;

  EventModel({
    this.id = '',
    this.name = '',
    this.created,
    this.value = 0.0,
    this.paid = 0.0,
    this.items = const [],
    this.friends = const [],
  }) : super(collection: "/events");

  EventModel copyWith({
    String? id,
    String? name,
    DateTime? created,
    double? value,
    double? paid,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      value: value == 0.0 ? calcValue : this.value,
      items: items ?? this.items,
      friends: friends ?? this.friends,
      paid: paid ?? this.paid,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created': FieldValue.serverTimestamp(),
      'value': calcValue,
      'paid': paid,
      'items': items.map((x) => x.toMap()).toList(),
      'friends': friends.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      created: (map['created'] as Timestamp).toDate(),
      value: double.tryParse(map['value'].toString()) ?? 0.0,
      paid: double.tryParse(map['paid'].toString()) ?? 0.0,
      items:
          List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x))),
      friends: List<FriendModel>.from(
          map['friends']?.map((x) => FriendModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(name: $name, created: $created, value: $value, items: $items, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.name == name &&
        other.created == created &&
        other.value == value &&
        listEquals(other.items, items) &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        created.hashCode ^
        value.hashCode ^
        items.hashCode ^
        friends.hashCode;
  }
}
