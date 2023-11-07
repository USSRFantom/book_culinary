import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/locator_service.dart' as di;
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:book_culinary/view/section/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(MealsAdapter());
  initHttpClient();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealsCubit>(
            create: (context) => serviceLocator<MealsCubit>()),
      ],
      child: ScreenUtilInit(
        builder: (context, widget) => const HomeScreen(),
        designSize: const Size(375, 812),
      ),
    );
  }
}
