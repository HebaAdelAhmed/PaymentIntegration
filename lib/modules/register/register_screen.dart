import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/modules/toggle/toggle_screen.dart';
import 'package:payment_integration/shared/components/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountCentsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if(state is PaymentRefCodeKioskSuccessfullyState){
            navigateAndFinish(context: context, widget: const ToggleScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Payment Integration'),
              centerTitle: true,
              backgroundColor: defColor,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: defaultTextFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first name';
                                } else {
                                  return null;
                                }
                              },
                              fieldName: 'First Name',
                              prefixIcon: Icons.person,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: defaultTextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name';
                                } else {
                                  return null;
                                }
                              },
                              fieldName: 'Last Name',
                              prefixIcon: Icons.person,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                        fieldName: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          } else {
                            return null;
                          }
                        },
                        fieldName: 'Phone Number',
                        prefixIcon: Icons.phone,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controller: amountCentsController,
                        keyboardType: TextInputType.number,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your price';
                          } else {
                            return null;
                          }
                        },
                        fieldName: 'Price',
                        prefixIcon: Icons.price_change,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultButton(
                        function: () {
                          if(formKey.currentState!.validate()){
                            PaymentCubit.get(context).getPaymentAuthToken(
                                firstName: firstNameController.text.toString(),
                                lastName:  lastNameController.text.toString(),
                                email: emailController.text.toString(),
                                phoneNumber:  phoneNumberController.text.toString(),
                                price: amountCentsController.text.toString()
                            );
                          }
                        },
                        text: 'Register',
                        redius: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
