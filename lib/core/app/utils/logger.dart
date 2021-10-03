import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(
    printer: CustomLogPrinter(className),
  );
}

class CustomLogPrinter extends LogPrinter {
  final String className;
  CustomLogPrinter(this.className) : super();

  @override
  List<String> log(LogEvent event) {
    String emoji = PrettyPrinter.levelEmojis[event.level]!;
    return [('$emoji [$className]: ${event.message}')];
  }
}
