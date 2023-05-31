import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'Order.dart';

class Services{
  static const ROOT = 'http://172.20.10.5/localhost/IronApk/iron_actions.php';
  static const GET_ALL_ACTION = 'GET_ALL';
  static const ADD_ORDER_ACTION = 'ADD_ORDER';

  static Future<List<Order>> getOrders() async{
    try{
      var map = Map<String, dynamic>(); 
      map['action'] = GET_ALL_ACTION;
      final response = await http.post(ROOT as Uri, body: map);
      print('Get order response: ${response.body}');
      if(200 == response.statusCode){
        List<Order> list = parseResponse(response.body);
        return list;
      }

      return <Order>[];

    }catch(e){
      return <Order>[];
    }
  }

  static List<Order> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  }

  static Future<String> addOrder(String number, int shirt, int short, int skirt, int blazer, int trouse, Float cost, String date, String address) async{
    try{
      var map = Map<String, dynamic>(); 
      map['action'] = ADD_ORDER_ACTION;
      map['var_shirt'] = shirt;
      map['var_number'] = number;
      map['var_short'] = short;
      map['var_blazer'] = blazer;
      map['var_skirt'] = skirt;
      map['var_trouse'] = trouse;
      map['var_address'] = address;
      map['var_cost'] = cost;
      map['var_date'] = date;
      final response = await http.post(ROOT as Uri, body: map);
      print('Add order response: ${response.body}');
      if(200 == response.statusCode){
        List<Order> list = parseResponse(response.body);
        return response.body;
      }else{
        return "Error";
      }

    }catch(e){
      return "Error";
    }
  }

}
