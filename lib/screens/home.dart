import 'dart:convert';

import 'package:contactsapp/Data/contactData.dart';
import 'package:contactsapp/States/ContactState.dart';
import 'package:contactsapp/States/EmptyState.dart';
import 'package:contactsapp/Widgets/AddContactSheet.dart';
import 'package:contactsapp/utils/AppColors.dart';
import 'package:contactsapp/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadContacts();
  }
  Future<void> _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
    contacts.map((c) => jsonEncode(c.toMap())).toList();
    await prefs.setStringList('contacts', jsonList);
  }

  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList('contacts');
    if (jsonList != null) {
      setState(() {
        contacts = jsonList
            .map((str) => Contact.fromMap(jsonDecode(str)))
            .toList();
      });
    }
  }


  List<Contact>contacts=[];
  void deleteContact(Contact contact){
    setState(() {
      contacts.remove(contact);
    });

    _saveContacts();
  }


  @override
  Widget build(BuildContext context) {

    Widget _logo() => Image.asset(
      AppImages.routeLogo,
      height: 50,
    );
    return Scaffold(
backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(-0.5, 0),
                child: _logo(),
              ),
              Transform.translate(
                offset: const Offset(0.5, 0),
                child: _logo(),
              ),
              Transform.translate(
                offset: const Offset(0, -0.5),
                child: _logo(),
              ),
              Transform.translate(
                offset: const Offset(0, 0.5),
                child: _logo(),
              ),
              _logo(),
            ],
          ),
        ),
      ),
      body:contacts.isEmpty? EmptyState():ContactState(contacts: contacts,onDelete:deleteContact ,),
      floatingActionButton:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(contacts.isNotEmpty)
          FloatingActionButton(
            backgroundColor: AppColors.Red,

              onPressed: (){
              setState(() {
                contacts.removeLast();
                _saveContacts();
              });
              },
            child:Icon(Icons.delete,color: AppColors.white,) ,
          ),
          SizedBox(height: 8,),
          if(contacts.length<6)

          FloatingActionButton(
            backgroundColor: AppColors.gold,
    onPressed:()async{
              final Contact? newContact= await showModalBottomSheet<Contact>(
                  context:context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.darkBlue,
                  builder: (context)=>AddContactSheet()
              );
              if(newContact!=null){
                setState(() => contacts.add(newContact));
                _saveContacts();
              }
            } ,
            child:Icon(Icons.add,color: AppColors.darkBlue,),
          ),
        ],
      ),

      );
  }
}
