import 'package:simple_id/src/commons/core/data_status.dart';
import 'package:simple_id/src/commons/domain/entities/transaction/transaction_models.dart';

import '../data_sources/remote/transaction_service.dart';

abstract class TransactionRepository {
  Future<DataState<Transaction>> getTransaction(
      final GetTransactionRequest request);

  Future<DataState<TransactionState>> getTransactionStatus(
      final GetTransactionStatusRequest request);

  Future<DataState<TransactionState>> executeAction(
      final ExecuteActionRequest request);
}

class GetTransactionRequest {
  final String transactionId;
  final String workflowId;
  final String referenceId;

  GetTransactionRequest(this.transactionId, this.workflowId, this.referenceId);

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'workflow_id': workflowId,
      'reference_id': referenceId
    };
  }
}

class ExecuteActionRequest {
  final String transactionId;
  final String workflowId;
  final String action;
  final String page;

  ExecuteActionRequest(
    this.transactionId,
    this.workflowId,
    this.action,
    this.page,
  );

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'action': action,
      'workflowId': workflowId,
      'request_context': {'transaction_id': transactionId}
    };
  }
}

class GetTransactionStatusRequest extends ExecuteActionRequest {
  GetTransactionStatusRequest(
    transactionId,
    workflowId,
  ) : super(transactionId, workflowId, 'GET_STATUS', 'INITIATED');
}

class TransactionRepositoryImpl implements TransactionRepository {

  final TransactionService _transactionService;

  TransactionRepositoryImpl(this._transactionService);

  @override
  Future<DataState<Transaction>> getTransaction(
      final GetTransactionRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<TransactionState>> getTransactionStatus(
      final GetTransactionStatusRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<TransactionState>> executeAction(
      final ExecuteActionRequest request) {
    // TODO: implement executeAction
    throw UnimplementedError();
  }
}
