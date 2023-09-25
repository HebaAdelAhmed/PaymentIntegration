abstract class PaymentStates {}

class InitialPaymentState extends PaymentStates {}

class PaymentAuthLoadingState extends PaymentStates {}

class PaymentAuthSuccessfullyState extends PaymentStates {}

class PaymentAuthErrorState extends PaymentStates {
  final String error;

  PaymentAuthErrorState({required this.error});
}

class PaymentOrderRegisterLoadingState extends PaymentStates {}

class PaymentOrderRegisterSuccessfullyState extends PaymentStates {}

class PaymentOrderRegisterErrorState extends PaymentStates {
  final String error;

  PaymentOrderRegisterErrorState({required this.error});
}

class PaymentKeyRequestCardLoadingState extends PaymentStates {}

class PaymentKeyRequestCardSuccessfullyState extends PaymentStates {}

class PaymentKeyRequestCardErrorState extends PaymentStates {
  final String error;

  PaymentKeyRequestCardErrorState({required this.error});
}

class PaymentKeyRequestKioskLoadingState extends PaymentStates {}

class PaymentKeyRequestKioskSuccessfullyState extends PaymentStates {}

class PaymentKeyRequestKioskErrorState extends PaymentStates {
  final String error;

  PaymentKeyRequestKioskErrorState({required this.error});
}

class PaymentRefCodeKioskLoadingState extends PaymentStates {}

class PaymentRefCodeKioskSuccessfullyState extends PaymentStates {}

class PaymentRefCodeKioskErrorState extends PaymentStates {
  final String error;

  PaymentRefCodeKioskErrorState({required this.error});
}
