import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_id/src/commons/core/base_service.dart';
import 'package:simple_id/src/commons/data/models/transaction_models.dart';
import 'package:simple_id/src/commons/data/repository/transaction_repository.dart';

class TransactionService extends BaseService {
  TransactionService() : super(GetIt.I.get<Dio>());

  Future<TransactionModel> getTransaction(final GetTransactionRequest request) async {
    var req = jsonEncode(request.toJson());
    var res = await doPost(url: transactionUrl, reqBody: req);
    return Future(() => TransactionModel(id: ''));
  }

  Future<TransactionModel> getTransactionStatus(final GetTransactionStatusRequest request) async {
    var req = jsonEncode(request.toJson());
    var res = await doPost(url: transactionStatusUrl, reqBody: req);
    return Future(() => TransactionModel(id: ''));
  }

  Future<TransactionModel> executeAction(final ExecuteActionRequest request) async {
    var req = jsonEncode(request.toJson());
    var res = await doPost(url: executeActionUrl, reqBody: req);
    return Future(() => TransactionModel(id: ''));
  }
}
