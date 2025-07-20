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
import 'l10n/l10n.dart';
import 'package:flutter_translate/flutter_translate.dart';

late LocalizationDelegate delegate;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  DioHelper.init();

  final locale = CacheHelper.getData(key: 'language') ?? 'ar';
  token = CacheHelper.getData(key: 'token') ?? '';

  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(Locale(locale));

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
      child: BlocConsumer<GlobalCubit, GlobalStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return LocalizedApp(
            delegate,
            MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: delegate.currentLocale,
              supportedLocales: L10n.all,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: context.watch<GlobalCubit>().themeMode,
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
