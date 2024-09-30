import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routing/routes.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/app_text_booton.dart';
import '../../core/widgets/text_widget.dart';
import '../auth_features/login/login_screen.dart';
import '../home_features/cubit/home_cubit/home_cubit.dart';

class EulaScreen extends StatefulWidget {
  const EulaScreen({super.key});

  @override
  _EulaScreenState createState() => _EulaScreenState();
}

class _EulaScreenState extends State<EulaScreen> {
  bool _isChecked = false; // Checkbox status
  bool _hasReadEULA = false; // Tracks if the user opened the EULA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EULA Agreement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10.0),
                    ContentText(
                      text:HomeCubit.get(context).isArabic?'''اتفاقية ترخيص المستخدم النهائي (EULA)

يرجى قراءة اتفاقية ترخيص المستخدم النهائي هذه بعناية قبل استخدام تطبيق Boyo3. باستخدام التطبيق، فإنك توافق على الالتزام بشروط وأحكام هذه الاتفاقية. إذا كنت لا توافق على الشروط، فلا يجوز لك استخدام التطبيق.

1. **عدم نشر محتوى غير مقبول**:
أنت توافق على عدم نشر أو تحميل أو مشاركة أي محتوى غير قانوني أو ضار أو تهديدي أو مسيء أو تشهيري أو فاحش أو غير مقبول بأي شكل من الأشكال. ويشمل ذلك المحتوى المتعلق بالإعلانات غير اللائقة أو السلوكيات المتعلقة بالقوافل وسيارات الدفع الرباعي والدراجات النارية والمركبات أو الخدمات الأخرى الواردة في التطبيق.

2. **مسؤوليات المستخدم**:
أنت مسؤول عن أي محتوى تنشره على المنصة. قد يؤدي أي انتهاك لسياسة المحتوى إلى تعليق حسابك أو إنهائه.

3. **الإبلاغ والاعتدال**:
يمكن للمستخدمين الإبلاغ عن المحتوى غير اللائق أو المسيء. يحتفظ Boyo3 بالحق في إزالة مثل هذا المحتوى وحظر المستخدمين الذين وجد أنهم ينتهكون هذه الشروط في غضون 24 ساعة من تلقي التقرير.

4. **حظر وإزالة المستخدمين المسيئين**:
يسمح Boyo3 للمستخدمين بحظر المستخدمين الآخرين الذين يشاركون في تفاعلات مسيئة أو غير مرغوب فيها. كما يحتفظ التطبيق بالحق في إزالة المستخدمين الذين يشاركون في انتهاكات متكررة.

5. **الخصوصية**:
يخضع استخدام التطبيق لسياسة الخصوصية الخاصة بنا، والتي يمكن العثور عليها على: https://boyo3.com/en_us/privacy-policy-2/. باستخدام التطبيق، فإنك توافق على جمع المعلومات واستخدامها وفقًا لسياسة الخصوصية.

6. **التحديثات والتعديلات**:
قد يقوم Boyo3 بتحديث هذه الاتفاقية من وقت لآخر. يشكل الاستمرار في استخدام التطبيق بعد أي تغييرات قبولًا للاتفاقية المنقحة.

7. **حدود المسؤولية**:
يتم توفير التطبيق "كما هو" دون أي ضمانات من أي نوع. لن تكون Boyo3 مسؤولة عن أي أضرار ناجمة عن استخدام التطبيق، بما في ذلك، على سبيل المثال لا الحصر، فقدان البيانات أو المحتوى بسبب سوء الاستخدام.

بالنقر فوق "أوافق" أو استخدام تطبيق Boyo3، فإنك تقر بأنك قرأت وفهمت اتفاقية ترخيص المستخدم النهائي هذه وتوافق على الالتزام بشروطها.

شكرًا لك على استخدام Boyo3!'''

                          :'''End User License Agreement (EULA)

Please read this End User License Agreement carefully before using the Boyo3 application. By using the App, you agree to be bound by the terms and conditions of this Agreement. If you do not agree to the terms, you may not use the App.

1. **No Objectionable Content**:
   You agree not to post, upload, or share any content that is illegal, harmful, threatening, abusive, defamatory, obscene, or objectionable in any way. This includes content related to inappropriate ads or behavior related to caravans, 4x4 cars, motorcycles, and other vehicles or services featured in the app.

2. **User Responsibilities**:
   You are responsible for any content you post on the platform. Any violation of the content policy may result in suspension or termination of your account.

3. **Reporting and Moderation**:
   Users can report inappropriate or abusive content. Boyo3 reserves the right to remove such content and block users found violating these terms within 24 hours of receiving a report.

4. **Blocking and Removal of Abusive Users**:
   Boyo3 allows users to block other users who engage in abusive or unwanted interactions. The App also reserves the right to remove users who engage in repeated violations.

5. **Privacy**:
   The use of the App is subject to our Privacy Policy, which can be found at: https://boyo3.com/en_us/privacy-policy-2/. By using the App, you agree to the collection and use of information in accordance with the Privacy Policy.

6. **Updates and Modifications**:
   Boyo3 may update this Agreement from time to time. Continued use of the App following any changes constitutes acceptance of the revised Agreement.

7. **Limitation of Liability**:
   The App is provided "as is" without warranties of any kind. Boyo3 will not be responsible for any damages arising from the use of the App, including, but not limited to, loss of data or content due to misuse.

By clicking "I Agree" or using the Boyo3 application, you acknowledge that you have read and understood this EULA and agree to be bound by its terms.

Thank you for using Boyo3!''',

                    ),

                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[

                Expanded(
                  child: Text(
                    HomeCubit.get(context).isArabic
                        ? "اذا اردت نشر محتوي فأنت موافق على شروط وأحكام اتفاقية ترخيص المستخدم النهائي."
                        : 'If you want to publish content, you agree to the terms and conditions of the End User License Agreement.',

                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // ElevatedButton(
            //   onPressed: _isChecked
            //       ? () {
            //     context.pushNamed(Routes.loginScreen);
            //   }
            //       : null, // Disable button if not agreed
            //
            //   child:  Text(
            //     HomeCubit.get(context).isArabic
            //         ? "الاستمرار لتسجيل الدخول"
            //         : "Continue to Login",
            //     style: _isChecked ?TextStyles.font15MainRed : TextStyles.font15WhiteBold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  // Call this function when the user agrees to the EULA
  _storeUserAgreement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEulaAccepted', true);
  }
}