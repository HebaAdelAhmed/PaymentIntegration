import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/shared/constants/constants.dart';
import '../../../shared/network/dio_helper.dart';
import '../../../shared/network/end_points.dart';
import 'states.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit() : super(InitialPaymentState());

  static PaymentCubit get(context) => BlocProvider.of(context);


  Future getPaymentAuthToken({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String price,
  }) async{
    await DioHelper.postData(
      path: EndPoints.authenticationRequest,
      data: {
        'api_key': apiKey,
      },
    ).then((value) {
      paymentAuthToken = value.data['token'];
      print('First Token: #### $paymentAuthToken');
      getOrderRegistrationAPi(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        price: price,
      );
      emit(PaymentAuthSuccessfullyState());
    }).catchError((error){
      emit(PaymentAuthErrorState(error: error.toString()));
      print(error);
    });
  }

  Future getOrderRegistrationAPi({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String price,
  }) async{
    await DioHelper.postData(
      path: EndPoints.orderRegistrationAPI,
      data: {
        'auth_token': paymentAuthToken,
        'delivery_needed': 'false',
        'amount_cents': price,
        'items': [],
        'currency': 'EGP',
      },
    ).then((value) {
      orderId = value.data['id'].toString();
      print('Order ID: #### $orderId');
      getPaymentKeyRequestCard(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        price: price,
      );
      getPaymentKeyRequestKiosk(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        price: price,
      );
      emit(PaymentOrderRegisterSuccessfullyState());
    }).catchError((error){
      print(paymentAuthToken);
      emit(PaymentOrderRegisterErrorState(error: error.toString()));
      print(error);
    });
  }

  Future getPaymentKeyRequestCard({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String price,
  }) async {
    await DioHelper.postData(
      path: EndPoints.paymentKeyRequestCard,
      data: {
        'auth_token': paymentAuthToken,
        'amount_cents': price,
        'expiration': 3600,
        'order_id': orderId,
        'currency': 'EGP',
        'integration_id': integrationIdCard,
        'billing_data': {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        }
      },
    ).then((value) {
      finalTokenCard = value.data['token'].toString();
      print('Final Token Card : #### $finalTokenCard');
      emit(PaymentKeyRequestCardSuccessfullyState());
    }).catchError((error) {
      print(paymentAuthToken);
      emit(PaymentKeyRequestCardErrorState(error: error.toString()));
      print(error);
    });
  }

  Future getPaymentKeyRequestKiosk({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String price,
  }) async {
    await DioHelper.postData(
      path: EndPoints.paymentKeyRequestKiosk,
      data: {
        'auth_token': paymentAuthToken,
        'amount_cents': price,
        'expiration': 3600,
        'order_id': orderId,
        'currency': 'EGP',
        'integration_id': integrationIdKiosk,
        'billing_data': {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        }
      },
    ).then((value) {
      finalTokenKiosk = value.data['token'].toString();
      print('Final Token Kiosk : #### $finalTokenKiosk');
      getPaymentRefCodeKiosk();
      emit(PaymentKeyRequestKioskSuccessfullyState());
    }).catchError((error) {
      emit(PaymentKeyRequestKioskErrorState(error: error.toString()));
      print(error);
    });
  }

  Future getPaymentRefCodeKiosk() async {
    await DioHelper.postData(
      path: EndPoints.paymentRefCodeKiosk,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        'payment_token': finalTokenKiosk,
      },
    ).then((value) {
      refCode = value.data['id'].toString();
      print('Ref Code : #### $refCode');
      emit(PaymentRefCodeKioskSuccessfullyState());
    }).catchError((error) {
      emit(PaymentRefCodeKioskErrorState(error: error.toString()));
      print(error);
    });
  }
}
