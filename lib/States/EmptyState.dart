import 'package:contactsapp/utils/AppAnimations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAnimations.emptyList,
              height: MediaQuery.of(context).size.height*0.3,
            ),


            Text("There is No Contacts Added Here",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white
            ),),

          ],

        ),
      ),
    );
  }
}
