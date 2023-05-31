import 'dart:ffi';

class Order{
  late String number;
  late int short;
  late int skirt;
  late int blazer;
  late int trouse;
  late int shirt;
  late String address;
  late Float totalCost;
  late String date;

  Order({required this.number, required this.skirt, required this.short, required this.address, required this.blazer, required this.date, required this.shirt, required this.totalCost, required this.trouse});

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      number: json['id'] as String,
      shirt: json['shirt'] as int,
      short: json['short'] as int,
      blazer: json['blazer'] as int,
      trouse: json['trouse'] as int,
      skirt: json['skirt'] as int,
      address: json['address'] as String,
      totalCost: json['total_cost'] as Float,
      date: json['date'] as String
    );
  }
}