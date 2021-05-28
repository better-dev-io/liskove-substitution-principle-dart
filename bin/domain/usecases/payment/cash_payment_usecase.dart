import 'dart:math';

import 'package:dartz/dartz.dart';



import '../../entities/payment_result.dart';
import '../../entities/purchase_order.dart';
import '../../exceptions/failure.dart';
import '../../interfaces/payment_provider.dart';

class CashPayment implements PaymentProvider {
  // _cashPaymentLogic private logic for the payment by cash
  Future<Either<Failure, PaymentResult>> _cashPaymentLogic(
      PurchaseOrder purchaseOrder) async {
    // a real logic will take sometime so lets mimic that
    await Future.delayed(Duration(seconds: 1));

    // the logic might produce an error or success
    // this code will randomly do that
    if (Random().nextBool()) {
      // returning success result
      return right(PaymentResult(false, ''));
    }

    // returning payment failure
    return left(Failure('Sorry something went wrong during cash payment'));
  }

  @override
  Future<Either<Failure, PaymentResult>> ProcessPayment(
      PurchaseOrder purchaseOrder) async {
    return await _cashPaymentLogic(purchaseOrder);
  }
}
