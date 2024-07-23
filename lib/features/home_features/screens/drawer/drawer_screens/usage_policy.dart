import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/text_widget.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class UsagePolicy extends StatelessWidget {
  const UsagePolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HomeCubit.get(context).isArabic?"سياسة الأستخدام":"Usage policy"
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Boyo3Logo(),
                HeaderText(text: HomeCubit.get(context).isArabic?"شروط و احكام":"Terms of Service", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "عن طريق الوصول إلى موقع الويب على net.------.www، أنت توافق على الالتزام بشروط الخدمة هذه، وجميع القوانين واللوائح المعمول بها، وتوافق على أنك مسؤول عن الامتثال لأية قوانين محلية سارية. إذا كنت ُمنع من استخدام هذا الموقع أو لا توافق على أي من هذه الشروط، في الوصول إليه. المواد الواردة في هذا الموقع محمية بموجب قانون حقوق النشر والعلامات التجارية المعمول به."
                    :"By accessing the website at boyo3.Com, you agree to be bound by these Terms of Service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you are prohibited from using this website or do not agree to any of these terms, you are prohibited from accessing it. The materials contained on this website are protected by copyright and trademark law."),

                verticalSpace(10),

                HeaderText(text: HomeCubit.get(context).isArabic?"استخدام الترخيص":"License to Use", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "تم منح الإذن لتنزيل نسخة واحدة من المواد (المعلومات أو البرامج) مؤقت على موقع بيوع الشخصي وغري التجاري فقط. هذا هو منح الترخيص، وليس نقل الملكية، بموجب هذا الترخيص لا يجوز لك:"
                    :"Permission is granted to temporarily download one copy of the materials (information or software) on the personal and non-commercial website of [insert website name]. This is the grant of a license, not a transfer of ownership. Under this license, you may not:"),


                verticalSpace(10),
                HeaderText(text: HomeCubit.get(context).isArabic?"تعديل أو نسخ المواد":"Modify or copy the materials", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                    "استخدام المواد لأي غرض تجاري، أو لأي عرض عام (تجاري أو غري تجاري)؛ محاولة فك أو عكس هندسة أي برنامج موجود على موقع بيوع؛ إزالة أي حقوق نشر أو تدوينات ملكية أخرى من المواد؛ أو نقل المواد إلى شخص آخر أو “نسخ” المواد على أي خادم آخر.ً من هذه القيود، وقد يتم ًا إذا انتهكت أي ينتهي هذا الترخيص تلقائي إنهاؤه بواسطة بيوع في أي وقت. عند إنهاء عرضك لهذه المواد أو عند إنهاء هذا الترخيص، يجب عليك تدمري أي مواد تم تنزيلها في حوزتك سواء بتنسيق إلكتروني أو مطبوع."
                    :
                    "Use the materials for any commercial purpose or for any public display (commercial or non-commercial) Attempt to decompile or reverse engineer any software contained on boyo3 Remove any copyright or other proprietary notations from the materials Transfer the materials to another person or mirror the materials on any other serverThis license shall automatically terminate if you violate any of these restrictions and may be terminated by [insert website name] at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession, whether in electronic or printed format."
                ),


                verticalSpace(10),
                HeaderText(text: HomeCubit.get(context).isArabic?"إخلاء المسؤولية":"Disclaimer", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                    "يتم توفري المواد الموجودة على موقع بيوع على أساس “كام هي”. لا يقوم بيوع بتقديم أي ضامنات، صريحة أو ضمنية، وينكر بموجبه وينفي جميع الضامنات الأخرى بما في ذلك، على سبيل المثال لا الحصر، الضامنات الضمنية أو شروط القابلية للتسويق أو الملاءمة لغرض معني أو عدم انتهاك الملكية الفكرية أو أي انتهاك آخر لحقوق الملكية. علاوة على ذلك، لا يضمن بيوع أو يقدم أي إقرارات بخصوص دقة أو نتائج محتملة أو موثوقية استخدام المواد على موقعه على الويب أو فيام يتعلق بهذه المواد أو بأي مواقع مرتبطة بهذا الموقع يمكن أن تتضمن المواد التي تظهر على موقع بيوع، أخطاء فنية أو مطبعية أو فوتوغرافية. لا يضمن بيوع أن تكون أي من المواد الموجودة على موقعه الإلكتروني دقيقة أو كاملة أو حديثة. يمكن لبيوع إجراء تغييرات على المواد الموجودة على موقعه الإلكتروني في أي وقت دون إشعار مسبق. ومع ذلك، فإن بيوع لا يلتزم بتحديث المواد."
                    :
                    "The materials on boyo3 are provided on an as is basis.boyo3 makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Furthermore, boyo3 does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to this site. The materials appearing on boyo3 could include technical, typographical, or photographic errors. boyo3 does not warrant that any of the materials on its website are accurate, complete, or current. Boyo3 may make changes to the materials contained on its website at any time without notice. However, boyo3 does not make any commitment to update the materials."
                ),



                verticalSpace(10),
                HeaderText(text: HomeCubit.get(context).isArabic?"القيود":"Limitations", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                    "لن يتحمل بيوع أو موردوه بأي حال من الأحوال أي أضرار (بما في ذلك، على سبيل المثال لا الحصر، الأضرار الناجمة عن فقدان البيانات أو الربح، أو بسبب انقطاع العمل) الناشئة عن استخدام أو عدم القدرة على استخدام المواد الموجودة على موقع بيوع، حتى إذا تم إخطار بيوع أو ممثل معتمد شفهيا أو كتابيا باحتمال حدوث هذا الضرر. ً نظرا لأن بعض الولايات القضائية لا تسمح بفرض قيود على الضامنات الضمنية أو قيود المسؤولية عن الأضرار التبعية أو العرضية، فقد لا تنطبق هذه القيود عليك"
                    :
                    "In no event shall boyo3 or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on boyo3's website, even if boyo3 or a boyo3authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you."
                ),


                verticalSpace(10),
                HeaderText(text: HomeCubit.get(context).isArabic?"دقة المواد":"Accuracy of Materials", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                    "يمكن أن تتضمن المواد التي تظهر على موقع بيوع، أخطاء فنية أو مطبعية أو فوتوغرافية. لا يضمن بيوع أن تكون أي من المواد الموجودة على موقعه الإلكتروني دقيقة أو كاملة أو حديثة. يمكن لبيوع إجراء تغييرات على المواد الموجودة على موقعه الإلكتروني في أي وقت دون إشعار مسبق. ومع ذلك، فإن بيوع لا يلتزم بتحديث المواد."
                    :
                    "The materials appearing on boyo3's website could include technical, typographical, or photographic errors. boyo3 does not warrant that any of the materials on its website are accurate, complete, or current. [insert website name] may make changes to the materials contained on its website at any time without notice. However, boyo3 does not make any commitment to update the materials."
                ),


                verticalSpace(10),
                HeaderText(text: HomeCubit.get(context).isArabic?"الروابط ":"Links", ),
                ContentText(text: HomeCubit.get(context).isArabic?
                    "لم يقم بيوع بمراجعة جميع المواقع المرتبطة بموقعه وليس مسؤولاً عن محتويات أي موقع مرتبط. إدراج أي رابط لا يعني موافقة بيوع على الموقع. يكون استخدام أي موقع مرتبط على عاتق المستخدم."
                    :
                "boyo3 has not reviewed all of the sites linked to its website and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by boyo3of the site. Use of any such linked website is at the user's own risk."
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
