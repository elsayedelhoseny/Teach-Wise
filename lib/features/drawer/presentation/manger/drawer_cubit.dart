import 'package:bloc/bloc.dart';

// هنا الحاله اللي بنتعامل معاها من نوع
// bool يعني ي ترو ي فولس
// وبنعرف من خلالها اذا كان الدرور مفتوح او مقفول
class DrawerCubit extends Cubit<bool> {
// وبتاخد قيمه ديفولت فولس
  DrawerCubit() : super(false);
// والميثود دي مهمتها انها بتلسن ان لو الدرور مفتوح تقفله ولو مقفوله تفتحه
  void toggleDrawer() => emit(!state);
}
