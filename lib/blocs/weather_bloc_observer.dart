import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class WeatherBlocObserver extends BlocObserver {
  final logger = Logger();
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('onEvent $event'); // d - Debug: kiểm tra và sửa lỗi trong quá trình phát triển
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('onTransition $transition');
  }
  @override
  // Thay đổi kiểu dữ liệu Cubit cubit thành BlocBase<dynamic>
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('onError $error'); // e - Error: báo cáo các lỗi xảy ra trong quá trình chạy ứng dụng
  }
}