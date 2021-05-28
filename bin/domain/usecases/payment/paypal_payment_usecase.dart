import 'dart:math';

import 'package:dartz/dartz.dart';


import '../../entities/payment_result.dart';
import '../../entities/purchase_order.dart';
import '../../exceptions/failure.dart';
import '../../interfaces/payment_provider.dart';

class PaypalPayment implements PaymentProvider {
  Future<Either<Failure, PaymentResult>> cashPaymentLogic(
      PurchaseOrder purchaseOrder) async {
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) {
      return right(PaymentResult(true, 'https://payal.com/aafadf-q32rfs-32f2d2-23r2'));
    } else {
      return left(Failure('Heads Up Paypal Error'));
    }
  }

  @override
  Future<Either<Failure, PaymentResult>> ProcessPayment(
      PurchaseOrder purchaseOrder) async {
    return await cashPaymentLogic(purchaseOrder);
  }
}