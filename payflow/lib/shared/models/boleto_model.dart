import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueData;
  final double? value;
  final String? barcode;

  BoletoModel({
    this.name,
    this.dueData,
    this.value,
    this.barcode,
  });

  BoletoModel copyWith({
    String? name,
    String? dueData,
    double? value,
    String? barcode,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueData: dueData ?? this.dueData,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueData': dueData,
      'value': value,
      'barcode': barcode,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueData: map['dueData'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueData: $dueData, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.dueData == dueData &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueData.hashCode ^ value.hashCode ^ barcode.hashCode;
  }
}
