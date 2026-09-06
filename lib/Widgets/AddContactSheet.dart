import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:contactsapp/Data/contactData.dart';
import 'package:contactsapp/utils/AppAnimations.dart';
import 'package:contactsapp/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddContactSheet extends StatefulWidget {
   AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  XFile? pickedImage;
  Future <void> pickImage()async{
    final ImagePicker picker=ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
if(image!=null){
  setState(() {
    pickedImage=image;
  });
}

  }
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    Widget _divider() {
      return
        Padding(
          padding: const EdgeInsets.only(right: 24,top: 10,bottom: 10),
          child: Container(height: 1.5, color: AppColors.gold.withOpacity(1)),
        );
    }
    Widget _previewLine(String text,String value){
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(value.isEmpty ? text: value
          ,style: TextStyle(
          fontWeight: FontWeight.w500,fontSize: 16,color:AppColors.gold,

        ),
        ),
      );
    }
    String? _validateName(String? value){
      if(value==null||value.isEmpty){
        return "Pls Enter Name";
      }
      if (value.length < 3) {
        return "Name must be at least 3 characters";
      }
      return null;
    }
    String? _validateEmail(String? value){
      final emailReg=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if(value==null||value.isEmpty){
        return "Pls Enter Email";
      }
      if (!emailReg.hasMatch(value)) {
        return "Invalid Email";
      }
      return null;
    }
    String? _validatePhone(String? value){
      if(value==null||value.isEmpty){
        return "Pls Enter Phone Number";
      }
      final phoneReg = RegExp(r'^01[0-9]{9}$');
      if (!phoneReg.hasMatch(value)) {
        return "It Should Start With 01 and Contain 11 Number";
      }
      return null;
    }

    Widget _field(String hint,TextEditingController controller,{TextInputType type=TextInputType.text,
      String? Function(String?)? validator,}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:16,vertical: 8),
        child: TextFormField(
          controller: controller,
          onChanged: (value) => setState(() {}),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,


          keyboardType: type,
          cursorColor: AppColors.gold,
          style: TextStyle(
            fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.lightBlue
          ),

          decoration: InputDecoration(
              hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w400,color:AppColors.lightBlue
            ),
            contentPadding: const EdgeInsets.all(16),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color:AppColors.gold,width: 1.5)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color:AppColors.gold,width: 1.5)
          ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color:AppColors.errorRed,width: 1.5)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color:AppColors.errorRed,width: 1.5)
            ),

          ),
        ),
      );


    }
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.gold,width: 1.5)
                      ),

                      child:pickedImage==null?
                      Lottie.asset(AppAnimations.imagePicker,
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.height*0.2


                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.file(
                          File(pickedImage!.path),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _previewLine("User Name",nameController.text),
                        _divider(),
                        _previewLine("example@email.com",emailController.text),
                        _divider(),
                        _previewLine("+200000000000",phoneController.text),
                      ],
                    ),
                  )
                ],
              ),
              _field("Enter User Name ",nameController,validator:_validateName),
              _field("Enter User Email ",emailController,type: TextInputType.emailAddress,validator: _validateEmail),
              _field("Enter User Phone",phoneController,type:TextInputType.phone,validator:_validatePhone),
              if(!isKeyboardOpen)
              Padding(
                padding:  EdgeInsets.only(left:16,right: 16,top: 16,
                  bottom:16
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context,Contact(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        imagePath: pickedImage?.path
                      )

                      );
                    }

                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.gold,
                      foregroundColor: AppColors.darkBlue,
                      padding: EdgeInsets.all(16),
                      overlayColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),

                    ),
                    child: Text("Enter user",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

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
