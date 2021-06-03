import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class AppointmentPaymentScreen extends StatefulWidget {
  static const routeName = '/appointment_payment_screen';

  @override
  _AppointmentPaymentScreenState createState() => _AppointmentPaymentScreenState();
}

class _AppointmentPaymentScreenState extends State<AppointmentPaymentScreen> {
  var _saved = false;

  Widget textFieldContainer(BuildContext ctx, String title, double wide){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(ctx).primaryColorLight
              ),
            ),
          ),
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
        title: Text('Appointment information', style: Theme.of(context).textTheme.headline2,),
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
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    height: 30,
                    child: Text('--------Progress Bar-------'),
                  ),
                  Text(
                    'BDT $_visitAmount',
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              SizedBox(height: deviceSize.height*0.1,),
              Container(
                // alignment: Alignment.topLeft,
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                    // height: deviceSize.height *0.33,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            textFieldContainer(context, 'CARD NUMBER', deviceSize.width*0.5),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                            //   width: deviceSize.width *0.2,
                            //   height: 45,
                            //   // deviceSize.height*0.1,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.zero,
                            //     color: Colors.black12
                            //   ),
                            // )
                          ]
                        ),
                        textFieldContainer(context, 'CARDHOLDER NAME', deviceSize.width*0.9),
                        textFieldContainer(context, 'Patient Name', deviceSize.width*0.5),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    );
  }
}
