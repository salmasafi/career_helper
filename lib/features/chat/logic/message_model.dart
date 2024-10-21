import '../../../core/constants.dart';

class Message {
  String message;
  String user;
  String date;

  Message({
    required this.message,
    required this.user,
    required this.date,
  });

  factory Message.fromJson({required jsonData}) {
    return Message(
      message: jsonData[kMessage],
      user: jsonData[kUser],
      date: jsonData[kDate],
    );
  }
}
