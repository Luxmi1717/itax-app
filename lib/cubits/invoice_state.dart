import '../models/invoice_models.dart';

abstract class InvoiceState {}

class InvoiceLoadingState extends InvoiceState {}

class InvoiceLoadedState extends InvoiceState {
  final List<Invoice> invoices;
  final int pageNo;

  InvoiceLoadedState({required this.invoices, required this.pageNo});
}

class InvoiceCreatedState extends InvoiceState {
  final Invoice invoice;

  InvoiceCreatedState({required this.invoice});
}

class InvoiceErrorState extends InvoiceState {
  final String error;

  InvoiceErrorState({required this.error});
}

class PartyLoadingState extends InvoiceState {}

class PartyLoadedState extends InvoiceState {
  final List<Party> parties;
  final int pageNo;

  PartyLoadedState({
    required this.parties,
    required this.pageNo,
  });
}

class PartyCreatingState extends InvoiceState {}

class PartyCreatedState extends InvoiceState {
  final Party party;

  PartyCreatedState({required this.party});
}

class PartyDeletedState extends InvoiceState {
  final String partyId;

  PartyDeletedState({required this.partyId});
}

class PartyErrorState extends InvoiceState {
  final String error;

  PartyErrorState({required this.error});
}

class ItemLoadingState extends InvoiceState {}

class ItemCreatedState extends InvoiceState {
  final Item item;

  ItemCreatedState({required this.item});
}

class ItemUpdatedState extends InvoiceState {
  final Item item;

  ItemUpdatedState({required this.item});
}

class ItemDeletedState extends InvoiceState {
  final String itemId;

  ItemDeletedState({required this.itemId});
}

class ItemLoadedState extends InvoiceState {
  final List<Item> items;
  final int pageNo;

  ItemLoadedState({required this.items, required this.pageNo});
}

class SingleItemLoadedState extends InvoiceState {
  final Item item;

  SingleItemLoadedState({required this.item});
}

class ItemErrorState extends InvoiceState {
  final String error;

  ItemErrorState({required this.error});
}
