import 'package:clean_arch_flutter/business_logic/bloc_observer.dart';
import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/business_logic/global_cubit/global_cubit.dart';
import 'package:clean_arch_flutter/business_logic/global_cubit/global_state.dart';
import 'package:clean_arch_flutter/core/Apis/dioHelper/dio_helper.dart';
import 'package:clean_arch_flutter/core/cacheHelper/cache_helper.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/router/app_router.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  DioHelper.init();

  token = CacheHelper.getData(key: 'token') ?? '';

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

late BuildContext mainContext;

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => GlobalCubit()..initVoid()),
        BlocProvider(create: (BuildContext context) => FormFieldCubit()),
      ],
      child: BlocBuilder<GlobalCubit, GlobalStates>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: Locale(GlobalCubit.get(context).lang),
            supportedLocales: const [Locale('ar'), Locale('en')],
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.watch<GlobalCubit>().themeMode,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
