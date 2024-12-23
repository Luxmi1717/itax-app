import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/invoice_models.dart'; // Import your Flutter models

class InvoiceRepository {
  final String baseUrl = 'https://api.itaxeasy.com/invoice';
  // final String baseUrl = 'http://10.0.2.2:8080/invoice';

  Future<List<Invoice>> getAllInvoices(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/invoices'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['invoices'];
      print(data);
      return data.map((json) => Invoice.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load invoices');
    }
  }

  Future<Invoice> getInvoiceById(String token, String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/invoices/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Invoice.fromJson(data);
    } else {
      throw Exception('Failed to load invoice');
    }
  }

  Future<Invoice> createInvoice(String token, Invoice invoice) async {
    final response = await http.post(
      Uri.parse('$baseUrl/invoices'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(invoice.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Invoice.fromJson(data);
    } else {
      throw Exception('Failed to create invoice');
    }
  }

  Future<Invoice> updateInvoice(
      String token, String id, Invoice invoice) async {
    final response = await http.put(
      Uri.parse('$baseUrl/invoices/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(invoice.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Invoice.fromJson(data);
    } else {
      throw Exception('Failed to update invoice');
    }
  }

  Future<void> deleteInvoice(String token, String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/invoices/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete invoice');
    }
  }

  Future<List<Party>> searchParty(
      String searchTerm, String token, int pageNo) async {
    final response = await http.get(
      Uri.parse('$baseUrl/parties?search=$searchTerm&pageNo=$pageNo'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['parties'];

      return data.map((json) => Party.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<List<Party>> getAllParties(String token, int pageNo) async {
    final response = await http.get(
      Uri.parse('$baseUrl/parties?pageNo=$pageNo'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['parties'];
      print(data);
      return data.map((json) => Party.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<Party> getPartyById(String token, String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/parties/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Party.fromJson(data);
    } else {
      throw Exception('Failed to load party');
    }
  }

  Future<Party> createParty(String token, Party party) async {
    final response = await http.post(
      Uri.parse('$baseUrl/parties'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(party.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      return Party.fromJson(data);
    } else {
      throw Exception('Failed to create party');
    }
  }

  Future<void> deleteParty(String token, String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/parties/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete party');
    }
  }

  Future<List<Item>> searchItem(
      String searchTerm, String token, int pageNo) async {
    final response = await http.get(
      Uri.parse('$baseUrl/items?search=$searchTerm&pageNo=$pageNo'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];

      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<Item>> getAllItems(String token, int pageNo) async {
    final response = await http.get(
      Uri.parse('$baseUrl/items?page=$pageNo'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Item> getItemById(String token, String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Item.fromJson(data['item']);
    } else {
      throw Exception('Failed to load item');
    }
  }

  Future<Item> createItem(String token, Item item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(item.toJson()),
    );

    if (response.statusCode == 201) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body)['item'];
      return Item.fromJson(data);
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<Item> updateItem(String token, String id, Item item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/items/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(item.toJson()),
    );

    if (response.statusCode == 200) {
      print("response.body");
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body)['item'];
      return Item.fromJson(data);
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(String token, String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}
