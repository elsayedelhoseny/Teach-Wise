import 'package:clean_arch_flutter/core/cacheHelper/cache_helper.dart';
import 'package:clean_arch_flutter/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'global_state.dart';
import 'package:intl/intl.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());
  static BuildContext? cubitContext;
  static GlobalCubit get(context) {
    cubitContext = context;
    return BlocProvider.of(context);
  }

  String lang = '';
  ThemeMode themeMode = ThemeMode.light;

  void initVoid() {
    emit(InitializingState());
    lang = CacheHelper.getData(key: 'language') ?? 'en';
    themeMode = CacheHelper.getData(key: 'isDarkMode') ?? false
        ? ThemeMode.dark
        : ThemeMode.light;
    Intl.defaultLocale = lang;
    delegate.onLocaleChanged = (Locale value) async {
      try {
        Intl.defaultLocale = value.languageCode;
        lang = value.languageCode;
        languageDropdownSelectedItem = lang == 'en' ? 'English' : 'عربي';
      } catch (e) {
        if (kDebugMode) {
          print('translation error :====> ${e.toString()}');
        }
      }
    };
  }

  Future<void> changeLang(context) async {
    if (AppLocalizations.of(context)!.localeName == 'en') {
      await delegate.changeLocale(const Locale('ar')).then((value) {
        CacheHelper.saveData(key: 'language', value: "ar");
        emit(ChangeLangState());
      }).catchError((error) {
        emit(ErrorChangeLangState());
        print('error is ${error.toString()}');
      });
    } else {
      await delegate.changeLocale(const Locale('en')).then((value) {
        CacheHelper.saveData(key: 'language', value: "en");
        emit(ChangeLangState());
      }).catchError((error) {
        emit(ErrorChangeLangState());
        print('error is ${error.toString()}');
      });
    }
  }

  List<String> languageDropdownItems = ['English', 'عربي'];
  String? languageDropdownSelectedItem;

  void onChangeLanguageDropdownButton(
      {required value, required context, isFromChildHomeScaffold = false}) {
    languageDropdownSelectedItem = value;
    changeLang(context);
    emit(OnChangeLanguageDropdownButtonState());
  }

  void toggleTheme() async {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ChangeThemeState(themeMode));
    CacheHelper.saveData(key: 'isDarkMode', value: themeMode == ThemeMode.dark);
  }
}
