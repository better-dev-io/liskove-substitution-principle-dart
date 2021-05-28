import 'package:dartz/dartz.dart';

import '../../exceptions/failure.dart';
import '../../interfaces/payment_provider.dart';
import '../../usecases/payment/cash_payment_usecase.dart';
import '../../usecases/payment/paypal_payment_usecase.dart';

class PaymentRepository {
  // internal variable to hold the singleton instance
  static PaymentRepository _instance;

  // an internal constructor to set the instance
  PaymentRepository._getInstance() {
    _instance = this;
  }

  // public constructor to get access to this class
  factory PaymentRepository() {
    // set the instance if its null
    if(_instance == null) {
       PaymentRepository._getInstance();
    }

    return _instance;
  }

  final Map _paymentTypeList = {
    1: PaypalPayment(),
    2: CashPayment(),
  };

  // provides PaymentGateway given the ID of the e-payment
  // throws an Exception if payment provider dose not exist
  Future<Either<Failure, PaymentProvider>> paymentProviderByID(
      int paymentTypeID) async {
    // finding the the first entry that matches the ID of payment type
    // else set the result to null
    final result = _paymentTypeList.entries.firstWhere(
      (paymentType) => paymentType.key == paymentTypeID,
      orElse: () => null,
    );

    // returning the result if payment type was found
    // else returning a Failure
    return result != null
        ? right(result.value)
        : left(
            Failure.withDetails(
              'Payment Type Dose Not Exist',
              [
                'Details example',
                'Details example 2',
              ],
            ),
          );
  }
}
