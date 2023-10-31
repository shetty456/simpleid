import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/transaction_service.dart';
import '../data/repository/transaction_repository.dart';

class DependencyProvider {
  static final DependencyProvider _singleton = DependencyProvider._internal();

  factory DependencyProvider() {
    return _singleton;
  }

  DependencyProvider._internal();

  final GetIt di = GetIt.asNewInstance();

  void init() {
    di.registerSingleton(TransactionService());
    di.registerSingleton(TransactionRepositoryImpl(di()));
  }

  static T get<T extends Object>() {
    return _singleton.di.get<T>();
  }
}
