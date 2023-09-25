import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payment_integration/shared/constants/constants.dart';
import 'package:payment_integration/shared/styles/colors.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You should go to any market to pay' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600,),),
              const SizedBox(
                height: 40,
              ),
              Card(
                elevation: 12.0,
                shape: Border.all(
                  color: defColor,
                  width: 1
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 24.0),
                  child: Column(
                    children: [
                      const Text('This is a reference code:' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600,),),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('$refCode', style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w500,),),
                    ],
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
