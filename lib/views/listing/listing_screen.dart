import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(border: Border.all(color: Colors.transparent),
      leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
      trailing: IconButton(icon: Icon(Icons.notifications), onPressed: (){}),),
      body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Column(
        children: [
          SizedBox(height: 20,),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     children: [
          //       Text('Listings', style: Theme.of(context).textTheme.headline4
          //       .copyWith(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
          //       SizedBox(width: 10,),
          //       Text('45 properties', style: Theme.of(context).textTheme.bodyText1
          //       .copyWith( fontSize: 12, color: Colors.black),),
          //       SizedBox(width: 10,),
          //       Text('2 pending', style: Theme.of(context).textTheme.bodyText1
          //       .copyWith(fontSize: 12, color: Color(0xffF2994A)),),

          //       Spacer(),
          //       InkWell(
          //         onTap: (){}, child:  Row(
          //         children: [
          //           Icon(Icons.add),
          //           Text('Create listing', style: Theme.of(context).textTheme.bodyText1
          //           .copyWith(fontSize: 14, color: Color(0xff8B90A0)),),
          //         ],
          //       ),)

          //     ],
          //   ),
          // ),
          // Row(
          //     children: [
          //       Text('Listings', style: Theme.of(context).textTheme.headline4
          //       .copyWith(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
          //       SizedBox(width: 10,),
          //       Text('45 properties', style: Theme.of(context).textTheme.bodyText1
          //       .copyWith( fontSize: 12, color: Colors.black),),
          //       SizedBox(width: 10,),
          //       Text('2 pending', style: Theme.of(context).textTheme.bodyText1
          //       .copyWith(fontSize: 12, color: Color(0xffF2994A)),),

          //       Spacer(),
          //       InkWell(
          //         onTap: (){}, child:  Row(
          //         children: [
          //           Icon(Icons.add),
          //           Text('Create listing', style: Theme.of(context).textTheme.bodyText1
          //           .copyWith(fontSize: 14, color: Color(0xff8B90A0)),),
          //         ],
          //       ),)

          //     ],
          //   ),
          SizedBox(height: 20,),
          Expanded(
                      child: ListView(
              children: [
                for (var i = 0; i < 20; i++) 
                Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                       Row(
              children: [
              InkWell(
                  onTap: (){}, child: 
                  Icon(Icons.gamepad, color: Color(0xff003BDE),
                ),),
                
                SizedBox(width: 10,),  Text('Current HP Assigned:', style: Theme.of(context).textTheme.bodyText1
                .copyWith( fontSize: 12, color: Colors.black),),
                SizedBox(width: 10,),
                Text('200', style: Theme.of(context).textTheme.bodyText1
                .copyWith(fontSize: 12, color: Color(0xff003BDE)),),

                Spacer(),
                InkWell(
                  onTap: (){}, child:  Row(
                  children: [
                    Icon(Icons.edit, color: Color(0xff003BDE),),
                    Text('Edit', style: Theme.of(context).textTheme.bodyText1
                    .copyWith(fontSize: 16, color: Color(0xff003BDE), ),),
                  ],
                ),),
                
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){}, child:  Row(
                  children: [
                    Icon(Icons.delete, color: Color(0xff003BDE),),
                    Text('Delete', style: Theme.of(context).textTheme.bodyText1
                    .copyWith(fontSize: 16, color: Color(0xff003BDE), ),),
                  ],
                ),)

              ],
            ),
                SizedBox(height: 5,),
                Row(
              children: [
              InkWell(
                  onTap: (){}, child: 
                  Icon(Icons.gamepad, color: Color(0xff003BDE),
                ),),
                
                SizedBox(width: 10,),  Text('Current HP Assigned:', style: Theme.of(context).textTheme.bodyText1
                .copyWith( fontSize: 12, color: Colors.black),),
                SizedBox(width: 10,),
                Text('200', style: Theme.of(context).textTheme.bodyText1
                .copyWith(fontSize: 12, color: Color(0xff003BDE)),),

                Spacer(),
                InkWell(
                  onTap: (){}, child:  Row(
                  children: [
                    Icon(Icons.edit, color: Color(0xff003BDE),),
                    Text('Edit', style: Theme.of(context).textTheme.bodyText1
                    .copyWith(fontSize: 16, color: Color(0xff003BDE), ),),
                  ],
                ),),
                
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){}, child:  Row(
                  children: [
                    Icon(Icons.delete, color: Color(0xff003BDE),),
                    Text('Delete', style: Theme.of(context).textTheme.bodyText1
                    .copyWith(fontSize: 16, color: Color(0xff003BDE), ),),
                  ],
                ),)

              ],
            ),
                      SizedBox(
                        // height: 100, 
                        child: Image.network('https://image.shutterstock.com/image-illustration/crash-test-dummy-isolated-260nw-275497868.jpg',
                        fit: BoxFit.cover,)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}