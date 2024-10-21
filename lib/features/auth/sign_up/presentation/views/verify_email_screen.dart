import 'package:chat_bot/features/chat/ui/widgets/custom_buttom.dart';
import 'package:chat_bot/features/chat/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../logic/services/auth_service.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تحقق من بريدك الإلكتروني")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق من بريدك لتفعيل حسابك.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await AuthService().checkEmailVerification(context);
              },
              child: Text("تحقق الآن"),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                await AuthService().sendVerificationCode();
              },
              child: Text("إعادة إرسال رابط التفعيل"),
            ),
          ],
        ),
      ),
    );
  }
}
