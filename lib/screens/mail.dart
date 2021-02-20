import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

main() async {
  String username = 'nandhiniperiyasamy5@gmail.com'; //Your Email;
  String password = 'Baseketball@5'; //Your Email's password;

  // ignore: deprecated_member_use
  final smtpServer = gmail(username, password);
  // Creating the Gmail server

  // Create our email message.
  final message = Message()
    ..from = Address(username)
    ..recipients.add('nandhiniperiyasamy5@gmail.com') //recipent email
    ..ccRecipients.addAll(['shrutikhambhay@gmail.com']) //cc Recipents emails
    // ..bccRecipients
    //     .add(Address('bccAddress@example.com')) //bcc Recipents emails
    ..subject =
        'Test Dart Mailer library :: 😀 :: ${DateTime.now()}' //subject of the email
    ..text = "glucose:"; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print(
        'Message sent: ' + sendReport.toString()); //print if the email is sent
  } on MailerException catch (e) {
    print(
        'Message not sent. \n' + e.toString()); //print if the email is not sent
    // e.toString() will show why the email is not sending
  }
}
