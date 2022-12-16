import 'package:car_rental/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'core.dart';
import 'graphql_config/graphql_provider.dart';

void main() async {
  /// Make sure you add this line here, so the plugin can access the native side
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserViewModel())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final GraphqlClass graphqlClass = new GraphqlClass();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClass.client,
      child: CacheProvider(
        child: GetMaterialApp(
          title: 'Car Rental',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                bodyText1: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                )),
                subtitle1: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                )),
                subtitle2: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.normal,
                )),
                bodyText2: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                )),
                //       headline1: GoogleFonts.lato(
                //   textStyle: TextStyle(
                //   fontSize: 14.0,
                //     fontWeight: FontWeight.w300,
                //   )
                // ),
                //     headline2: GoogleFonts.lato(
                //         textStyle: TextStyle(
                //           fontSize: 14.0,
                //           fontWeight: FontWeight.normal,
                //         )
                //     )
              )
              // GoogleFonts.latoTextTheme(),

              ),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          transitionDuration: Duration(milliseconds: 230),
          initialBinding: MainBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    );
  }
}
