import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/providers/organization_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/ecosystem_participation_form.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/profile_organization_form_provider.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/local_storage.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}



class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: ( _ ) => AuthProvider()),
        ChangeNotifierProvider(create: (_)=>OrganizationProvider()),
        ChangeNotifierProvider(create: (_)=>ProfileOrganizationProvider()),
        ChangeNotifierProvider(create: (_)=>EcosystemParticipationFormProvider())
        
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciudadela Enterprise',  
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(36, 37, 41,1),
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey
          )
        ),
        
      )
    );
  }
}