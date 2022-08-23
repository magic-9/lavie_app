import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';

import '../Cubit/CubitApp.dart';
import '../Shard/utils/AppColors.dart';
import '../Shard/widgets/Widgets.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(builder: (context ,state){
      return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset("assets/images/logo.png" , height: 40),
              searchWidget(context),
              categoriesWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 285,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10),
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                            width: 220,
                            height: 320,
                            child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: 58,
                                      left: 0,
                                      child: Container(
                                          width: 176,
                                          height: 227,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            boxShadow : [BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                                                offset: Offset(0,2),
                                                blurRadius: 9
                                            )],
                                            color : Color.fromRGBO(255, 255, 255, 1),
                                          )
                                      )
                                  ),Positioned(
                                      top: 0,
                                      left: 13,
                                      child: Container(
                                          width: 82,
                                          height: 164,
                                          decoration: BoxDecoration(
                                            image : DecorationImage(
                                                image: AssetImage('assets/images/Background-2022-08-09T1459313.png'),
                                                fit: BoxFit.fitWidth
                                            ),
                                          )
                                      )
                                  ),Positioned(
                                      top: 70,
                                      left: 48,
                                      child: Container(
                                          width: 47,
                                          height: 94,
                                          decoration: BoxDecoration(
                                            image : DecorationImage(
                                                image: AssetImage('assets/images/Background-2022-08-09T1459313.png'),
                                                fit: BoxFit.fitWidth
                                            ),
                                          )
                                      )
                                  ),Positioned(
                                      top: 140,
                                      left: 14,
                                      child: Text('GARDENIA PLANT', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 5
                                      ),)
                                  ),Positioned(
                                      top: 160,
                                      left: 14,
                                      child: Text('70 EGP', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 6.666666666666667
                                      ),)
                                  ),Positioned(
                                      top: 230,
                                      left: 14,
                                      child: Container(
                                        width: 148,
                                        height: 35,
                                        child: ElevatedButton(
                                          child: Text("Add To Cart", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18
                                          ),),
                                          onPressed: ()=>{},
                                          style: ElevatedButton.styleFrom(
                                            primary: AppColors.primary,
                                          ),
                                        ),
                                      )
                                  ),Positioned(
                                      top: 90,
                                      left: 137,
                                      child: Text('1', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),Positioned(
                                      top: 90,
                                      left: 150,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        child: Icon(Icons.add, size: 14),
                                      )
                                  ),Positioned(
                                      top: 90,
                                      left: 113,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        child: Icon(Icons.dataset_rounded),
                                      )
                                  ),
                                ]
                            )
                        );
                      }),
                ),
              )






              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 10
              //   ),
              //   child: Container(
              //     height: 600,
              //     child:  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing:10,
              //         mainAxisSpacing: 40
              //
              //     ), itemBuilder: (context, index){
              //       return  Center(
              //         child: Container(
              //             width: 176,
              //             height: 600,
              //
              //             child: Stack(
              //                 children: <Widget>[
              //                   Positioned(
              //                       top: 58,
              //                       left: 0,
              //                       child: Container(
              //                           width: 176,
              //                           height: 227,
              //                           decoration: BoxDecoration(
              //                             borderRadius : BorderRadius.only(
              //                               topLeft: Radius.circular(10),
              //                               topRight: Radius.circular(10),
              //                               bottomLeft: Radius.circular(10),
              //                               bottomRight: Radius.circular(10),
              //                             ),
              //                             boxShadow : [BoxShadow(
              //                                 color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
              //                                 offset: Offset(0,2),
              //                                 blurRadius: 9
              //                             )],
              //                             color : Color.fromRGBO(255, 255, 255, 1),
              //                           )
              //                       )
              //                   ),Positioned(
              //                       top: 0,
              //                       left: 13,
              //                       child: Container(
              //                           width: 82,
              //                           height: 164,
              //                           decoration: BoxDecoration(
              //                             image : DecorationImage(
              //                                 image: AssetImage('assets/images/Background-2022-08-09T1459313.png'),
              //                                 fit: BoxFit.fitWidth
              //                             ),
              //                           )
              //                       )
              //                   ),Positioned(
              //                       top: 70,
              //                       left: 48,
              //                       child: Container(
              //                           width: 47,
              //                           height: 94,
              //                           decoration: BoxDecoration(
              //                             image : DecorationImage(
              //                                 image: AssetImage('assets/images/Background-2022-08-09T1459313.png'),
              //                                 fit: BoxFit.fitWidth
              //                             ),
              //                           )
              //                       )
              //                   ),Positioned(
              //                       top: 130,
              //                       left: 14,
              //                       child: Text('GARDENIA PLANT', textAlign: TextAlign.left, style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              //                           fontWeight: FontWeight.normal,
              //                           height: 5
              //                       ),)
              //                   ),Positioned(
              //                       top: 150,
              //                       left: 14,
              //                       child: Text('70 EGP', textAlign: TextAlign.left, style: TextStyle(
              //                           color: Color.fromRGBO(0, 0, 0, 1),
              //                           fontFamily: 'Roboto',
              //                           fontSize: 12,
              //                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              //                           fontWeight: FontWeight.normal,
              //                           height: 6.666666666666667
              //                       ),)
              //                   ),
              //                   Positioned(
              //                       top: 220,
              //                       left: 10,
              //                       width: 155,
              //                       child: ElevatedButton(
              //                         child: Text("Add To Cart", style: TextStyle(color: Colors.white),),
              //                         onPressed: ()=>{},
              //                         style: ElevatedButton.styleFrom(
              //                             primary: AppColors.primary
              //                         ),
              //                       )
              //                   ),
              //
              //                 ]
              //             )
              //         ),
              //       );
              //     }),
              //   ),
              // )
            ],
          ),
        ),
      );
    }, listener: (context , state){

    });
  }

  Widget categoriesWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      child: Container(
        height: 50,
        child: ListView.separated(
          separatorBuilder: (context , index){
            return SizedBox(
              width: 10,
            );
          },
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                 CubitApp.get(context).changeNavCategory(index);
              },
              child: Container(
                width: 100,
                child: Center(child: customText(text: "Text ${index}", color: Color(0xff979797), fontSize: 18)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        width: 3,
                        color: index == CubitApp.get(context).indexCategory? AppColors.primary : Colors.white
                    )
                ),
              ),
            );
          },
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget searchWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 60,
        child: Form(child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width -80,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    )
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius : BorderRadius.circular(
                    20
                ), color : Color.fromRGBO(247, 247, 247, 1),
              ),
              height: 50,
              width: 50,
              child: ElevatedButton(onPressed: ()=>{}, child: Icon(Icons.shopping_cart_outlined ,color: Colors.white,) , style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  )
              )),
            )
          ],
        )),
      ),
    );
  }
}


