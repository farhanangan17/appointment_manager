import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/reminder.dart';
import '../providers/reminders.dart';

class ReminderScreen extends StatefulWidget {
  static const routeName = '/reminder_screen';
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final _dateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _timeController = TextEditingController();

  final _dNameFocusNode = FocusNode();
  final _concernFocusNode = FocusNode();
  final _dosageFocusNode = FocusNode();
  final _docNameFocusNode = FocusNode();
  final _startDateFocusNode = FocusNode();
  final _endDateFocusNode = FocusNode();
  final _timeFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var _tempRem = Reminder(
  reminderId: '',
  drugName: '',
  concern: '',
  dosage: '',
  docName: '',
  startDate: '',
  endDate: '',
  time: '',
  );

  @override
  void dispose(){
    _dNameFocusNode.dispose();
    _concernFocusNode.dispose();
    _dosageFocusNode.dispose();
    _docNameFocusNode.dispose();
    _startDateFocusNode.dispose();
    _endDateFocusNode.dispose();
    _timeFocusNode.dispose();
    _dateController.dispose();
    _endDateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  _selectDateTime(BuildContext context, String title) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime nowTime = DateTime.now();

    if(title != 'Time'){
      if(title == 'Start'){
        final DateTime picked =  await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2019, 8),
            lastDate: DateTime(2100)
        );
        if (picked != null && picked != selectedDate){
          setState(() {
            selectedDate = picked;
            var date = DateTime(picked.year, picked.month, picked.day, picked.hour, picked.minute);
            String _formatStartDate = DateFormat('dd/MM/yyyy').format(date);
            _dateController.text = _formatStartDate;
            // var date =
            //     "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
            // _dateController.text = date;
          });
        }
      }else{
        final DateTime picked =  await showDatePicker(
            context: context,
            initialDate: selectedEndDate,
            firstDate: DateTime(2019, 8),
            lastDate: DateTime(2100)
        );
        if (picked != null && picked != selectedEndDate){
          setState(() {
            selectedEndDate = picked;
            var date = DateTime(picked.year, picked.month, picked.day, picked.hour, picked.minute);
            // "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
            String _formatEndDate = DateFormat('dd/MM/yyyy').format(date);
            _endDateController.text = _formatEndDate;
            //  _endDateController.text = date;
          });
        }
      }
    }else{
      final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null && picked != selectedTime) {
        // _timeController.text = picked.toString();  // add this line.
        setState(() {
          selectedTime = picked;
          var time = DateTime(nowTime.year, nowTime.month, nowTime.day, picked.hour, picked.minute);
          String _formatTime = DateFormat.jm().format(time);
          _timeController.text = _formatTime;
        });
      }
    }
  }

  Widget labelContainer(BuildContext ctx, String title, Size deviceSize){
    return Padding(
      padding: EdgeInsets.only(top: deviceSize.height*0.01, bottom: deviceSize.height*0.01),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(ctx).primaryColorLight
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final _addReminder = Provider.of<Reminders>(context);
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      //dismissing soft keyboard
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          title: Text('Reminders', style: Theme.of(context).textTheme.headline2,),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children:<Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        labelContainer(context, 'Drug Name', deviceSize),
                        Container(
                          // height: deviceSize.height*0.06,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Drug Name',
                              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              // focusColor: Theme.of(context).primaryColorLight,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColorLight
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_concernFocusNode);
                            },
                            onSaved: (val){
                              _tempRem = Reminder(
                                reminderId: _tempRem.reminderId,
                                drugName: val,
                                concern: _tempRem.concern,
                                dosage: _tempRem.dosage,
                                docName: _tempRem.docName,
                                startDate: _tempRem.startDate,
                                endDate: _tempRem.endDate,
                                time: _tempRem.time,
                              );
                            },
                            validator: (value){
                              if(value.isEmpty){
                                return 'Provide drug name';
                              }
                              if(value.length < 3){
                                return 'Provide proper value';
                              }
                              return null;
                            },
                          ),
                        ),
                      ]
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          labelContainer(context, 'Concern', deviceSize),
                          Container(
                            // height: deviceSize.height*0.06,
                            child: TextFormField(
                              // style: TextFormS,
                              //   controller: _dateController,
                                decoration: InputDecoration(
                                  hintText: 'Concern',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  // focusColor: Theme.of(context).primaryColorLight,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColorLight
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                                  ),
                                ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(_dosageFocusNode);
                              },
                              onSaved: (val){
                                _tempRem = Reminder(
                                  reminderId: _tempRem.reminderId,
                                  drugName: _tempRem.drugName,
                                  concern: val,
                                  dosage: _tempRem.dosage,
                                  docName: _tempRem.docName,
                                  startDate: _tempRem.startDate,
                                  endDate: _tempRem.endDate,
                                  time: _tempRem.time,
                                );
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Provide your concern';
                                }
                                if(value.length < 3){
                                  return 'Provide proper value';
                                }
                                return null;
                              },
                            ),
                          ),
                        ]
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          labelContainer(context, 'Dosage', deviceSize),
                          Container(
                            // height: deviceSize.height*0.06,
                            child: TextFormField(
                              // style: TextFormS,
                              // controller: _dateController,
                              decoration: InputDecoration(
                                hintText: 'Dosage',
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                // focusColor: Theme.of(context).primaryColorLight,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColorLight
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(_docNameFocusNode);
                              },
                              onSaved: (val){
                                _tempRem = Reminder(
                                  reminderId: _tempRem.reminderId,
                                  drugName: _tempRem.drugName,
                                  concern: _tempRem.concern,
                                  dosage: val,
                                  docName: _tempRem.docName,
                                  startDate: _tempRem.startDate,
                                  endDate: _tempRem.endDate,
                                  time: _tempRem.time,
                                );
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Provide dosage amount';
                                }
                                return null;
                              },
                            ),
                          ),
                        ]
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          labelContainer(context, 'Doctor', deviceSize),
                          Container(
                            // height: deviceSize.height*0.06,
                            child: TextFormField(
                              // style: TextFormS,
                              // controller: _dateController,
                              decoration: InputDecoration(
                                hintText: 'Doctor',
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                // focusColor: Theme.of(context).primaryColorLight,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColorLight
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(_startDateFocusNode);
                              },
                              onSaved: (val){
                                _tempRem = Reminder(
                                  reminderId: _tempRem.reminderId,
                                  drugName: _tempRem.drugName,
                                  concern: _tempRem.concern,
                                  dosage: _tempRem.dosage,
                                  docName: val,
                                  startDate: _tempRem.startDate,
                                  endDate: _tempRem.endDate,
                                  time: _tempRem.time,
                                );
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Provide doctor name';
                                }
                                if(value.length < 3){
                                  return 'Provide proper value';
                                }
                                return null;
                              },
                            ),
                          ),
                        ]
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            width: deviceSize.width*0.42,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                labelContainer(context, 'Start', deviceSize),
                                Container(
                                  // height: deviceSize.height*0.06,
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                      hintText: 'Start',
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          _selectDateTime(context, 'Start');
                                        },
                                        icon: Icon(Icons.calendar_today_rounded, color: Theme.of(context).primaryColorLight,),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      // focusColor: Theme.of(context).primaryColorLight,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context).primaryColorLight
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_){
                                      FocusScope.of(context).requestFocus(_endDateFocusNode);
                                    },
                                    onSaved: (val){
                                      _tempRem = Reminder(
                                        reminderId: _tempRem.reminderId,
                                        drugName: _tempRem.drugName,
                                        concern: _tempRem.concern,
                                        dosage: _tempRem.dosage,
                                        docName: _tempRem.docName,
                                        startDate: val,
                                        endDate: _tempRem.endDate,
                                        time: _tempRem.time,
                                      );
                                    },
                                    validator: (value){
                                      if(value.isEmpty){
                                        return 'Provide starting date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ]
                            ),
                        ),
                        SizedBox(width: deviceSize.width*0.05,),
                        SizedBox(
                          width: deviceSize.width*0.42,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                labelContainer(context, 'End', deviceSize),
                                Container(
                                  // height: deviceSize.height*0.06,
                                  child: TextFormField(
                                    readOnly: true,
                                    keyboardType: TextInputType.datetime,
                                    controller: _endDateController,
                                    decoration: InputDecoration(
                                      hintText: 'End',
                                      suffixIcon:IconButton(
                                        onPressed: (){
                                          _selectDateTime(context, 'Date');
                                        },
                                        icon: Icon(Icons.calendar_today_rounded, color: Theme.of(context).primaryColorLight,),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      // focusColor: Theme.of(context).primaryColorLight,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context).primaryColorLight
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_){
                                      FocusScope.of(context).requestFocus(_timeFocusNode);
                                    },
                                    onSaved: (val){
                                      _tempRem = Reminder(
                                        reminderId: _tempRem.reminderId,
                                        drugName: _tempRem.drugName,
                                        concern: _tempRem.concern,
                                        dosage: _tempRem.dosage,
                                        docName: _tempRem.docName,
                                        startDate: _tempRem.startDate,
                                        endDate: val,
                                        time: _tempRem.time,
                                      );
                                    },
                                    validator: (value){
                                      if(value.isEmpty){
                                        return 'Provide ending date';
                                      }
                                      // DateFormat.yMMMd('en_US').parse(_appDetails.date).isAfter(DateTime.now()) || DateFormat.jm().parse(_appDetails.time).isAfter(DateTime.now())
                                      else if(DateFormat('dd/MM/yyy').parse(value).isBefore(DateFormat('dd/MM/yyy').parse(_dateController.text))){
                                        return 'Provide a later date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ]
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                            width: deviceSize.width*0.3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget>[
                                  labelContainer(context, 'Time', deviceSize),
                                  Container(
                                    // height: deviceSize.height*0.06,
                                    child: TextFormField(
                                      readOnly: true,
                                      // style: TextFormS,
                                      controller: _timeController,
                                      decoration: InputDecoration(
                                        hintText: 'Time',
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            _selectDateTime(context, 'Time');
                                          },
                                          icon: Icon(Icons.alarm, color: Theme.of(context).primaryColorLight,),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        // focusColor: Theme.of(context).primaryColorLight,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).primaryColorLight
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                                        ),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      onSaved: (val){
                                        _tempRem = Reminder(
                                          reminderId: _tempRem.reminderId,
                                          drugName: _tempRem.drugName,
                                          concern: _tempRem.concern,
                                          dosage: _tempRem.dosage,
                                          docName: _tempRem.docName,
                                          startDate: _tempRem.startDate,
                                          endDate: _tempRem.endDate,
                                          time: val,
                                        );
                                      },
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Provide intake time';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ]
                            ),
                        ),
                        SizedBox(width: deviceSize.width*0.05,),
                        FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColorLight,
                          child: Icon(Icons.add,),
                          onPressed: (){
                            final _isValid = _formKey.currentState.validate();
                            if(_isValid) _formKey.currentState.save();
                            _addReminder.addReminder(_tempRem);
                            print(_tempRem.drugName);
                            print(_tempRem.docName);
                            print(_tempRem.startDate);
                          }
                        ),
                      ],
                    )
                  ] ,
                )
            ),
          ),
        )
      ),
    );
  }
}
