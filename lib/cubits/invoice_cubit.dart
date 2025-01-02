import 'package:flutter_bloc/flutter_bloc.dart';

import 'invoice_state.dart';
import '../models/invoice_models.dart';
import '../repositories/invoice_repository.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepository _repository;

  InvoiceCubit({required InvoiceRepository repository})
      : _repository = repository,
        super(InvoiceLoadingState());

  void fetchInvoices(String token, int pageNo) async {
    emit(InvoiceLoadingState());
    try {
      final invoices = await _repository.getAllInvoices(token);
      emit(InvoiceLoadedState(invoices: invoices, pageNo: pageNo));
    } catch (e) {
      print(e);
      emit(InvoiceErrorState(error: 'Failed to load invoices: $e'));
    }
  }

  void createInvoice(String token, Invoice invoice) async {
    try {
      final createdInvoice = await _repository.createInvoice(token, invoice);
      emit(InvoiceCreatedState(invoice: createdInvoice));
    } catch (e) {
      emit(InvoiceErrorState(error: 'Failed to create invoice: $e'));
    }
  }

  void fetchParties(String token, int pageNo) async {
    emit(PartyLoadingState());
    try {
      final parties = await _repository.getAllParties(token, pageNo);
      emit(PartyLoadedState(
        parties: parties,
        pageNo: pageNo,
      ));
    } catch (e) {
      print(e);
      emit(PartyErrorState(error: 'Failed to load parties: $e'));
    }
  }

  void createParty(String token, Party party) async {
    emit(PartyCreatingState());
    try {
      final createdParty = await _repository.createParty(token, party);
      emit(PartyCreatedState(party: createdParty));
    } catch (e) {
      print(e);
      emit(PartyErrorState(error: 'Failed to create party: $e'));
    }
  }

  void deletePartyById(String token, String partyId) async {
    emit(PartyLoadingState());
    try {
      await _repository.deleteParty(token, partyId);
      emit(PartyDeletedState(partyId: partyId));
    } catch (e) {
      emit(PartyErrorState(error: 'Failed to load items: $e'));
    }
  }

  void fetchItems(String token, int pageNo) async {
    emit(ItemLoadingState());
    try {
      final items = await _repository.getAllItems(token, pageNo);
      emit(ItemLoadedState(items: items, pageNo: pageNo));
    } catch (e) {
      print(e);
      emit(ItemErrorState(error: 'Failed to load items: $e'));
    }
  }

  void createItem(String token, Item item) async {
    emit(ItemLoadingState());
    try {
      final createdItem = await _repository.createItem(token, item);
      fetchItems( token,1);
      emit(ItemCreatedState(item: createdItem));
    } catch (e) {
      print(e);
      emit(ItemErrorState(error: 'Failed to create item: $e'));
    }
  }

  void updateItem(String token, String id, Item item) async {
    emit(ItemLoadingState());
    try {
      final updatedItem = await _repository.updateItem(token, id, item);
      emit(ItemUpdatedState(item: updatedItem));
    } catch (e) {
      print(e);
      emit(ItemErrorState(error: 'Failed to update item: $e'));
    }
  }

  void fetchItemById(String token, String itemId) async {
    emit(ItemLoadingState());
    try {
      final item = await _repository.getItemById(token, itemId);
      emit(SingleItemLoadedState(item: item));
    } catch (e) {
      emit(ItemErrorState(error: 'Failed to load items: $e'));
    }
  }

  void deleteItemById(String token, String itemId) async {
    emit(ItemLoadingState());
    try {
      await _repository.deleteItem(token, itemId);
      emit(ItemDeletedState(itemId: itemId));
    } catch (e) {
      emit(ItemErrorState(error: 'Failed to load items: $e'));
    }
  }
}
