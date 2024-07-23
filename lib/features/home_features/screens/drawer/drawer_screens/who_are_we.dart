import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/widget/opinion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class WhoAreWeScreen extends StatelessWidget {
  WhoAreWeScreen({super.key});



  final List <String> clientNames=[
    "سفيري",
    "صفا الفخرى",
    "كريم جمال",
    "أحمد حسيني"
  ];
  final List <String> clientOpinions=[
    "هذه بعض التقييمات لموقع بيوع.كوم في الأمارات العربية المتحدة يرجي ملاحظة ان هذه هي آراء العملاء السابقين وقد تختلف تجربتك الشخصية",
    "خدمة عملاء ممتازة : كانت تجربتي مع فريق خدمة العملاء في بيوع.كوم رائعة . لقد كانوا متعاونين وودودين . وساعدوني في اختيار القافلة المناسبة وتوفير المعلومات اللازمة",
    "توصيل سريع : لقد اشتريت كرفاناََ من بيوع.كوم وتم توصيلة إلي باب منزلي خلال يومين فقط كان التسليم سريعاََ وسهلاََ , وتم تقديم القافلة في حالة ممتازة.",
    "خدمة ممتازة: قمت بحجز قطع غيار لسيارتي ذات الدفع الرباعي  من بيوع.كوم المتخصص في الخدمات , يتم تسليم القطع للبيع بالجملة وهى ذات جودة عالية.",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              HomeCubit
                  .get(context)
                  .isArabic ? "من نحن " : "Who are we ",
            ),
          ),
          body:Center(
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Boyo3Logo(),
                    Text(
                      HomeCubit.get(context).isArabic?"الافضل في المجال":"The best in the field",
                      style: TextStyles.font18MainRed
                    ),

                    verticalSpace(20),

                    Text(
                      HomeCubit.get(context).isArabic?"كن لا بد أن أوضح لك أن كل هذه الأفكار المغلوطة حول استنكار النشوة وتمجيد الألم نشأت بالفعل، وسأعرض لك التفاصيل لتكتشف حقيقة وأساس تلك السعادة البشرية، فلا أحد يرفض أو يكره أو يتجنب الشعور بالسعادة، ولكن بفضل هؤلاء الأشخاص الذين لا يدركون بأن السعادة لا بد أن نستشعرها بصورة أكثر عقلانية ومنطقية فيعرضهم هذا لمواجهة الظروف الأليمة، وأكرر بأنه لا يوجد من يرغب في الحب ونيل المنال ويتلذذ بالآلام، الألم هو الألم ولكن نتيجة لظروف ما قد تكمن السعاده فيما نتحمله من كد وأسي."

                          :"I must explain to you that all these false ideas about denouncing ecstasy and glorifying pain actually arose, and I will show you the details to discover the truth and basis of this human happiness. No one rejects, hates, or avoids the feeling of happiness, but thanks to these people who do not realize that happiness must To feel it in a more rational and logical way, this exposes them to facing painful circumstances, and I repeat that there is no one who desires love and attaining success and who enjoys pain. Pain is pain, but as a result of certain circumstances, happiness may lie in the toil and sorrow that we endure.",
                      style: TextStyles.font15BlackBold
                    ),

                    verticalSpace(20),
                    Text(
                      HomeCubit.get(context).isArabic?"العملاء الاوفياء":"Loyal customers",
                      style: TextStyles.font20MainRed
                    ),
                    verticalSpace(20),
                    Text(
                      HomeCubit.get(context).isArabic?"الآراء:":"Opinions:",
                      style: TextStyles.font18BlackBold
                    ),

                    verticalSpace(10),
                    CarouselSlider.builder(

                      options: CarouselOptions(
                        height: 200.h,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        aspectRatio: 15 / 14,
                        autoPlayCurve: Curves.linear,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                        viewportFraction: 1.00,
                      ),
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return OpinionsWidget(clientName: clientNames[index], clientOpinion: clientOpinions[index],);
                      }, itemCount: clientNames.length,
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
