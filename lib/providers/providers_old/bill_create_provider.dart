
import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:itax/providers/services-old/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';


class BillCreateNotifier extends ChangeNotifier {
  List<Contact> contactsList = [];
  String selectedContactNumber = ''; // Track the selected contact's number

  Future<void> fetchContacts() async {
    final status = await Permission.contacts.request();
    if (status.isGranted) {
      final contacts = await FlutterContacts.getContacts();

      contactsList = contacts;

      notifyListeners();
    } else {
      if (status.isDenied) {
        Utils.toastMessage("Please allow contact access.");
      }
    }
  }

  void searchContacts({required String query}) {
    if (query.isNotEmpty) {
      contactsList = contactsList.where((contact) {
        final lowerCaseQuery = query.toLowerCase();

        // Assuming phone numbers are stored as a list of strings
        final phoneNumbers = contact.phones.map((phone) => phone.toString().toLowerCase());

        return contact.displayName.toLowerCase().contains(lowerCaseQuery) ||
            phoneNumbers.any((phoneNumber) => phoneNumber.contains(lowerCaseQuery));
      }).toList();
      notifyListeners();
    } else {
      fetchContacts();
    }
  }

  // Method to select a contact number
  void selectContactNumber(String number) {
    selectedContactNumber = number;
    notifyListeners();
  }
}