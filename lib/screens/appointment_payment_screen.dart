import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class AppointmentPaymentScreen extends StatefulWidget {
  static const routeName = '/appointment_payment_screen';

  @override
  _AppointmentPaymentScreenState createState() => _AppointmentPaymentScreenState();
}

class _AppointmentPaymentScreenState extends State<AppointmentPaymentScreen> {
  var _saved = false;

  Widget textFieldContainer(BuildContext ctx, double wide){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row(
          //   children: <Widget>[
              Container(
                height: 45,
                width: wide,
                child: TextFormField(
                  // style: TextFormS,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      // focusColor: Theme.of(context).primaryColorLight,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(ctx).primaryColorLight
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                    )
                ),
              ),
            // ]
          // ),
        ]
    );
  }

  Container cardButton(ctx, String str){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Center(
          child: Text(str, style: TextStyle(color: Colors.white),)
      ),
      height: 40,
      width: MediaQuery.of(ctx).size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Theme.of(ctx).primaryColor,
            Theme.of(ctx).primaryColorLight,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0,1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, int>;
    final _visitAmount = routeArgs['amount'];
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Appointment Payment', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
        height: deviceSize.height *0.9,
        width: deviceSize.width*1,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: deviceSize.height*0.02),
                    height: deviceSize.height*0.03,
                    child: Text('--------Progress Bar-------'),
                  ),
                  Text(
                    'BDT $_visitAmount',
                    style: TextStyle(
                        fontSize: deviceSize.height*0.035,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              SizedBox(height: deviceSize.height*0.03,),
              Container(
                // alignment: Alignment.topLeft,
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                    // height: deviceSize.height *0.33,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "CARD NUMBER",
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColorLight
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            textFieldContainer(context, deviceSize.width*0.62),
                            Container(
                              margin: EdgeInsets.only(left: deviceSize.width*0.03),
                              height: MediaQuery.of(context).size.height*0.06,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: BoxDecoration(
                                // color: Colors.black12,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                )
                              ),
                              child: Icon(Icons.money, color: Theme.of(context).primaryColorLight, size: deviceSize.width*0.09,),
                            ),
                          ]
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "CARDHOLDER NAME",
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColorLight
                            ),
                          ),
                        ),
                        textFieldContainer(context, deviceSize.width*0.9),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 10),
                                  child: Text(
                                    "EXPIRE DATE",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).primaryColorLight
                                    ),
                                  ),
                                ),
                                textFieldContainer(context, deviceSize.width*0.5),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                                  child: Text(
                                    "CVV",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).primaryColorLight
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: deviceSize.width*0.03),
                                  height: MediaQuery.of(context).size.height*0.06,
                                  width: MediaQuery.of(context).size.width*0.17,
                                  decoration: BoxDecoration(
                                    // color: Colors.black12,
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                      )
                                  ),
                                  child: Icon(Icons.money, color: Theme.of(context).primaryColorLight, size: deviceSize.width*0.09,),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Row(
                        //   children: <Widget>[
                        //     textFieldContainer(context, deviceSize.width*0.5),
                        //     Container(
                        //       margin: EdgeInsets.only(left: deviceSize.width*0.03),
                        //       height: MediaQuery.of(context).size.height*0.06,
                        //       width: MediaQuery.of(context).size.width*0.17,
                        //       decoration: BoxDecoration(
                        //         // color: Colors.black12,
                        //           borderRadius: BorderRadius.circular(0),
                        //           border: Border.all(
                        //             color: Colors.grey,
                        //             style: BorderStyle.solid,
                        //           )
                        //       ),
                        //       child: Icon(Icons.money, color: Theme.of(context).primaryColorLight, size: deviceSize.width*0.09,),
                        //     ),
                        //   ],
                        // )

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: deviceSize.height*0.01),
                child: Row(
                    children: <Widget>[
                      Checkbox(
                        // splashRadius: ,
                        value: _saved,
                        onChanged: (val){
                          setState(() {
                            _saved = val;
                          });
                        },
                        activeColor: Theme.of(context).primaryColorLight,
                      ),
                      Text('SAVE CARD', style: TextStyle(color: Theme.of(context).primaryColorLight),)
                    ]
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                        AppointmentPaymentScreen.routeName,
                        // arguments: {
                        //   'amount': _doctorProfile.visitAmount,
                        // }
                    );
                  },
                  child: cardButton(context, 'Pay Securely')
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Icon(Icons.home),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
