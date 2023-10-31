class TransactionModel {
  final String id;

  TransactionModel({
    required this.id,
  });
}

class TransactionTheme {
  final String name;

  TransactionTheme({
    required this.name,
  });
}

enum TransactionType {
  credit,
  debit,
}

class SdkType {
  final String name;

  SdkType({
    required this.name,
  });
}