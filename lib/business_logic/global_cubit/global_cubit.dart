import 'package:clean_arch_flutter/core/cacheHelper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    lang = CacheHelper.getData(key: 'language') ?? 'ar';
    themeMode = CacheHelper.getData(key: 'isDarkMode') ?? false
        ? ThemeMode.dark
        : ThemeMode.light;
    languageDropdownSelectedItem = lang == 'en' ? 'English' : 'عربي';
    Intl.defaultLocale = lang;
    emit(ChangeLangState());
  }

  Future<void> changeLang(BuildContext context) async {
    final currentLang = lang;
    final newLang = currentLang == 'en' ? 'ar' : 'en';
    await CacheHelper.saveData(key: 'language', value: newLang);
    lang = newLang;
    languageDropdownSelectedItem = newLang == 'en' ? 'English' : 'عربي';
    Intl.defaultLocale = newLang;
    emit(ChangeLangState());
  }

  List<String> languageDropdownItems = ['English', 'عربي'];
  String? languageDropdownSelectedItem;

  void onChangeLanguageDropdownButton({required String value}) {
    languageDropdownSelectedItem = value;
    changeLang(cubitContext!);
    emit(OnChangeLanguageDropdownButtonState());
  }

  void toggleTheme() async {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ChangeThemeState(themeMode));
    CacheHelper.saveData(key: 'isDarkMode', value: themeMode == ThemeMode.dark);
  }
}
