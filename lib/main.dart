import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'screens/homepage_screen.dart';
import 'screens/find_doctor_screen.dart';
import 'screens/medical_records_screen.dart';
import 'screens/doctor_detail_screen.dart';
import 'screens/appointment_schedule_screen.dart';
import 'screens/appointment_information_screen.dart';
import 'screens/appointment_payment_screen.dart';
import 'screens/od_services_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/appointment_list_screen.dart';
import 'screens/reminder_screen.dart';
import 'models/doctor_category.dart';
import 'models/doctor_credential.dart';
import 'models/appointment.dart';
import 'models/reminder.dart';
import 'providers/doctor_categories.dart';
import 'providers/doctor_credentials.dart';
import 'providers/appointments.dart';
import 'providers/auth.dart';
import 'providers/reminders.dart';

import 'widgets/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DoctorCategory(),
        ),
        ChangeNotifierProvider.value(
          //this part is used when .value is present
          value: DoctorCategories(),
          // this part is used when .value is absent (For the first notifier it is efficient)
          // create: (ctx){
          //   return DoctorCategories();
          // },
        ),
        ChangeNotifierProvider.value(
          value: DoctorCredential(),
        ),
        ChangeNotifierProvider.value(
          value: DoctorCredentials(),
        ),
        ChangeNotifierProvider.value(
          value: Appointment(),
        ),
        ChangeNotifierProvider.value(
          value: Appointments(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Reminder(),
        ),
        ChangeNotifierProvider.value(
          value: Reminders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) =>
         MaterialApp(
          // title: 'Flutter Demo',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            primaryColorLight: HexColor('#44b3b2'),
            primaryColor: HexColor('#326060'),
            primaryColorDark: Colors.black45,
            buttonColor: HexColor('#E1FFF7'),
            canvasColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: HexColor('#24a7a5')
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              headline2: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: HexColor('#326261'),
              ),
              headline4: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              bodyText1: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                color: Colors.black,
              ),
              headline3: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                color: HexColor('#25A09D'),
              ),
            )
          ),
          // home: AppointmentListScreen(),
          home: auth.isAuth
            ? HomepageScreen()
            : HomepageScreen(),
          // AppointmentListScreen(),
          // FutureBuilder(
          //       future: auth.tryAutoLogin(),
          //       builder: (ctx, authResultSnapshot) =>
          //       authResultSnapshot.connectionState == ConnectionState.waiting
          //         ? Scaffold(
          //             body: Center(
          //               child: Text('APP LOADING! PLEASE WAIT.'),
          //             ),
          //           )
          //         : AuthScreen(),
          //     ),
          routes: {
            HomepageScreen.routeName: (ctx) => HomepageScreen(),
            FindDoctorScreen.routeName: (ctx) => FindDoctorScreen(),
            MedicalRecordsScreen.routeName: (ctx) => MedicalRecordsScreen(),
            DoctorDetailScreen.routeName: (ctx) => DoctorDetailScreen(),
            AppointmentScheduleScreen.routeName: (ctx) => AppointmentScheduleScreen(),
            AppointmentInformationScreen.routeName: (ctx) => AppointmentInformationScreen(),
            AppointmentPaymentScreen.routeName: (ctx) => AppointmentPaymentScreen(),
            OdServicesScreen.routeName: (ctx) => OdServicesScreen(),
            AppointmentListScreen.routeName: (ctx) => AppointmentPaymentScreen(),
            ReminderScreen.routeName: (ctx) => ReminderScreen(),
          }
        ),
      )
    );
  }
}

