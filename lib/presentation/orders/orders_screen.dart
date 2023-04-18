import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limona/presentation/map/map_screen.dart';
import 'package:limona/presentation/register/register_screen.dart';
import '../resources/color_manager.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(()=> MapScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor:ColorManager.backgroundColor,
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            title: Text('الطلبات',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Get.to(()=> MapScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.notifications_none,
                    color: ColorManager.secondaryColor,
                    size: 25,
                  ),
                )),
            actions: [
              InkWell(
                  onTap: () {
                    Get.to(()=> RegisterScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.menu,
                      color: ColorManager.secondaryColor,
                      size: 25,
                    ),
                  ))
            ],
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (ctx, i) {
                          return Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'مطاعم ليمونة',
                                                style: TextStyle(
                                                  color:Colors.black,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '32 كم',
                                                    style: TextStyle(
                                                      color:ColorManager.secondaryColor,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  Image.asset('assets/images/pp.png',width: 15,height: 15,)                                                ],
                                              ),
                                            ],
                                          ),

                                          Image.asset('assets/images/limona.png',width: 50,height: 50,),


                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'طلب رقم : 243367686987',
                                            style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'قاسم الفهد',
                                            style: TextStyle(
                                              color:Colors.black,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          CircleAvatar(
                                              backgroundImage: AssetImage('assets/images/person.jpg',),
                                              radius: 15.0
                                          )



                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          Text(
                                            'تاريخ الطلب : 23/4/2023',
                                            style: TextStyle(
                                              color:Colors.grey,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Icon(Icons.calendar_today,color: Colors.grey[300],),


                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'وجبة الفراخ المشوية , بيبسي كولا , كل الإضافات المطلوبة',
                                        style: TextStyle(
                                          color:Colors.black,
                                          fontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorManager.secondaryColor,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                                            ),

                                            onPressed: () {

                                            },
                                            child: Text(
                                              'تأكيد الطلب',
                                              style: TextStyle(color: Colors.white),
                                            ),

                                            ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey[300],
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                                            ),

                                            onPressed: () {
                                            },
                                            child: Text(
                                              'كل التفاصيل',
                                              style: TextStyle(color: ColorManager.secondaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),


                  ],
                ),
              )),


        ),
      ),
    );
  }
}
