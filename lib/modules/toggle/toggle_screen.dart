import 'package:flutter/material.dart';
import 'package:payment_integration/modules/ref_code/ref_code_screen.dart';
import 'package:payment_integration/modules/visa_card/visa_card_screen.dart';
import 'package:payment_integration/shared/components/components.dart';
import 'package:payment_integration/shared/styles/colors.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 24),
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context: context, widget: VisaCardScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: defColor,
                      )
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('assets/images/visa.jpg' ,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Pay with your visa card' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context: context, widget: const RefCodeScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: defColor,
                        )
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('assets/images/ref.jpg' ,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Get a refference code to pay.' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
