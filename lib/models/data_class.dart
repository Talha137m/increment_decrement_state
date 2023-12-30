// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataClass {
  int rollNo;
  double fee;
  String name;
  int value = 0;
  DataClass({
    required this.rollNo,
    required this.fee,
    required this.name,
  });

  DataClass copyWith({
    int? rollNo,
    double? fee,
    String? name,
  }) {
    return DataClass(
      rollNo: rollNo ?? this.rollNo,
      fee: fee ?? this.fee,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'fee': fee,
      'name': name,
    };
  }

  factory DataClass.fromMap(Map<String, dynamic> map) {
    return DataClass(
      rollNo: map['rollNo'] as int,
      fee: map['fee'] as double,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataClass.fromJson(String source) =>
      DataClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataClass(rollNo: $rollNo, fee: $fee, name: $name)';

  @override
  bool operator ==(covariant DataClass other) {
    if (identical(this, other)) return true;

    return other.rollNo == rollNo && other.fee == fee && other.name == name;
  }

  @override
  int get hashCode => rollNo.hashCode ^ fee.hashCode ^ name.hashCode;
}
