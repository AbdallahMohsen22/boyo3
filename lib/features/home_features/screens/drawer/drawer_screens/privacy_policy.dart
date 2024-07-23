
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/text_widget.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HomeCubit.get(context).isArabic?"سياسة الخصوصية":"Privacy Policy"
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Boyo3Logo(),
                HeaderText(text: HomeCubit.get(context).isArabic?
                "سياسة الخصوصية"
                    :
                "privacy policy"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "نحن نولي اهتماماً كبيراً للحفاظ على سريتك ونلتزم بحماية خصوصية جميع الزوار والمشتركين في موقعنا الإلكتروني أو أي تطبيق نقدمه عبر متجر التطبيقات  والخدمات المقابلة المتاحة من خلال المنصة (نوضح فيما يلي سياسة الخصوصية لدينا والتي سنقوم من خلالها بمعالجة أي معلومات شخصية تقدمها إلينا. ويرجى العلم أننا سنخطرك في حالة تغيير الطريقة التي نعالج بها معلوماتك في أي وقت.يرجى قراءة سياسة الخصوصية هذه بعناية حيث أنها تتضمن معلومات هامة حول هويتنا والطريقة التي نقوم من خلالها بجمع معلوماتك وتخزينها واستخدامها ومشاركتها. توافق من خلال دخول المنصة أو استخدام خدماتنا أو الإشارة بطريقة أخرى إلى موافقتك، عند الاقتضاء، على جمع معلوماتك واستخدامها ونقلها على النحو المنصوص عليه في هذه السياسة. وفي حالة عدم قبولك لشروط هذه السياسة، يجب عليك عدم استخدام المنصة و/أو الخدمات. وتعد سياسة الخصوصية هذه مكملة للإخطارات وسياسات الخصوصية الأخرى وليست صادرة لإبطالها. سياسة الخصوصية هذه: (1) تنطبق على المنصة فقط وليس على المواقع الإلكترونية أو تطبيقات أي شركات أو مؤسسات أخرى؛ و(2) تتناول تحديداً التزاماتنا طبقاً للقوانين المحلية."
                    :
                "We take great care in maintaining your confidentiality and are committed to protecting the privacy of all visitors and subscribers to our website or any application we provide through the App Store (“Platform”) and corresponding services available through the Platform (“Services”). Below we set out our privacy policy under which we will process any personal information that you provide to us. Please note that we will notify you if we change the way we process your information at any time. Please read this Privacy Policy carefully as it contains important information about who we are and the way we collect, store, use and share your information. By accessing the Platform or using our Services or otherwise indicating your consent, where applicable, you consent to the collection, use and transfer of your information as set forth in this Policy. If you do not accept the terms of this Policy, you must not use the Platform and/or Services. This Privacy Policy supplements other notices and privacy policies and is not issued to supersede them. This Privacy Policy: (1) applies to the Platform only and not to the websites or applications of any other companies or organizations; and (2) specifically addresses our obligations under local laws."
                ),
                verticalSpace(10),


                //2
                HeaderText(text: HomeCubit.get(context).isArabic?
                "البيانات التي نجمعها عنك"
                    :
                "Data we collect about you"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "عند زيارة منصتنا أو إنشاء تسجيل دخول وكلمة مرور للحصول على الخدمات، قد يُطلب منك تقديم معلومات عن نفسك. وقد تتضمن تلك المعلومات: (1) اسمك وبيانات الاتصال الخاصة بك، ومن ضمنها عنوان البريد الإلكتروني ورقم الهاتف؛ (2) المعلومات التي يمكننا من خلالها التحقق من هويتك؛ (3) بيانات الموقع؛ (4) معلومات إعداد فواتيرك ومعلومات وتاريخ المعاملات والدفع؛ و(5) أي معلومات أخرى قد نطلبها من وقت لآخر لتقديم الخدمات والامتثال للقانون المعمول به. كما توافق، عند الاقتضاء، على جمع معلومات حول استخدامك للمنصة والخدمات والمعلومات من الرسائل والاتصالات التي ترسلها إلينا.يلزم تقديم هذه المعلومات حتى يتسنى لنا تقديم الخدمات إليك. وفي حالة عدم تقديمك لتلك المعلومات، فقد يؤدي ذلك إلى تأخرنا في تقديم الخدمات إليك أو منعنا من تقديمها.تُطَبَق سياسة الخصوصية هذه أيضاً عند دخول المنصة و/أو استخدام الخدمات عبر تكنولوجيا الأجهزة المحمولة (مثل الهواتف المتحركة أو الأجهزة اللوحية أو الأجهزة الأخرى). ما لم تكن قد اخترت عدم الكشف عن هويتك من خلال إعدادات جهازك و/أو المنصة، يجوز لنا جمع هذه المعلومات واستخدامها تلقائياً إذا كنت تستخدم الخدمات وتدخل المنصة عبر تكنولوجيا الأجهزة المحمولة.يجوز تسجيل أو مراقبة المكالمات التي تتم بينك وبيننا أو بينك وبين أطراف خارجية من خلالنا (مثل وكلاء العقارات الذين تتواصل معهم بخصوص عقار من خلال نموذج أو رابط على موقعنا الإلكتروني، أو باستخدام معلومات الاتصال المتاحة على موقعنا) لأغراض ضمان الجودة وخدمة العملاء. ونستعين بمزود خدمة تابع لجهة خارجية من أجل تتبع المكالمات الهاتفية والرسائل النصية التي تتم بينك وبين المتخصصين العقاريين حتى نتمكن نحن والمتخصصون العقاريون من التعرف على تفاصيل معينة حول جهة الاتصال. وسنتلقى في حينه نحن ومزودي الخدمة التابعين لنا خلال هذه العملية بيانات حول مكالمتك أو رسالتك النصية ويخزنونها، بما في ذلك تاريخ ووقت المكالمة أو الرسالة النصية ورقم هاتفك ومحتوى الرسالة النصية. يتم منحك ترخيصًا محدودًا فقط لأغراض عرض المواد الموجودة على هذا الموقع"
                    :
                "When you visit our Platform or create a login and password to access the Services, you may be asked to provide information about yourself. This information may include: (1) your name and contact information, including email address and phone number; (2) information by which we can verify your identity; (3) location data; (4) your billing information, transaction and payment information and history; and (5) any other information we may require from time to time to provide the Services and comply with applicable law. You also consent, where applicable, to us collecting information about your use of the Platform and the Services and information from messages and communications you send to us. This information is required in order for us to provide services to you. If you do not provide this information, this may result in us delaying or preventing us from providing services to you.This Privacy Policy also applies when you access the Platform and/or use the Services via mobile technology (such as mobile phones, tablets or other devices). Unless you have chosen not to disclose your identity through your device and/or Platform settings, we may collect and use this information automatically if you use the Services and access the Platform via mobile technology. Calls made between you and us or between you and third parties through us (such as estate agents you contact about a property through a form or link on our website, or using contact information available on our website) may be recorded or monitored for the purposes of ensuring quality and customer service. We use a third-party service provider to track phone calls and text messages between you and the real estate professional so that we and the real estate professional can understand certain details about the contact. During this process, we and our service providers will receive and store data about your call or text message, including the date and time of the call or text message, your phone number, and the content of the text message. You are granted a limited license only for purposes of viewing the materials on this Site."
                ),
                verticalSpace(10),



                ///3
                HeaderText(text: HomeCubit.get(context).isArabic?
                "الجهات التي نشارك معلوماتك الشخصية معها"
                    :
                "Who we share your personal information with"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "يجوز لنا ولشركات أخرى تابعة لمجموعتنا معالجة معلوماتك الشخصية (التي تتضمن اسمك وعنوانك وأي تفاصيل أخرى تقدمها لنا وتهمك كفرد). وستقوم كل شركة تابعة لمجموعتنا ومصرح لها بمعالجة معلوماتك بمعالجة تلك البيانات وفقاً لسياسة الخصوصية هذه.كما يجوز لنا مشاركة معلوماتك مع: (1) جهات خارجية نستعين بها للمساعدة في تقديم منتجاتنا وخدماتنا إليك (مثل مقدمو خدمات الدفع)؛ (2) جهات خارجية أخرى نستعين بها لمساعدتنا في إدارة أعمالنا (مثل وكالات التسويق أو مستضيفو مواقع الانترنت)؛ و(3) الجهات الخارجية المعتمدة لديك (مثل مواقع التواصل الاجتماعي التي تختارها لربط حسابك أو مقدمي خدمات الدفع الخارجيين).نطالب جميع الجهات الخارجية باحترام أمان بياناتك الشخصية والتعامل معها طبقاً للقانون. ولا نسمح لمقدمي الخدمات الخارجيين لدينا باستغلال بياناتك الشخصية لتحقيق أغراضهم الخاصة، حيث لا نسمح لهم إلا بمعالجة بياناتك الشخصية لأغراض محددة ووفقاً لتعليماتنا.يجوز لنا استعمال او مشاركة المعلومات التي تقدمها لنا لو تطلب منا الكشف عن معلوماتك أو مشاركتها بهدف الامتثال لأي التزام قانوني أو تنظيمي أو من أجل فرض أي التزام عليك أو لحماية حقوقنا وحقوق الشركات التابعة لنا. وقد يتضمن ذلك تبادل المعلومات مع شركات ومؤسسات أخرى لأغراض الحماية والوقاية من الاحتيال.قد نحتاج أيضاً إلى مشاركة بعض المعلومات الشخصية مع شركاتنا التابعة والفرعية والأطراف الخارجية (مثل وكلاء العقارات الذين يستخدمون المنصة) أو أثناء إعادة هيكلة شركتنا. وعادةً ما تكون المعلومات الشخصية مجهولة المصدر، إلا أن ذلك قد لا يكون ممكناً بصفة دائمة."
                    :
                "We and other companies in our group may process your personal information (which includes your name, address and any other details you provide to us that relate to you as an individual). Each of our group companies authorized to process your information will process that data in accordance with this privacy policy.We may also share your information with: (i) third parties we use to help provide our products and services to you (such as payment service providers); (2) other third parties we use to help us operate our business (such as marketing agencies or website hosts); and (3) your authorized third parties (such as social media sites you choose to link your account or third-party payment service providers).We require all third parties to respect the security of your personal data and to treat it in accordance with the law. We do not allow our third-party service providers to exploit your personal data for their own purposes. We only allow them to process your personal data for specific purposes and in accordance with our instructions.We may use or share the information you provide to us if you require us to disclose or share your information in order to comply with any legal or regulatory obligation or in order to impose any obligation on you or to protect our rights and the rights of our affiliates. This may include exchanging information with other companies and organizations for fraud protection and prevention purposes. We may also need to share certain personal information with our subsidiaries, affiliates and third parties (such as real estate agents who use the Platform) or during the restructuring of our company. Personal information is usually anonymous, but this may not always be possible."
                ),
                verticalSpace(10),

                //4
                HeaderText(text: HomeCubit.get(context).isArabic?
                "الغرض من المعالجة"
                    :
                "Purpose of processing"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "سنستطيع من خلال معرفة معلوماتك أن نمكنك من الوصول إلى أقسام معينة من المنصة تناسب اهتماماتك وتسمح لنا بتزويدك بالخدمات التي تحتاجها.سنستخدم معلوماتك لغرض تلبية طلبات الخدمة التي قدمتها ومعالجة أي معاملات أخرى مصرح بها أو أجريتها معنا، وإبلاغك بالعروض الخاصة وتقديم أية معلومات تسويقية أخرى لك نعتقد أنك قد تجدها مهمة، أو تنفيذ خدمات أو إجراء بحوث/تطوير للعملاء.يجوز لنا استخدام معلوماتك للتواصل معك للحصول على آرائك بشأن المنصة والخدمات وشركتنا، ولإخطارك بالتغييرات أو التطورات التي تطرأ على المنصة والخدمات وشركتنا."
                    :
                "By knowing your information, we will be able to enable you to access certain sections of the platform that suit your interests and allow us to provide you with the services you need..We will use your information for the purpose of fulfilling service requests made by you, processing any other transactions authorized or conducted by you with us, informing you of special offers and providing you with any other marketing information that we think you may find interesting, carrying out services or conducting customer research/development. We may use your information to contact you to get your opinions about the Platform, the Services and our company, and to notify you about changes or developments to the Platform, the Services and our company."
                ),
                verticalSpace(10),

                //5
                HeaderText(text: HomeCubit.get(context).isArabic?
                "الإفصاح عن المعلومات"
                    :
                "Disclosure of information"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "في حالة تعيين مصفٍ أو مدير تصفية أو حارس قضائي علينا أو على جميع أصولنا أو أي جزء منها، وهو أمر غير محتمل الحدوث، يجوز لأخصائي الإعسار الممارس نقل معلوماتك إلى أي مشترٍ خارجي للشركة بشرط أن يتعهد المشتري باستخدام معلوماتك للأغراض ذاته المنصوص عليها في هذه السياسة. كما نتعهد بعدم تقديم معلوماتك الشخصية إلى أطراف خارجية إلا بما يتوافق مع هذه السياسة."
                    :
                "In the unlikely event that a liquidator, liquidation administrator or receiver is appointed over us or all or any part of our assets, the insolvency practitioner may transfer your information to any third party purchaser of the company provided that The buyer undertakes to use your information for the same purposes as set out in this policy. We also undertake not to provide your personal information to third parties except in accordance with this policy."
                ),
                verticalSpace(10),

                //6

                HeaderText(text: HomeCubit.get(context).isArabic?
                "ملفات تعريف الارتباط"
                    :
                "Cookies"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "يجوز لنا أن نرسل ملفاً صغيراً إلى جهاز الكمبيوتر أو الجهاز الخاص بك عندما تزور موقعنا الإلكتروني (). وسيمكننا ذلك من التعرف على جهاز الكمبيوتر الخاص بك، وتتبع سلوكك على موقعنا الإلكتروني وتحديد مجالات اهتمامك الخاصة من أجل تخصيص تجربتك على هذا الموقع وتعزيزها. يجوز لنا استخدام ملفات تعريف الارتباط لجمع البيانات الشخصية وتخزينها، كما نربط المعلومات المخزّنة باستخدام ملفات تعريف الارتباط بالبيانات الشخصية التي تزودنا بها. ويمكنك ضبط إعدادات متصفحك لرفض ملفات تعريف الارتباط، ولكن هذا قد يمنعك من استخدام أجزاء معينة من المنصة.إذا شاركت أو استفسرت عن أي عميل محتمل أو إحالة أو خدمة مماثلة قد نقدمها، يجوز لنا استخدام المعلومات التي ترسلها، بالإضافة إلى البيانات الأخرى التي قد تكون لدينا أو نحصل عليها من مصادر أخرى، في تحديد أي من المتخصصين المشاركين لدينا قد يكون مستعد وقادر و/أو مؤهل لتلبية احتياجاتك أو اهتماماتك المحتملة ومساعدتهم هم أو غيرهم في القيام بذلك. ويجوز لنا إعادة توجيه المعلومات المتعلقة بك إلى متخصص معين أو مشاركتها مع، وقد تتضمن هذه المعلومات تلك المعلومات بالإضافة إلى المعلومات الشخصية التي حصلنا عليها من خلال نموذج التسجيل الخاص بنا أو غير ذلك. ويجوز لهؤلاء المتخصصين أو الشركات التابعة لهم أو مقاوليهم أو معلنيهم أو وكلائهم أو غيرهم من الأشخاص المحددين استخدام هذه المعلومات والتواصل معك فيما يتعلق باحتياجاتك أو اهتماماتك المحتملة، كما قد نفعل نحن. ويُقصد بمصطلح المتخصص أو المتخصصين الأفراد والشركات والمنظمات الأخرى أو الأشخاص الذين يعملون كمتخصصين عقاريين أو يشاركون بطريقة أخرى في أعمال ذات صلة بالمنصة.يستخدم الموردون الخارجيون، بما في ذلك جوجل وفيسبوك، ملفات تعريف الارتباط لعرض الإعلانات بناءً على زيارات المستخدم السابقة للمنصة. ويتيح استخدام جوجل وفيسبوك لملفات تعريف الارتباط (ملف تعريف الارتباط دارت (DART) في حالة جوجل) لهم ولشركائهم عرض الإعلانات للمستخدمين بناءً على زياراتهم للمنصة و/أو المواقع الأخرى على الإنترنت. ويجوز للمستخدمين إلغاء الاشتراك في (1) ملف تعريف الارتباط دارت من خلال زيارة الموقع الإلكتروني لجوجل؛ (2) وملفات تعريف الارتباط الخاصة بفيسبوك من خلال زيارة صفحة تفضيلات الإعلانات على فيسبوك."
                    :
                "We may send a small file to your computer or device when you visit our website (“cookie”). This will enable us to recognize your computer, track your behavior on our website and identify your specific areas of interest in order to personalize and enhance your experience on this website. We may use cookies to collect and store personal data, and we link information stored using cookies to personal data you provide to us. You can adjust your browser settings to refuse cookies, but this may prevent you from using certain parts of the Platform.If you engage or inquire about any lead, referral or similar service we may provide, we may use the information you submit, as well as other data we may have or obtain from other sources, in determining which of our participating professionals may be willing, able and /or qualified to address your potential needs or interests and assist them or others in doing so. We may forward information about you to or share it with a particular professional, and this information may include that information in addition to personal information we obtain through our registration form or otherwise. These professionals, their affiliates, contractors, advertisers, agents or other identified persons may use this information and contact you regarding your potential needs or interests, as we may do. “Professional or Professionals” means individuals, companies, other organizations or persons who act as real estate professionals or are otherwise engaged in business related to the Platform.Third-party vendors, including Google and Facebook, use cookies to serve ads based on a user's previous visits to the platform. Google and Facebook's use of cookies (the DART cookie in Google's case) allows them and their partners to serve ads to users based on their visits to the Platform and/or other sites on the Internet. Users may opt out of (1) the DART cookie by visiting the Google website; (2) and Facebook cookies by visiting the Facebook Ad Preferences page."
                ),
               verticalSpace(10),

                //7

                HeaderText(text: HomeCubit.get(context).isArabic?
                "التدابير الأمنية"
                    :
                "Security measures"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "لقد نفذنا سياسات وقواعد وتدابير أمنية لحماية البيانات الشخصية التي نمتلكها من الوصول غير المصرح له أو الاستخدام والكشف غير الملائم أو التدمير غير المصرح له أو الفقد العرضي. توجد لدينا أيضاً إجراءات مطبقة للتعامل مع أي خرق مشتبه به للبيانات. وسنبلغك أنت وأي جهة تنظيمية أو سلطة معنية بأي خرق أمني مشتبه به للبيانات عندما يُطلب منا قانوناً القيام بذلك. أنت وحدك مسؤول عن الحفاظ على سرية كلمة المرور وتفاصيل الحسابات الأخرى الخاصة بك. وإذا كانت لديك مخاوف بشأن كلمة مرورك أو تفاصيل حسابك أو كنت تشك في أي استخدام غير مصرح له لحسابك، فيجب عليك التواصل معنا على الفور. ويمكننا إلغاء تنشيط حسابك أو تعليقه في أي وقت."
                    :
                "We have implemented security policies, rules and measures to protect the personal data we hold from unauthorized access, inappropriate use and disclosure, unauthorized destruction or accidental loss.We also have procedures in place to deal with any suspected data breach. We will notify you and any relevant regulator or authority of any suspected data security breach when we are legally required to do so.You are solely responsible for maintaining the confidentiality of your password and other account details. If you have concerns about your password or account details or suspect any unauthorized use of your account, you must contact us immediately. We may deactivate or suspend your account at any time."
                ),
                verticalSpace(10),

                //8

                HeaderText(text: HomeCubit.get(context).isArabic?
                "الوصول إلى المعلومات"
                    :
                "Access to information"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "يمكنك أن تسألنا عما إذا كنا نخزن معلومات شخصية عنك عن طريق مراسلتنا عبر البريد الإلكتروني: boyo3.com، وسنقدم لك، إذا كنت ترغب في ذلك وعند دفع رسوم قدرها 50 درهماً إماراتياً، سنزودك بنسخة من البيانات الشخصية التي نحتفظ بها عن طريق البريد الإلكتروني. يجوز لنا أن نطلب إثباتاً لهويتك قبل تقديم أية معلومات ونحتفظ بالحق في رفض تقديم المعلومات المطلوبة إذا لم تثبت هويتك."
                    :
                "You can ask us whether we store personal information about you by emailing us at: boyo3.com We will, if you wish and upon payment of a fee of AED 50, provide you with a copy of the personal data we hold by email. We may request proof of your identity before providing any information and we reserve the right to refuse to provide requested information if you do not prove your identity."
                ),
                verticalSpace(10),

                //9

                HeaderText(text: HomeCubit.get(context).isArabic?
                "طلب حذف البيانات"
                    :
                "Request to delete data"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "يمكنك طلب حذف بياناتك الشخصية عن طريق مراسلتنا عبر البريد الإلكتروني: boyo3.com. سنبذل قصارى جهدنا للامتثال لطلبات الحذف هذه، ولكن في ظروف معينة لن نتمكن من حذف بياناتك الشخصية، إذ قد نكون مطالبين بالاحتفاظ بها لأسباب قانونية و/أو تنظيمية و/أو متعلقة بالامتثال (وقد لا نتمكن من إبلاغك بسبب عدم قدرتنا على حذف هذه البيانات بسبب التزامات السرية التي قد نكون ملتزمين بها). يجوز لنا أن نطلب إثباتاً لهويتك قبل حذف أية معلومات ونحتفظ بالحق في رفض حذف المعلومات إذا لم تثبت هويتك. كما نحتفظ بالحق في فرض رسوم على أي طلب حذف يُقدَّم لنا."
                    :
                "You can request deletion of your personal data by emailing us at: boyo3.com. We will do our best to comply with such deletion requests, but in certain circumstances we will not be able to delete your personal data as we may be required to retain it for legal, regulatory and/or compliance reasons (and we may not be able to inform you why we are unable to delete such data due to Confidentiality obligations to which we may be bound). We may request proof of your identity before deleting any information and we reserve the right to refuse to delete information if you do not prove your identity. We also reserve the right to charge a fee for any deletion request submitted to us."
                ),
                verticalSpace(10),

                //10

                HeaderText(text: HomeCubit.get(context).isArabic?
                "الاستفسارات"
                    :
                "Inquiries"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "إذا كانت لديك أية استفسارات أو مخاوف تتعلق بسياسة الخصوصية هذه أو الطريقة التي نتعامل بها مع البيانات الشخصية، فيُرجى التواصل معنا على عنوان البريد الإلكتروني: boyo3.com. إذا كنت ترغب في أي وقت في أن نتوقف عن معالجة معلوماتك، فيُرجى إرسال رسالة إلى قسم الإدارة لدينا وإدراج عبارة إلغاء الاشتراك كعنوان للموضوع."
                    :
                "If you have any questions or concerns regarding this Privacy Policy or the way we handle personal data, please contact us at: boyo3.com. If at any time you would like us to stop processing your information, please send a message to our administration department and include “Opt Out” as the subject line."
                ),
               verticalSpace(10),


                //11

                HeaderText(text: HomeCubit.get(context).isArabic?
                "بيانات الدفع"
                    :
                "Payment data"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "نحتفظ بالحق في تغيير هذه السياسة من وقت لآخر. سنعرض سياستنا المحدَّثَة على منصتنا (منصاتنا)، ويُعد استمرارك في استخدام المنصة والدخول عليها بعد إجراء هذه التغييرات موافقة منك على الالتزام بأي تغيير نقوم به. وتقع على عاتقك مسؤولية التحقق من هذه السياسة من وقت لآخر للتحقق من هذه التغييرات المجراة."
                    :
                "We use a third-party service provider to process credit card payments. They have access to personal information necessary to perform their jobs, but may not use it for other purposes. Please note that we cannot access or retain any of your payment information."
                ),
                verticalSpace(10),

                //12

                HeaderText(text: HomeCubit.get(context).isArabic?
                "تحديثات السياسة"
                    :
                "Policy updates"
                ),
                ContentText(text: HomeCubit.get(context).isArabic?
                "نحتفظ بالحق في تغيير هذه السياسة من وقت لآخر. سنعرض سياستنا المحدَّثَة على منصتنا (منصاتنا)، ويُعد استمرارك في استخدام المنصة والدخول عليها بعد إجراء هذه التغييرات موافقة منك على الالتزام بأي تغيير نقوم به. وتقع على عاتقك مسؤولية التحقق من هذه السياسة من وقت لآخر للتحقق من هذه التغييرات المجراة."
                    :
                "We use a third-party service provider to process credit card payments. They have access to personal information necessary to perform their jobs, but may not use it for other purposes. Please note that we cannot access or retain any of your payment information."
                ),
                verticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
