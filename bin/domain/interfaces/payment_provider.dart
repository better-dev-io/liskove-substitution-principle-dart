import 'package:dartz/dartz.dart';


import '../entities/payment_result.dart';
import '../entities/purchase_order.dart';
import '../exceptions/failure.dart';

abstract class PaymentProvider {
  Future<Either<Failure, PaymentResult>> ProcessPayment(
      PurchaseOrder purchaseOrder);
}
