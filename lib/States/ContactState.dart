import 'package:contactsapp/Data/contactData.dart';
import 'package:contactsapp/Widgets/ContactCard.dart';
import 'package:contactsapp/utils/AppColors.dart';
import 'package:flutter/material.dart';

class ContactState extends StatelessWidget {
  final List<Contact> contacts;
   ContactState({super.key,required this.contacts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 27,left: 16,right: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.61,

      ),

         itemBuilder:(context, index)=>ContactCard(contact:contacts[index]),
    itemCount:contacts.length ,
    );
  }
}
