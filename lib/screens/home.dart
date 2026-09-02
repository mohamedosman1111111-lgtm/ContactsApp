import 'package:contactsapp/Data/contactData.dart';
import 'package:contactsapp/States/ContactState.dart';
import 'package:contactsapp/States/EmptyState.dart';
import 'package:contactsapp/Widgets/AddContactSheet.dart';
import 'package:contactsapp/utils/AppAnimations.dart';
import 'package:contactsapp/utils/AppColors.dart';
import 'package:contactsapp/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact>contacts=[];
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
      body:contacts.isEmpty? EmptyState():ContactState(contacts: contacts,),
      floatingActionButton:  FloatingActionButton(
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
          }
        } ,
        child:Icon(Icons.add,color: AppColors.darkBlue,),
      ),
      );
  }
}
