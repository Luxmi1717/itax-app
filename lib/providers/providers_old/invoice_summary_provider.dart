import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum InvoiceSummaryProviderState { pending, loaded, failed }

class InvoiceSummaryProvider with ChangeNotifier {
  // final String baseUrl = "http://10.0.2.2:8080/invoice";
  final String baseUrl = 'https://api.itaxeasy.com/invoice';
  final String summaryEndpoint = "/summary";

  double totalSales = 0.0;
  double totalPurchases = 0.0;
  int numberOfParties = 0;
  int numberOfItems = 0;
  InvoiceSummaryProviderState state =
      InvoiceSummaryProviderState.pending; // Initial state

  InvoiceSummaryProvider();

  // Function to update the state
  void _updateState(InvoiceSummaryProviderState newState) {
    state = newState;
    notifyListeners();
  }

  // Function to fetch data from the API
  Future<void> fetchData(String token) async {
    try {
      _updateState(InvoiceSummaryProviderState.pending); // Set state to pending

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse('$baseUrl$summaryEndpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final summary = data['summary'];

        totalSales = summary['total_sales'].toDouble();
        totalPurchases = summary['total_purchases'].toDouble();
        numberOfParties = summary['number_of_parties'];
        numberOfItems = summary['number_of_items'];

        _updateState(InvoiceSummaryProviderState.loaded); // Set state to loaded
      } else {
        // Handle errors here
        print('Failed to load data: ${response.statusCode}');
        _updateState(InvoiceSummaryProviderState.failed); // Set state to failed
      }
    } catch (e) {
      // Handle network or other exceptions
      print('Error: $e');
      _updateState(InvoiceSummaryProviderState.failed); // Set state to failed
    }
  }
}
