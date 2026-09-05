import 'package:contactsapp/Data/contactData.dart';
import 'package:contactsapp/utils/AppColors.dart';
import 'package:contactsapp/utils/AppImages.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
   ContactCard({super.key,required this.contact});
  Widget _contactinfo(IconData icon,String info){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8),
      child: Row(
        children: [
          Icon(icon,color:AppColors.darkBlue),
          SizedBox(width: 6,),
          Expanded(
            child: Text(info,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
               fontSize: 10,fontWeight: FontWeight.w500,color: AppColors.darkBlue
            ),
            ),
          )
        ],
      ),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
        clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(AppImages.forMe,fit: BoxFit.cover,)),
                Positioned(
                  left: 8,
                    bottom: 8,
                    child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(8)
                  ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(contact.name,style: TextStyle(
                          fontWeight: FontWeight.w500,color: AppColors.darkBlue,fontSize: 14
                        ),
                        ),
                      ),

                )
                )
              ],
            ),
          ),

          Expanded (
            flex: 2,
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(top:17),
                  child: Column(
                    children: [
                      _contactinfo(Icons.email, contact.email),
                      _contactinfo(Icons.phone, contact.phone),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.Red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete,color:AppColors.white),
                            Text(" Delete",style: TextStyle(
                                color: AppColors.white,fontSize: 10,fontWeight: FontWeight.w500
                            ),)
                          ],
                        )
                    ),
                  ),
                )
              ],
            ),
          )



        ],
      )
    );
  }
}
