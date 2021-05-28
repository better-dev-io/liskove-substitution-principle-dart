import 'package:dartz/dartz.dart';

import '../../domain/data/repositories/payment_repository.dart';
import '../../domain/entities/payment_result.dart';
import '../../domain/entities/purchase_order.dart';
import '../../domain/exceptions/failure.dart';

class PaymentService {

  //#region singleton
  static PaymentService _instance;

  PaymentService._getInstance() {
    _instance = this;
  }

  factory PaymentService() {
    if (_instance == null) {
      PaymentService._getInstance();
    }

    return _instance;
  }

  //#endregion

  Future<Either<Failure, PaymentResult>> attemptProcessingPayment(
      PurchaseOrder purchaseOrder) async {
    final paymentRepo = PaymentRepository();

    // gets the payment from the PaymentRepository
    final paymentProviderResult = await paymentRepo.paymentProviderByID(
      purchaseOrder.paymentType,
    );

    // handling the result from repository
    // left  -> payment provider not found
    // right -> we got the payment provider
    return paymentProviderResult.fold(
      (paymentProviderFailure) => left(paymentProviderFailure),
      (paymentProvider) async {
        // process the payment through the payment provider
        final processingPaymentResult = await paymentProvider.ProcessPayment(
          purchaseOrder,
        );
        //  handling the result from ProcessPayment
        // left  -> process payment error
        // right -> payment done successfully
        return processingPaymentResult.fold(
          (paymentFailure) => left(paymentFailure),
          (paymentResult) => right(paymentResult),
        );
      },
    );
  }
}