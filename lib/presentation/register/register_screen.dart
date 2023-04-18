import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;
import '../resources/color_manager.dart';
import '../orders/orders_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<File?> files = [null, null, null, null];
  List<File?> files2 = [null, null];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(()=> const OrdersScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            title: const Text(
              'استكمال بيانات التسجيل',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                  onTap: () {
                    Get.to(()=> const OrdersScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.secondaryColor,
                      size: 25,
                    ),
                  ))
            ],
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:const
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        showCursor: false,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.all(10),
                          fillColor: ColorManager.primaryColor,
                          filled: true,
                          hintText: "رقم المركبة",
                          focusColor: ColorManager.secondaryColor,
                          hintStyle:const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.secondaryColor),
                          ),
                          suffixIcon: Icon(
                            Icons.car_crash_outlined,
                            color: ColorManager.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:const
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        showCursor: false,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding:const EdgeInsets.all(10),
                            fillColor: ColorManager.primaryColor,
                            filled: true,
                            hintText: "نوع المركبة",
                            focusColor: ColorManager.secondaryColor,
                            hintStyle:const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.secondaryColor),
                            ),
                            suffixIcon: const Icon(
                              Icons.tonality_rounded,
                              color: Colors.grey,
                            ),
                            prefixIcon: Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        showCursor: false,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: ColorManager.primaryColor,
                          filled: true,
                          hintText: "موديل المركبة",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.secondaryColor),
                          ),
                          suffixIcon: const Icon(Icons.edit, color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        showCursor: false,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: ColorManager.primaryColor,
                            filled: true,
                            hintText: " سنة الصنع",
                            focusColor: ColorManager.secondaryColor,
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.secondaryColor),
                            ),
                            suffixIcon: const Icon(
                              Icons.tonality_rounded,
                              color: Colors.grey,
                            ),
                            prefixIcon: Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('صور المركبة'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8.0),
                      child: SizedBox(
                        height: 100,

                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: files.length,
                            itemBuilder: (ctx, i) {
                              return files[i] == null
                                  ? InkWell(
                                      onTap: () {
                                        getImage(i);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  size: 40,
                                                  color: Colors.grey,
                                                )),
                                                Text(
                                                  'أضف صورة',
                                                  style: TextStyle(
                                                      color: Colors.black45),
                                                )
                                              ]),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        getImage(i);
                                      },
                                     child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                              ),
                              ),
                              child: Stack(children: [Image.file(files[i]!,fit: BoxFit.cover,),
                                Positioned(
                                    bottom:0,
                                    right:0,
                                    child:Container(
                                      width: 15,
                                      height: 30,
                                      color: ColorManager.secondaryColor,
                                      child: Center(child: Icon(Icons.more_vert,color: ColorManager.primaryColor,size: 15,)),
                                    )
                                ),

                                  ])
                              ),
                                     )
                                    );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('رخصة السيارة'),
                          Text("رخصة القيادة"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8.0),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                            physics:const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: files2.length,
                            itemBuilder: (ctx, i) {
                              return files2[i] == null
                                  ? InkWell(
                                onTap: () {
                                  getImage2(i);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: const [
                                          Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 40,
                                                color: Colors.grey,
                                              )),
                                          Text(
                                            'أضف صورة',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )
                                        ]),
                                  ),
                                ),
                              )
                                  : InkWell(
                                      onTap: () {
                                        getImage2(i);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width*0.4,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Image.file(files2[i]!,fit: BoxFit.cover),
                                                Positioned(
                                                    bottom:0,
                                                    right:0,
                                                    child:Container(
                                                      width: 15,
                                                      height: 30,
                                                      color: ColorManager.secondaryColor,
                                                      child: Center(child: Icon(Icons.more_vert,color: ColorManager.primaryColor,size: 15,)),
                                                    )
                                                ),
                                          ]
                                            )
                                        ),
                                      )
                                  );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.85,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.secondaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                          ),

                          onPressed: () {
                          },
                          child:const Text(
                            'تأكيد إنشاء الحساب',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  final picker = ImagePicker();

  Future getImage(int index) async {

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      files[index] = File(pickedFile.path);
      setState(() {});
    } else {

    }
  }

  Future getImage2(int index) async {

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      files2[index] = File(pickedFile.path);
      setState(() {});
    } else {

    }
  }
}
