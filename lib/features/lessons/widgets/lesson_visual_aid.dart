import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';

enum LessonVisualKind {
  numberLine,
  fraction,
  pattern,
  venn,
  triangle,
  ratio,
  percent,
  geometry,
  transform,
  statistics,
  probability,
  measurement,
  algebra,
  function,
  scientific,
  histogram,
  pie,
  boxPlot,
  stemLeaf,
  probabilityMeter,
  sampling,
  compositeArea,
  lineGraph,
  squareGrid,
  angleDiagram,
  symmetryDiagram,
  coordinatePlane,
}

const _numberLineLessons = <String>{
  'rational-numbers-intro',
  'compare-rational',
  'estimate-square-roots',
  'irrational-representation',
  'inequalities',
  'solve-inequalities',
};

const _fractionLessons = <String>{
  'multiply-rational',
  'divide-rational',
  'add-subtract-like-denominators',
  'add-subtract-rational',
  'powers',
  'scientific-notation',
  'square-roots',
};

const _patternLessons = <String>{
  'pattern-strategy',
  'sequences',
};

const _vennLessons = <String>{
  'venn-strategy',
  'real-numbers',
};

const _triangleLessons = <String>{
  'pythagorean-theorem',
  'pythagorean-applications',
  'coordinate-distance',
};

const _ratioLessons = <String>{
  'proportional-relationships',
  'rate-of-change',
  'constant-rate',
  'solve-proportions',
  'drawing-strategy',
  'similar-polygons',
  'scale-up-down',
  'indirect-measurement',
};

const _percentLessons = <String>{
  'mental-percent',
  'percent-estimation',
  'reasonableness-strategy',
  'percent-equation',
  'percent-change',
};

const _geometryLessons = <String>{
  'angles-lines',
  'logical-reasoning',
  'polygons-angles',
  'congruent-polygons',
  'symmetry',
};

const _transformLessons = <String>{
  'reflection',
  'translation',
  'rotation',
};

const _statisticsLessons = <String>{
  'table-strategy',
  'histograms',
  'circle-sectors',
  'central-tendency-range',
  'dispersion',
  'box-plot',
  'stem-leaf',
  'choose-display',
};

const _probabilityLessons = <String>{
  'count-outcomes',
  'compound-events',
  'theoretical-experimental',
  'represent-problem',
  'sampling-prediction',
};

const _measurementLessons = <String>{
  'composite-areas',
  'simpler-problem-strategy',
  'three-dimensional-shapes',
  'prism-cylinder-volume',
  'pyramid-cone-volume',
  'prism-cylinder-surface-area',
  'pyramid-surface-area',
};

const _algebraLessons = <String>{
  'simplify-expressions',
  'two-step-equations',
  'write-two-step-equations',
  'variables-both-sides',
  'guess-check-strategy',
};

const _functionLessons = <String>{
  'functions',
  'graph-linear-functions',
  'slope',
  'direct-variation',
  'model-strategy',
};

LessonVisualKind? visualKindForLesson(String lessonId) {
  if (lessonId == 'powers' || lessonId == 'square-roots') {
    return LessonVisualKind.squareGrid;
  }
  if (lessonId == 'angles-lines' || lessonId == 'logical-reasoning') {
    return LessonVisualKind.angleDiagram;
  }
  if (lessonId == 'congruent-polygons' || lessonId == 'symmetry') {
    return LessonVisualKind.symmetryDiagram;
  }
  if (lessonId == 'coordinate-distance') {
    return LessonVisualKind.coordinatePlane;
  }
  if (lessonId == 'scientific-notation') return LessonVisualKind.scientific;
  if (lessonId == 'histograms') return LessonVisualKind.histogram;
  if (lessonId == 'circle-sectors') return LessonVisualKind.pie;
  if (lessonId == 'box-plot') return LessonVisualKind.boxPlot;
  if (lessonId == 'stem-leaf') return LessonVisualKind.stemLeaf;
  if (lessonId == 'theoretical-experimental') {
    return LessonVisualKind.probabilityMeter;
  }
  if (lessonId == 'sampling-prediction') return LessonVisualKind.sampling;
  if (lessonId == 'composite-areas' ||
      lessonId == 'simpler-problem-strategy') {
    return LessonVisualKind.compositeArea;
  }
  if (lessonId == 'graph-linear-functions' ||
      lessonId == 'slope' ||
      lessonId == 'direct-variation') {
    return LessonVisualKind.lineGraph;
  }
  if (_numberLineLessons.contains(lessonId)) return LessonVisualKind.numberLine;
  if (_fractionLessons.contains(lessonId)) return LessonVisualKind.fraction;
  if (_patternLessons.contains(lessonId)) return LessonVisualKind.pattern;
  if (_vennLessons.contains(lessonId)) return LessonVisualKind.venn;
  if (_triangleLessons.contains(lessonId)) return LessonVisualKind.triangle;
  if (_ratioLessons.contains(lessonId)) return LessonVisualKind.ratio;
  if (_percentLessons.contains(lessonId)) return LessonVisualKind.percent;
  if (_geometryLessons.contains(lessonId)) return LessonVisualKind.geometry;
  if (_transformLessons.contains(lessonId)) return LessonVisualKind.transform;
  if (_statisticsLessons.contains(lessonId)) return LessonVisualKind.statistics;
  if (_probabilityLessons.contains(lessonId)) return LessonVisualKind.probability;
  if (_measurementLessons.contains(lessonId)) return LessonVisualKind.measurement;
  if (_algebraLessons.contains(lessonId)) return LessonVisualKind.algebra;
  if (_functionLessons.contains(lessonId)) return LessonVisualKind.function;
  return null;
}

const _lessonSpecificVisualVariants = <String>{
  'compare-rational',
  'multiply-rational',
  'divide-rational',
  'add-subtract-like-denominators',
  'add-subtract-rational',
  'estimate-square-roots',
  'irrational-representation',
  'inequalities',
  'solve-inequalities',
  'square-roots',
  'real-numbers',
  'pythagorean-applications',
  'rate-of-change',
  'constant-rate',
  'solve-proportions',
  'drawing-strategy',
  'similar-polygons',
  'scale-up-down',
  'indirect-measurement',
  'percent-estimation',
  'reasonableness-strategy',
  'percent-equation',
  'percent-change',
  'logical-reasoning',
  'congruent-polygons',
  'translation',
  'rotation',
  'table-strategy',
  'central-tendency-range',
  'dispersion',
  'choose-display',
  'compound-events',
  'represent-problem',
  'simpler-problem-strategy',
  'three-dimensional-shapes',
  'prism-cylinder-volume',
  'pyramid-cone-volume',
  'prism-cylinder-surface-area',
  'pyramid-surface-area',
  'simplify-expressions',
  'write-two-step-equations',
  'variables-both-sides',
  'guess-check-strategy',
  'model-strategy',
  'graph-linear-functions',
  'direct-variation',
};

String visualVariantKeyForLesson(String lessonId) {
  final kind = visualKindForLesson(lessonId);
  if (kind == null) return 'none';

  if (_lessonSpecificVisualVariants.contains(lessonId)) {
    return '${kind.name}:$lessonId';
  }

  return kind.name;
}

bool hasVisualAidForLesson(String lessonId) =>
    visualKindForLesson(lessonId) != null;

class LessonVisualAid extends StatelessWidget {
  const LessonVisualAid({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  Widget build(BuildContext context) {
    final kind = visualKindForLesson(lessonId);
    if (kind == null) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final text =
        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final muted =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final surface =
        isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.visibility_rounded,
                  color: AppColors.primary,
                  size: 21,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'شاهد الفكرة قبل حفظ القاعدة',
                  style: TextStyle(
                    color: text,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _captionForLesson(kind),
            style: TextStyle(
              color: muted,
              height: 1.65,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 2.05,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(22),
              ),
              child: CustomPaint(
                painter: _LessonVisualPainter(kind, lessonId),
                child: const SizedBox.expand(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'ماذا تلاحظ؟',
            style: TextStyle(
              color: text,
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          ..._insightsForLesson(kind).map(
            (insight) => Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_left_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      insight,
                      style: TextStyle(
                        color: muted,
                        height: 1.55,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.public_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أين أرى هذه الفكرة في الحياة؟',
                        style: TextStyle(
                          color: text,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _realLifeExampleForLesson(kind),
                        style: TextStyle(
                          color: muted,
                          height: 1.55,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _captionForLesson(LessonVisualKind kind) {
    switch (lessonId) {
      case 'rational-numbers-intro':
        return 'شاهد كيف تعيش الأعداد الموجبة والسالبة والكسور معًا على خط واحد.';
      case 'compare-rational':
        return 'ضع العددين على خط الأعداد؛ العدد الواقع أكثر إلى اليمين هو الأكبر.';
      case 'multiply-rational':
        return 'افصل بين مهمتين: اضرب القيم أولًا، ثم حدّد إشارة الناتج من إشارات العوامل.';
      case 'divide-rational':
        return 'القسمة على كسر تتحول إلى ضرب في مقلوبه؛ الرسم يريك التحول قبل الحساب.';
      case 'add-subtract-like-denominators':
        return 'عندما تكون الأجزاء بالحجم نفسه نجمع عدد الأجزاء فقط ويبقى المقام نفسه.';
      case 'add-subtract-rational':
        return 'عندما تختلف المقامات، وحّد حجم الأجزاء أولًا ثم اجمع أو اطرح.';
      case 'pattern-strategy':
        return 'قارن كل حد بالذي قبله حتى ترى التغير المتكرر.';
      case 'powers':
        return 'القوة تعني تكرار الضرب؛ لا تخلط بين 3² و3×2.';
      case 'scientific-notation':
        return 'حرّك الفاصلة حتى يصبح العدد بين 1 و10، وعدّ عدد الحركات.';
      case 'square-roots':
        return 'الجذر التربيعي يسأل: ما طول ضلع مربع مساحته معلومة؟';
      case 'venn-strategy':
        return 'استخدم دوائر فن لتنظيم الشروط والمعلومات المشتركة قبل الحل.';
      case 'real-numbers':
        return 'صنّف العدد من المجموعة الأصغر إلى الأكبر: طبيعي، صحيح، نسبي أو غير نسبي.';
      case 'pythagorean-theorem':
        return 'المربعات على أضلاع المثلث القائم توضح لماذا a²+b²=c².';
      case 'pythagorean-applications':
        return 'حوّل الموقف الواقعي إلى مثلث قائم، ثم حدّد الوتر قبل الحساب.';
      case 'angles-lines':
        return 'ابدأ بعلاقة الخطوط ثم استخدم مجموع الزوايا المناسب.';
      case 'logical-reasoning':
        return 'التبرير ليس شكلًا؛ هو سلسلة: معطى ثم قاعدة ثم نتيجة.';
      case 'congruent-polygons':
        return 'طابق الرؤوس المتناظرة ثم قارن الأضلاع والزوايا بالترتيب نفسه.';
      case 'symmetry':
        return 'تخيّل طي الشكل حول المحور؛ إذا انطبق النصفان فهناك تماثل.';
      default:
        return _caption(kind);
    }
  }

  List<String> _insightsForLesson(LessonVisualKind kind) {
    switch (lessonId) {
      case 'multiply-rational':
        return const [
          'إشارة الناتج تعتمد على إشارتَي العددين، لا على حجمهما.',
          'إشارتان متماثلتان تعطيان موجبًا، ومختلفتان تعطيان سالبًا.',
          'بعد تحديد الإشارة اضرب القيم المطلقة بالطريقة المعتادة.',
        ];
      case 'divide-rational':
        return const [
          'لا تقسم البسط على البسط والمقام على المقام مباشرة.',
          'احتفظ بالكسر الأول، واقلب الثاني، ثم حوّل القسمة إلى ضرب.',
          'بسّط قبل أو بعد الضرب عندما يكون ذلك ممكنًا.',
        ];
      case 'add-subtract-like-denominators':
        return const [
          'المقام نفسه يعني أن حجم الأجزاء متساوٍ.',
          'اجمع أو اطرح البسط فقط.',
          'بسّط الناتج في النهاية إن أمكن.',
        ];
      case 'add-subtract-rational':
        return const [
          'لا يمكن جمع أجزاء بأحجام مختلفة مباشرة.',
          'ابحث عن مقام مشترك أولًا.',
          'بعد توحيد المقامات اجمع البسوط واترك المقام المشترك.',
        ];
      case 'powers':
        return const [
          'الأس يخبرك بعدد مرات استخدام الأساس عاملًا في الضرب.',
          '3² يعني 3×3 وليس 3×2.',
          'القيمة 3² يمكن رؤيتها كمساحة مربع ضلعُه 3.',
        ];
      case 'square-roots':
        return const [
          '√49 يبحث عن عدد إذا ضرب في نفسه أعطى 49.',
          'المربعات الكاملة مثل 1 و4 و9 و16 و25 تساعد على معرفة الجذور بسرعة.',
          'الجذر يعكس عملية التربيع.',
        ];
      case 'venn-strategy':
        return const [
          'اكتب كل شرط في منطقته المناسبة.',
          'ضع المعلومات المشتركة في منطقة التقاطع.',
          'الرسم يساعدك على منع تكرار الحالة أو نسيانها.',
        ];
      case 'real-numbers':
        return const [
          'كل عدد صحيح هو نسبي لأنه يمكن كتابته على صورة كسر.',
          'الأعداد غير النسبية لا تنتهي ولا تتكرر عشريًا بنمط ثابت.',
          'مجموعة الأعداد الحقيقية تضم النسبي وغير النسبي.',
        ];
      case 'pythagorean-theorem':
        return const [
          'العلاقة تعمل فقط في مثلث قائم.',
          'c يمثل الوتر وهو المقابل للزاوية القائمة.',
          'مساحة مربعي الضلعين القائمين تساوي مساحة مربع الوتر.',
        ];
      case 'pythagorean-applications':
        return const [
          'ارسم الموقف قبل التعويض في القانون.',
          'حدد أي طول هو الوتر من موقع الزاوية القائمة.',
          'تحقق أن الناتج مناسب للموقف والوحدة.',
        ];
      case 'logical-reasoning':
        return const [
          'كل نتيجة يجب أن تستند إلى قاعدة أو معطى.',
          'لا تعتمد على أن الرسم يبدو متوازيًا أو متساويًا.',
          'رتّب حجتك في خطوات قصيرة يمكن التحقق منها.',
        ];
      case 'congruent-polygons':
        return const [
          'التطابق يعني الشكل والحجم نفسيهما.',
          'ترتيب الحروف يحدد أي رأس يقابل الآخر.',
          'الأضلاع والزوايا المتناظرة تكون متساوية.',
        ];
      case 'symmetry':
        return const [
          'محور التماثل يقسم الشكل إلى صورتين متطابقتين.',
          'مرور خط بالمركز لا يكفي وحده.',
          'قد يكون للشكل محور واحد أو عدة محاور أو لا يوجد.',
        ];
      default:
        return _insights(kind);
    }
  }

  String _realLifeExampleForLesson(LessonVisualKind kind) {
    switch (lessonId) {
      case 'compare-rational':
        return 'في درجات الحرارة، -2° أدفأ من -5° لأنه يقع إلى يمينه على خط الأعداد.';
      case 'multiply-rational':
        return 'تغير بمقدار -3 يتكرر 4 مرات يمكن تمثيله بـ4×(-3)=-12.';
      case 'divide-rational':
        return 'إذا كان لديك 3/4 لتر وتريد تقسيمه إلى حصص مقدار كل منها 1/4 لتر، فالقسمة تخبرك بعدد الحصص.';
      case 'add-subtract-like-denominators':
        return 'أكلت 2/8 من بيتزا ثم 3/8 أخرى؛ الأجزاء بالحجم نفسه، لذلك المجموع 5/8.';
      case 'add-subtract-rational':
        return 'نصف كوب + ثلث كوب يحتاجان تحويلًا إلى أجزاء بالحجم نفسه قبل جمعهما.';
      case 'powers':
        return 'ترتيب 5 صفوف وكل صف فيه 5 مقاعد يعطي 5²=25 مقعدًا.';
      case 'square-roots':
        return 'إذا كانت مساحة بلاطة مربعة 64 سم²، فإن طول ضلعها √64=8 سم.';
      case 'pythagorean-theorem':
        return 'يمكن إيجاد طول قطر شاشة مستطيلة من ارتفاعها وعرضها إذا شكّلا مثلثًا قائمًا.';
      case 'pythagorean-applications':
        return 'سلم يصل من الأرض إلى أعلى جدار يشكل وترًا في مثلث قائم.';
      case 'logical-reasoning':
        return 'في مخطط هندسي، لا يكفي أن يبدو خطان متوازيين؛ تحتاج علامة أو قاعدة تثبت ذلك.';
      case 'congruent-polygons':
        return 'قطعتان صُنعتا بالقالب نفسه يجب أن تتطابقا في الشكل والحجم.';
      case 'symmetry':
        return 'واجهة مبنى متناظرة يمكن تقسيمها بمحور رأسي إلى نصفين متطابقين.';
      default:
        return _realLifeExample(kind);
    }
  }

  String _realLifeExample(LessonVisualKind kind) {
    switch (kind) {
      case LessonVisualKind.numberLine:
        return 'درجات الحرارة: -3° أبرد من -1° لأن -3 يقع أكثر إلى اليسار على خط الأعداد.';
      case LessonVisualKind.fraction:
        return 'تقسيم بيتزا إلى 4 أجزاء متساوية وأخذ 3 منها يمثل 3/4 بصورة مباشرة.';
      case LessonVisualKind.pattern:
        return 'زيادة الادخار كل أسبوع بمبلغ ثابت تصنع نمطًا يمكن استخدامه للتنبؤ بالمبلغ بعد عدة أسابيع.';
      case LessonVisualKind.venn:
        return 'طلاب يلعبون كرة القدم وطلاب يشاركون في السباحة؛ منطقة التداخل تمثل من يشاركون في النشاطين.';
      case LessonVisualKind.triangle:
        return 'سلم مسنود إلى جدار يصنع مثلثًا قائمًا: السلم هو الوتر ويمكن إيجاد الارتفاع بفيثاغورس.';
      case LessonVisualKind.ratio:
        return 'في وصفة تحتاج كوبين دقيق لكل كوب ماء، مضاعفة الوصفة تحافظ على النسبة نفسها.';
      case LessonVisualKind.percent:
        return 'خصم 25% من سعر منتج يعني أنك توفر ربع السعر الأصلي.';
      case LessonVisualKind.geometry:
        return 'زوايا الأبواب والبلاط وتصميم الغرف تعتمد على علاقات الزوايا والأشكال.';
      case LessonVisualKind.transform:
        return 'شعار منعكس في مرآة أو رمز تم تدويره في تصميم يوضح التحويلات الهندسية.';
      case LessonVisualKind.statistics:
        return 'درجات فصل كامل تصبح أسهل للفهم عندما تعرض في جدول أو رسم بدل قائمة طويلة.';
      case LessonVisualKind.probability:
        return 'اختيار لون ثم رقم يشبه تجربة ذات مرحلتين، وكل مسار في الشجرة يمثل نتيجة ممكنة.';
      case LessonVisualKind.measurement:
        return 'معرفة كمية الماء التي يملؤها خزان تحتاج الحجم، أما كمية الطلاء لتغطيته فتحتاج مساحة السطح.';
      case LessonVisualKind.algebra:
        return 'إذا دفعت مبلغًا ثابتًا ثم مبلغًا لكل ساعة، يمكن تمثيل التكلفة بمعادلة وحل المجهول.';
      case LessonVisualKind.function:
        return 'أجرة سيارة تبدأ بمبلغ ثابت ثم تزيد مع كل كيلومتر مثال واضح لدالة تربط المسافة بالتكلفة.';
      case LessonVisualKind.scientific:
        return 'المسافات الفلكية وأحجام الخلايا تستخدم الصيغة العلمية حتى لا نكتب أصفارًا كثيرة.';
      case LessonVisualKind.histogram:
        return 'تجميع أعمار مجموعة كبيرة في فئات 10–19 و20–29 يجعل توزيع الأعمار واضحًا بسرعة.';
      case LessonVisualKind.pie:
        return 'تقسيم مصروف شهري إلى طعام ونقل وادخار يمكن عرضه كقطاعات من دائرة واحدة.';
      case LessonVisualKind.boxPlot:
        return 'مقارنة درجات فصلين بالصندوق وطرفيه تكشف أي فصل أكثر استقرارًا وأيهما أكثر تشتتًا.';
      case LessonVisualKind.stemLeaf:
        return 'عرض درجات مثل 42 و45 و47 و51 و53 مع الاحتفاظ بالقيم الأصلية يناسب الساق والورقة.';
      case LessonVisualKind.probabilityMeter:
        return 'عملة عادلة تتوقع نظريًا 50% صورة، لكن في 100 رمية قد تظهر الصورة 47 مرة فعليًا.';
      case LessonVisualKind.sampling:
        return 'استطلاع رأي المدرسة يحتاج طلابًا من صفوف مختلفة، لا عينة من فصل واحد فقط.';
      case LessonVisualKind.compositeArea:
        return 'أرضية على شكل حرف L يمكن تقسيمها إلى مستطيلين لحساب كمية البلاط المطلوبة.';
      case LessonVisualKind.lineGraph:
        return 'الرسم الذي يوضح المسافة مع الزمن يكشف السرعة من ميل الخط.';
      case LessonVisualKind.squareGrid:
        return 'بلاط مربع 3×3 يعطي 9 قطع؛ المساحة 9 تعني أن طول الضلع 3.';
      case LessonVisualKind.angleDiagram:
        return 'زاويتان متجاورتان على طريق مستقيم مجموعهما 180°، لذلك معرفة إحداهما تكشف الأخرى.';
      case LessonVisualKind.symmetryDiagram:
        return 'الفراشة أو كثير من الشعارات تظهر تماثلًا حول محور يقسم الشكل إلى نصفين متقابلين.';
      case LessonVisualKind.coordinatePlane:
        return 'على خريطة شبكية، فرق الشوارع أفقيًا ورأسيًا يصنع مثلثًا، والمسافة المباشرة هي الوتر.';
    }
  }

  List<String> _insights(LessonVisualKind kind) {
    switch (kind) {
      case LessonVisualKind.numberLine:
        return const [
          'القيم تزداد كلما اتجهنا يمينًا وتقل كلما اتجهنا يسارًا.',
          'العدد السالب الأقرب إلى الصفر أكبر من السالب الأبعد عنه.',
          'تمثيل القيمة على الخط يساعدك على التحقق من المقارنة قبل الحساب.',
        ];
      case LessonVisualKind.fraction:
        return const [
          'المقام يحدد عدد الأجزاء المتساوية التي قُسم إليها الكل.',
          'البسط يحدد عدد الأجزاء التي نأخذها أو نتعامل معها.',
          'عندما تختلف أحجام الأجزاء نحتاج أولًا إلى توحيدها قبل الجمع أو الطرح.',
        ];
      case LessonVisualKind.pattern:
        return const [
          'لا تنظر إلى الحد الأخير فقط؛ قارن كل حد بالذي قبله.',
          'القاعدة الصحيحة يجب أن تعمل على أكثر من انتقال واحد.',
          'قد يكون النمط جمعًا أو طرحًا أو ضربًا أو تغيرًا منتظمًا آخر.',
        ];
      case LessonVisualKind.venn:
        return const [
          'كل دائرة تمثل مجموعة مختلفة.',
          'منطقة التداخل تمثل العناصر المشتركة بين المجموعتين.',
          'العناصر خارج التداخل تنتمي إلى مجموعة واحدة فقط.',
        ];
      case LessonVisualKind.triangle:
        return const [
          'الوتر يقابل الزاوية القائمة وهو أطول ضلع في المثلث القائم.',
          'الضلعان الآخران يصنعان الزاوية القائمة.',
          'إذا لم توجد زاوية قائمة فلا نستخدم علاقة فيثاغورس مباشرة.',
        ];
      case LessonVisualKind.ratio:
        return const [
          'كل صف يمثل زوجًا من القيم المتناظرة.',
          'إذا كان عامل التحويل نفسه في كل الصفوف فالعلاقة ثابتة.',
          'يمكن إيجاد قيمة مجهولة بتطبيق العامل نفسه على الصف الجديد.',
        ];
      case LessonVisualKind.percent:
        return const [
          'الكل دائمًا يمثل 100%.',
          '25% تعني ربع الكل، و50% تعني نصفه.',
          'قبل الحساب قدّر حجم الجزء المظلل لتعرف هل إجابتك منطقية.',
        ];
      case LessonVisualKind.geometry:
        return const [
          'قسّم الشكل إلى أجزاء مألوفة بدل محاولة فهمه دفعة واحدة.',
          'العلاقات بين الزوايا أهم من شكل الرسم نفسه.',
          'التناظر والتطابق والتشابه تحتاج تحديد الأجزاء المتناظرة بدقة.',
        ];
      case LessonVisualKind.transform:
        return const [
          'الشكل والحجم لا يتغيران في الانعكاس والانسحاب والدوران.',
          'الذي يتغير هو الموقع أو الاتجاه.',
          'قارن نقطة واحدة قبل التحويل وبعده لتفهم قاعدة التحويل.',
        ];
      case LessonVisualKind.statistics:
        return const [
          'ارتفاع العمود أو حجم القطاع يمثل مقدارًا من البيانات.',
          'التمثيل البصري يكشف التجمعات والفروق أسرع من القائمة الخام.',
          'اختر الرسم بحسب السؤال الذي تريد أن تجيب عنه، لا بحسب شكله.',
        ];
      case LessonVisualKind.probability:
        return const [
          'كل فرع يمثل اختيارًا ممكنًا في خطوة من التجربة.',
          'النهايات تمثل جميع النواتج الممكنة.',
          'عد النواتج الملائمة بعد التأكد أن الشجرة كاملة.',
        ];
      case LessonVisualKind.measurement:
        return const [
          'القاعدة والارتفاع يحددان كثيرًا من قوانين المساحة والحجم.',
          'الحجم يقيس ما بداخل المجسم، ومساحة السطح تقيس الغلاف الخارجي.',
          'قسّم الشكل المركب إلى مجسمات أو أشكال أبسط ثم اجمع النتائج.',
        ];
      case LessonVisualKind.algebra:
        return const [
          'المعادلة تبقى صحيحة فقط إذا حافظنا على توازن الطرفين.',
          'هدف الحل هو عزل المتغير وحده.',
          'استخدم العملية العكسية وأجرها على الطرفين معًا.',
        ];
      case LessonVisualKind.function:
        return const [
          'المدخل يمر بقاعدة واحدة ثم يعطي مخرجًا واحدًا.',
          'الجدول والرسم والمعادلة طرق مختلفة لوصف العلاقة نفسها.',
          'في الدالة الخطية يظهر معدل التغير كثبات في الميل.',
        ];
      case LessonVisualKind.scientific:
        return const [
          'اجعل العدد الأول بين 1 و10 قبل كتابة قوة 10.',
          'الحركة لليسار في عدد كبير تعطي أسًا موجبًا.',
          'الحركة لليمين في عدد صغير بين صفر و1 تعطي أسًا سالبًا.',
        ];
      case LessonVisualKind.histogram:
        return const [
          'الفئات متصلة لذلك أعمدة المدرج متجاورة.',
          'عرض العمود يمثل الفئة وارتفاعه يمثل التكرار.',
          'أعلى عمود يكشف الفئة الأكثر تكرارًا مباشرة.',
        ];
      case LessonVisualKind.pie:
        return const [
          'مجموع القطاعات يمثل 100% من البيانات.',
          'نصف الدائرة يساوي 50% وربعها يساوي 25%.',
          'زاوية القطاع = النسبة العشرية × 360°.',
        ];
      case LessonVisualKind.boxPlot:
        return const [
          'الصندوق نفسه يمثل النصف الأوسط من البيانات.',
          'الخط داخل الصندوق هو الوسيط.',
          'طول الصندوق والأطراف يساعد على مقارنة الانتشار.',
        ];
      case LessonVisualKind.stemLeaf:
        return const [
          'الساق تمثل الجزء الأكبر من العدد والورقة الرقم الأخير.',
          'كل ورقة تعطي قيمة أصلية كاملة عند جمعها مع ساقها.',
          'ترتيب الأوراق يجعل المركز والانتشار أسهل في القراءة.',
        ];
      case LessonVisualKind.probabilityMeter:
        return const [
          'النظري هو ما نتوقعه من نموذج الاحتمال.',
          'التجريبي هو ما ظهر فعلًا بعد تنفيذ التجربة.',
          'مع زيادة التجارب يميل التجريبي غالبًا إلى الاقتراب من النظري.',
        ];
      case LessonVisualKind.sampling:
        return const [
          'اختيار أفراد من أماكن مختلفة يقلل التحيز.',
          'العينة يجب أن تشبه المجتمع الذي نريد التنبؤ عنه.',
          'الحجم وحده لا يكفي إذا كانت العينة منحازة.',
        ];
      case LessonVisualKind.compositeArea:
        return const [
          'ابدأ بتحديد حدود الأشكال البسيطة داخل الشكل الكبير.',
          'احسب كل مساحة بقانونها ثم اجمعها أو اطرح الجزء المفقود.',
          'لا تجمع الأطوال عندما يكون المطلوب مساحة.',
        ];
      case LessonVisualKind.lineGraph:
        return const [
          'التغير الأفقي يسمى run والتغير الرأسي يسمى rise.',
          'الميل = rise ÷ run.',
          'الخط المستقيم يعني أن معدل التغير ثابت.',
        ];
      case LessonVisualKind.squareGrid:
        return const [
          'المربع 3×3 يحتوي 9 مربعات صغيرة، لذلك 3²=9.',
          'الجذر التربيعي يعكس السؤال: ما طول ضلع مربع مساحته معلومة؟',
          'إذا كانت المساحة 49 فطول الضلع 7 لأن 7×7=49.',
        ];
      case LessonVisualKind.angleDiagram:
        return const [
          'الخط المستقيم يصنع زاوية مجموعها 180°.',
          'إذا عرفت زاوية واحدة يمكنك إيجاد المجاورة بالطرح من 180°.',
          'علامة الزاوية القائمة تعني 90° ولا تعتمد على شكل الرسم فقط.',
        ];
      case LessonVisualKind.symmetryDiagram:
        return const [
          'في التطابق يجب أن يتساوى الشكل والحجم معًا.',
          'في التماثل يمكن طي الشكل على محور لينطبق النصفان.',
          'حدد النقاط أو الرؤوس المتناظرة قبل مقارنة الأطوال والزوايا.',
        ];
      case LessonVisualKind.coordinatePlane:
        return const [
          'الفرق الأفقي بين النقطتين يمثل ضلعًا في مثلث قائم.',
          'الفرق الرأسي يمثل الضلع الثاني.',
          'المسافة المباشرة بين النقطتين هي الوتر وتُحسب بفيثاغورس.',
        ];
    }
  }

  String _caption(LessonVisualKind kind) {
    switch (kind) {
      case LessonVisualKind.numberLine:
        return 'حدد مكان القيمة على خط الأعداد؛ الموقع غالبًا يشرح معنى الأكبر والأصغر والإشارة أفضل من الكلمات.';
      case LessonVisualKind.fraction:
        return 'تخيّل الكسر أجزاء متساوية من شريط واحد، ثم انظر ماذا يحدث للأجزاء عند العملية.';
      case LessonVisualKind.pattern:
        return 'تابع التغير من خطوة إلى أخرى، وابحث عن قاعدة تتكرر بدل تخمين الحد التالي.';
      case LessonVisualKind.venn:
        return 'ضع كل مجموعة في دائرة، واجعل الجزء المشترك في منطقة التداخل حتى ترى العلاقة مباشرة.';
      case LessonVisualKind.triangle:
        return 'حوّل الموقف إلى مثلث قائم، وحدد الوتر أولًا ثم طبّق العلاقة على الضلعين الآخرين.';
      case LessonVisualKind.ratio:
        return 'رتب القيم في جدول متناظر؛ إذا بقي العامل نفسه فالعلاقة ثابتة ويسهل اكتشاف المجهول.';
      case LessonVisualKind.percent:
        return 'تخيّل الكل شريطًا من 100 جزء؛ النسبة هي الجزء المظلل من هذا الكل.';
      case LessonVisualKind.geometry:
        return 'ارسم العلاقات والزوايا والأجزاء بدل الاعتماد على شكل المسألة في ذهنك فقط.';
      case LessonVisualKind.transform:
        return 'قارن موقع النقطة قبل التحويل وبعده؛ الشكل يبقى نفسه لكن الموقع أو الاتجاه يتغير.';
      case LessonVisualKind.statistics:
        return 'حوّل البيانات إلى صورة: جدول أو أعمدة أو قطاعات أو صندوق، ثم اقرأ ما تقوله الصورة.';
      case LessonVisualKind.probability:
        return 'افتح كل احتمال كفرع مستقل حتى ترى جميع النواتج ولا تنسى حالة أو تكررها.';
      case LessonVisualKind.measurement:
        return 'قسّم الشكل أو المجسم إلى أجزاء تعرفها، ثم اربط القاعدة والارتفاع والسطح والحجم بصريًا.';
      case LessonVisualKind.algebra:
        return 'تعامل مع المعادلة كميزان متعادل: أي تغيير في طرف يجب أن يحدث في الطرف الآخر.';
      case LessonVisualKind.function:
        return 'تخيّل الدالة آلة: يدخل x، تطبق القاعدة، ثم يخرج y. الرسم يوضح كيف يتغير المخرج.';
      case LessonVisualKind.scientific:
        return 'تابع حركة الفاصلة؛ عدد المنازل واتجاه الحركة يحددان أس العدد 10.';
      case LessonVisualKind.histogram:
        return 'كل عمود يمثل فئة عددية، وارتفاعه يساوي عدد القيم الموجودة داخل هذه الفئة.';
      case LessonVisualKind.pie:
        return 'الدائرة تمثل الكل 100%، وكل قطاع يأخذ مساحة تتناسب مع نسبته.';
      case LessonVisualKind.boxPlot:
        return 'اقرأ القيم الخمس: الصغرى، الربيع الأول، الوسيط، الربيع الثالث، والكبرى.';
      case LessonVisualKind.stemLeaf:
        return 'اقرأ الساق أولًا ثم أضف الورقة؛ بهذه الطريقة تبقى القيم الأصلية ظاهرة.';
      case LessonVisualKind.probabilityMeter:
        return 'قارن الاحتمال المتوقع نظريًا بالنسبة التي ظهرت فعليًا بعد التجربة.';
      case LessonVisualKind.sampling:
        return 'العينة الجيدة موزعة داخل المجتمع ولا تتركز في مجموعة واحدة فقط.';
      case LessonVisualKind.compositeArea:
        return 'قسّم الشكل المركب إلى مستطيلات أو مثلثات بسيطة ثم اجمع أو اطرح المساحات.';
      case LessonVisualKind.lineGraph:
        return 'راقب ارتفاع الخط وانخفاضه؛ الميل يصف مقدار التغير الرأسي مقابل الأفقي.';
      case LessonVisualKind.squareGrid:
        return 'اربط التربيع بمساحة مربع، واربط الجذر بطول ضلع هذا المربع.';
      case LessonVisualKind.angleDiagram:
        return 'اقرأ الزوايا من الرسم: مستقيم، زاوية قائمة، وزوايا متجاورة قبل أن تبدأ الحساب.';
      case LessonVisualKind.symmetryDiagram:
        return 'قارن الشكلين أو نصفي الشكل بصريًا لتفهم التطابق ومحور التماثل.';
      case LessonVisualKind.coordinatePlane:
        return 'حوّل الفرق بين الإحداثيات إلى مثلث قائم على المستوى، ثم احسب المسافة كوتر.';
    }
  }
}

class _LessonVisualPainter extends CustomPainter {
  _LessonVisualPainter(this.kind, this.lessonId);

  final LessonVisualKind kind;
  final String lessonId;

  Paint get _whiteStroke => Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.5
    ..strokeCap = StrokeCap.round;

  Paint _fill(Color color) => Paint()
    ..color = color
    ..style = PaintingStyle.fill;

  Paint _stroke(Color color, [double width = 2]) => Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round;

  void _text(
    Canvas canvas,
    String value,
    Offset offset, {
    double fontSize = 12,
    Color color = Colors.white,
  }) {
    final painter = TextPainter(
      text: TextSpan(
        text: value,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(canvas, offset);
  }

  @override
  void paint(Canvas canvas, Size size) {
    switch (kind) {
      case LessonVisualKind.numberLine:
        _drawNumberLine(canvas, size);
      case LessonVisualKind.fraction:
        _drawFraction(canvas, size);
      case LessonVisualKind.pattern:
        _drawPattern(canvas, size);
      case LessonVisualKind.venn:
        _drawVenn(canvas, size);
      case LessonVisualKind.triangle:
        _drawTriangle(canvas, size);
      case LessonVisualKind.ratio:
        _drawRatio(canvas, size);
      case LessonVisualKind.percent:
        _drawPercent(canvas, size);
      case LessonVisualKind.geometry:
        _drawGeometry(canvas, size);
      case LessonVisualKind.transform:
        _drawTransform(canvas, size);
      case LessonVisualKind.statistics:
        _drawStatistics(canvas, size);
      case LessonVisualKind.probability:
        _drawProbability(canvas, size);
      case LessonVisualKind.measurement:
        _drawMeasurement(canvas, size);
      case LessonVisualKind.algebra:
        _drawAlgebra(canvas, size);
      case LessonVisualKind.function:
        _drawFunction(canvas, size);
      case LessonVisualKind.scientific:
        _drawScientific(canvas, size);
      case LessonVisualKind.histogram:
        _drawHistogram(canvas, size);
      case LessonVisualKind.pie:
        _drawPie(canvas, size);
      case LessonVisualKind.boxPlot:
        _drawBoxPlot(canvas, size);
      case LessonVisualKind.stemLeaf:
        _drawStemLeaf(canvas, size);
      case LessonVisualKind.probabilityMeter:
        _drawProbabilityMeter(canvas, size);
      case LessonVisualKind.sampling:
        _drawSampling(canvas, size);
      case LessonVisualKind.compositeArea:
        _drawCompositeArea(canvas, size);
      case LessonVisualKind.lineGraph:
        _drawLineGraph(canvas, size);
      case LessonVisualKind.squareGrid:
        _drawSquareGrid(canvas, size);
      case LessonVisualKind.angleDiagram:
        _drawAngleDiagram(canvas, size);
      case LessonVisualKind.symmetryDiagram:
        _drawSymmetryDiagram(canvas, size);
      case LessonVisualKind.coordinatePlane:
        _drawCoordinatePlane(canvas, size);
    }
  }

  void _drawNumberLine(Canvas c, Size s) {
    if (lessonId == 'compare-rational') {
      _drawCompareRational(c, s);
      return;
    }
    if (lessonId == 'estimate-square-roots') {
      _drawEstimateSquareRoot(c, s);
      return;
    }
    if (lessonId == 'irrational-representation') {
      _drawIrrationalPoint(c, s);
      return;
    }
    if (lessonId == 'inequalities' || lessonId == 'solve-inequalities') {
      _drawInequalityLine(c, s);
      return;
    }
    final y = s.height * .55;
    final left = s.width * .10;
    final right = s.width * .90;
    c.drawLine(Offset(left, y), Offset(right, y), _whiteStroke);
    const labels = <String>['-2', '-1', '0', '1', '2'];
    for (var i = 0; i < labels.length; i++) {
      final x = left + (right - left) * i / 4;
      c.drawLine(Offset(x, y - 10), Offset(x, y + 10), _whiteStroke);
      _text(c, labels[i], Offset(x - 8, y + 17), fontSize: 11);
    }
    final point = Offset(left + (right - left) * .36, y);
    c.drawCircle(point, 8, _fill(AppColors.secondary));
    _text(
      c,
      'الموقع يحدد القيمة',
      Offset(point.dx - 48, y - 42),
      fontSize: 10,
      color: AppColors.secondary,
    );
  }

  void _drawFraction(Canvas c, Size s) {
    if (lessonId == 'multiply-rational') {
      _drawRationalMultiply(c, s);
      return;
    }
    if (lessonId == 'divide-rational') {
      _drawRationalDivide(c, s);
      return;
    }
    if (lessonId == 'add-subtract-like-denominators') {
      _drawLikeDenominators(c, s);
      return;
    }
    if (lessonId == 'add-subtract-rational') {
      _drawUnlikeDenominators(c, s);
      return;
    }
    final rect = Rect.fromLTWH(
      s.width * .12,
      s.height * .30,
      s.width * .76,
      44,
    );
    final piece = rect.width / 4;
    for (var i = 0; i < 4; i++) {
      final cell = Rect.fromLTWH(
        rect.left + piece * i,
        rect.top,
        piece,
        rect.height,
      );
      c.drawRect(
        cell,
        _fill(
          i < 3
              ? AppColors.secondary
              : Colors.white.withValues(alpha: .12),
        ),
      );
      c.drawRect(cell, _stroke(Colors.white.withValues(alpha: .7)));
    }
    _text(
      c,
      '3 / 4',
      Offset(s.width * .45, s.height * .60),
      fontSize: 20,
      color: AppColors.secondary,
    );
    _text(
      c,
      'أجزاء متساوية من كل واحد',
      Offset(s.width * .33, s.height * .76),
      fontSize: 10,
    );
  }

  void _drawPattern(Canvas c, Size s) {
    for (var i = 0; i < 5; i++) {
      final x = s.width * (.14 + i * .17);
      final y = s.height * .50;
      final radius = 9.0 + i * 3;
      c.drawCircle(
        Offset(x, y),
        radius,
        _fill(i.isEven ? AppColors.secondary : AppColors.accent),
      );
      if (i < 4) {
        c.drawLine(
          Offset(x + radius + 5, y),
          Offset(x + s.width * .13, y),
          _stroke(Colors.white.withValues(alpha: .55)),
        );
      }
    }
    _text(
      c,
      'ما القاعدة التي تتكرر؟',
      Offset(s.width * .35, s.height * .72),
      fontSize: 11,
    );
  }

  void _drawVenn(Canvas c, Size s) {
    if (lessonId == 'real-numbers') {
      _drawRealNumberClassification(c, s);
      return;
    }
    final r = s.height * .25;
    final a = Offset(s.width * .43, s.height * .50);
    final b = Offset(s.width * .58, s.height * .50);
    c.drawCircle(
      a,
      r,
      _fill(AppColors.secondary.withValues(alpha: .55)),
    );
    c.drawCircle(
      b,
      r,
      _fill(AppColors.accent.withValues(alpha: .52)),
    );
    c.drawCircle(a, r, _whiteStroke);
    c.drawCircle(b, r, _whiteStroke);
    _text(c, 'A', Offset(a.dx - r * .65, a.dy - 8), fontSize: 15);
    _text(c, 'B', Offset(b.dx + r * .45, b.dy - 8), fontSize: 15);
    _text(
      c,
      'مشترك',
      Offset(s.width * .45, s.height * .47),
      fontSize: 10,
    );
  }

  void _drawTriangle(Canvas c, Size s) {
    if (lessonId == 'pythagorean-applications') {
      _drawPythagoreanApplication(c, s);
      return;
    }
    final a = Offset(s.width * .25, s.height * .76);
    final b = Offset(s.width * .72, s.height * .76);
    final d = Offset(s.width * .25, s.height * .20);
    final path = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(d.dx, d.dy)
      ..close();
    c.drawPath(path, _whiteStroke);
    c.drawRect(
      Rect.fromLTWH(a.dx, a.dy - 20, 20, 20),
      _stroke(AppColors.secondary, 2),
    );
    _text(c, '3', Offset(s.width * .46, s.height * .78), fontSize: 13);
    _text(c, '4', Offset(s.width * .18, s.height * .47), fontSize: 13);
    _text(
      c,
      '5  الوتر',
      Offset(s.width * .54, s.height * .40),
      fontSize: 13,
      color: AppColors.secondary,
    );
  }

  void _drawRatio(Canvas c, Size s) {
    if (lessonId == 'rate-of-change') {
      _drawRateOfChange(c, s);
      return;
    }
    if (lessonId == 'constant-rate') {
      _drawConstantRate(c, s);
      return;
    }
    if (lessonId == 'solve-proportions') {
      _drawSolveProportion(c, s);
      return;
    }
    if (lessonId == 'drawing-strategy') {
      _drawScaleSketch(c, s);
      return;
    }
    if (lessonId == 'similar-polygons') {
      _drawSimilarPolygons(c, s);
      return;
    }
    if (lessonId == 'scale-up-down') {
      _drawScaleChange(c, s);
      return;
    }
    if (lessonId == 'indirect-measurement') {
      _drawIndirectMeasurement(c, s);
      return;
    }
    final left = s.width * .24;
    final top = s.height * .18;
    final w = s.width * .52;
    final h = s.height * .62;
    c.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, w, h),
        const Radius.circular(12),
      ),
      _whiteStroke,
    );
    c.drawLine(
      Offset(left + w / 2, top),
      Offset(left + w / 2, top + h),
      _whiteStroke,
    );
    for (var i = 1; i < 4; i++) {
      c.drawLine(
        Offset(left, top + h * i / 4),
        Offset(left + w, top + h * i / 4),
        _stroke(Colors.white.withValues(alpha: .35)),
      );
    }
    const xValues = <String>['1', '2', '3'];
    const yValues = <String>['4', '8', '12'];
    for (var i = 0; i < 3; i++) {
      _text(
        c,
        xValues[i],
        Offset(left + w * .22, top + h * (.29 + i * .25)),
      );
      _text(
        c,
        yValues[i],
        Offset(left + w * .70, top + h * (.29 + i * .25)),
        color: AppColors.secondary,
      );
    }
    _text(
      c,
      'العامل ثابت ×4',
      Offset(left + w * .29, top + 8),
      fontSize: 10,
      color: AppColors.accent,
    );
  }

  void _drawPercent(Canvas c, Size s) {
    if (lessonId == 'percent-estimation') {
      _drawPercentEstimate(c, s);
      return;
    }
    if (lessonId == 'reasonableness-strategy') {
      _drawPercentReasonableness(c, s);
      return;
    }
    if (lessonId == 'percent-equation') {
      _drawPercentEquation(c, s);
      return;
    }
    if (lessonId == 'percent-change') {
      _drawPercentChange(c, s);
      return;
    }
    final rect = Rect.fromLTWH(
      s.width * .12,
      s.height * .36,
      s.width * .76,
      48,
    );
    c.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(12)),
      _fill(Colors.white.withValues(alpha: .12)),
    );
    final quarter = Rect.fromLTWH(
      rect.left,
      rect.top,
      rect.width * .25,
      rect.height,
    );
    c.drawRRect(
      RRect.fromRectAndRadius(quarter, const Radius.circular(12)),
      _fill(AppColors.secondary),
    );
    _text(
      c,
      '25%',
      Offset(quarter.center.dx - 15, quarter.center.dy - 8),
      color: AppColors.primaryDark,
    );
    _text(c, '100%', Offset(rect.right - 42, rect.center.dy - 8));
    _text(
      c,
      '25% = ربع الكل',
      Offset(s.width * .39, s.height * .70),
      color: AppColors.secondary,
      fontSize: 12,
    );
  }

  void _drawGeometry(Canvas c, Size s) {
    if (lessonId == 'logical-reasoning') {
      _drawLogicalReasoning(c, s);
      return;
    }
    if (lessonId == 'congruent-polygons') {
      _drawCongruentPolygons(c, s);
      return;
    }
    final center = Offset(s.width * .50, s.height * .50);
    final radius = s.height * .28;
    final points = <Offset>[];
    for (var i = 0; i < 6; i++) {
      final angle = -math.pi / 2 + i * math.pi / 3;
      points.add(
        Offset(
          center.dx + radius * math.cos(angle),
          center.dy + radius * math.sin(angle),
        ),
      );
    }
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    path.close();
    c.drawPath(
      path,
      _fill(AppColors.secondary.withValues(alpha: .20)),
    );
    c.drawPath(path, _stroke(AppColors.secondary, 3));
    for (var i = 2; i < 5; i++) {
      c.drawLine(
        points.first,
        points[i],
        _stroke(Colors.white.withValues(alpha: .50)),
      );
    }
    _text(
      c,
      'قسّم الشكل إلى أجزاء أبسط',
      Offset(s.width * .32, s.height * .80),
      fontSize: 10,
    );
  }

  void _drawTransform(Canvas c, Size s) {
    if (lessonId == 'translation') {
      _drawTranslation(c, s);
      return;
    }
    if (lessonId == 'rotation') {
      _drawRotation(c, s);
      return;
    }
    final midX = s.width * .50;
    c.drawLine(
      Offset(midX, s.height * .12),
      Offset(midX, s.height * .86),
      _stroke(Colors.white.withValues(alpha: .45)),
    );
    final p1 = Path()
      ..moveTo(s.width * .20, s.height * .68)
      ..lineTo(s.width * .34, s.height * .28)
      ..lineTo(s.width * .42, s.height * .68)
      ..close();
    final p2 = Path()
      ..moveTo(s.width * .80, s.height * .68)
      ..lineTo(s.width * .66, s.height * .28)
      ..lineTo(s.width * .58, s.height * .68)
      ..close();
    c.drawPath(
      p1,
      _fill(AppColors.secondary.withValues(alpha: .72)),
    );
    c.drawPath(
      p2,
      _fill(AppColors.accent.withValues(alpha: .68)),
    );
    _text(c, 'قبل', Offset(s.width * .28, s.height * .73), fontSize: 10);
    _text(c, 'بعد', Offset(s.width * .66, s.height * .73), fontSize: 10);
  }

  void _drawStatistics(Canvas c, Size s) {
    if (lessonId == 'table-strategy') {
      _drawDataTable(c, s);
      return;
    }
    if (lessonId == 'central-tendency-range') {
      _drawCentralTendency(c, s);
      return;
    }
    if (lessonId == 'dispersion') {
      _drawDispersion(c, s);
      return;
    }
    if (lessonId == 'choose-display') {
      _drawChooseDisplay(c, s);
      return;
    }
    final base = s.height * .77;
    final left = s.width * .16;
    c.drawLine(
      Offset(left, base),
      Offset(s.width * .86, base),
      _whiteStroke,
    );
    c.drawLine(
      Offset(left, base),
      Offset(left, s.height * .18),
      _whiteStroke,
    );
    final heights = <double>[.22, .50, .34, .62, .40];
    final barWidth = s.width * .12;
    for (var i = 0; i < heights.length; i++) {
      final height = s.height * heights[i];
      final bar = Rect.fromLTWH(
        left + i * barWidth,
        base - height,
        barWidth,
        height,
      );
      c.drawRect(
        bar,
        _fill(
          i == 1
              ? AppColors.secondary
              : AppColors.primary.withValues(alpha: .78),
        ),
      );
      c.drawRect(
        bar,
        _stroke(Colors.white.withValues(alpha: .25)),
      );
    }
    _text(
      c,
      'حوّل البيانات إلى صورة يمكن قراءتها',
      Offset(s.width * .28, s.height * .83),
      fontSize: 10,
    );
  }

  void _drawProbability(Canvas c, Size s) {
    if (lessonId == 'compound-events') {
      _drawCompoundOutcomes(c, s);
      return;
    }
    if (lessonId == 'represent-problem') {
      _drawProbabilityRepresentation(c, s);
      return;
    }
    final root = Offset(s.width * .18, s.height * .50);
    final a = Offset(s.width * .47, s.height * .30);
    final b = Offset(s.width * .47, s.height * .70);
    final ends = <Offset>[
      Offset(s.width * .78, s.height * .18),
      Offset(s.width * .78, s.height * .40),
      Offset(s.width * .78, s.height * .60),
      Offset(s.width * .78, s.height * .82),
    ];
    c.drawLine(root, a, _whiteStroke);
    c.drawLine(root, b, _whiteStroke);
    c.drawLine(a, ends[0], _stroke(AppColors.secondary, 2));
    c.drawLine(a, ends[1], _stroke(AppColors.secondary, 2));
    c.drawLine(b, ends[2], _stroke(AppColors.accent, 2));
    c.drawLine(b, ends[3], _stroke(AppColors.accent, 2));
    c.drawCircle(root, 7, _fill(Colors.white));
    for (final end in ends) {
      c.drawCircle(end, 6, _fill(Colors.white));
    }
    _text(
      c,
      'كل نهاية = ناتج ممكن',
      Offset(s.width * .36, s.height * .84),
      fontSize: 10,
    );
  }

  void _drawMeasurement(Canvas c, Size s) {
    if (lessonId == 'three-dimensional-shapes') {
      _drawThreeDimensionalShapes(c, s);
      return;
    }
    if (lessonId == 'prism-cylinder-volume') {
      _drawPrismCylinderVolume(c, s);
      return;
    }
    if (lessonId == 'pyramid-cone-volume') {
      _drawPyramidConeVolume(c, s);
      return;
    }
    if (lessonId == 'prism-cylinder-surface-area') {
      _drawCylinderNet(c, s);
      return;
    }
    if (lessonId == 'pyramid-surface-area') {
      _drawPyramidNet(c, s);
      return;
    }
    final x = s.width * .34;
    final y = s.height * .20;
    final w = s.width * .28;
    final h = s.height * .44;
    const depth = 28.0;
    c.drawRect(Rect.fromLTWH(x, y + depth, w, h), _whiteStroke);
    c.drawLine(
      Offset(x, y + depth),
      Offset(x + depth, y),
      _stroke(AppColors.secondary, 2),
    );
    c.drawLine(
      Offset(x + w, y + depth),
      Offset(x + w + depth, y),
      _stroke(AppColors.secondary, 2),
    );
    c.drawLine(
      Offset(x + w, y + depth + h),
      Offset(x + w + depth, y + h),
      _stroke(AppColors.secondary, 2),
    );
    c.drawLine(
      Offset(x + depth, y),
      Offset(x + w + depth, y),
      _stroke(AppColors.secondary, 2),
    );
    c.drawLine(
      Offset(x + w + depth, y),
      Offset(x + w + depth, y + h),
      _stroke(AppColors.secondary, 2),
    );
    _text(
      c,
      'القاعدة',
      Offset(x + w * .32, y + depth + h + 10),
      fontSize: 10,
      color: AppColors.secondary,
    );
    _text(
      c,
      'الارتفاع',
      Offset(x + w + depth + 8, y + h * .44),
      fontSize: 10,
    );
  }

  void _drawAlgebra(Canvas c, Size s) {
    if (lessonId == 'simplify-expressions') {
      _drawSimplifyExpressions(c, s);
      return;
    }
    if (lessonId == 'write-two-step-equations') {
      _drawWriteEquation(c, s);
      return;
    }
    if (lessonId == 'variables-both-sides') {
      _drawVariablesBothSides(c, s);
      return;
    }
    if (lessonId == 'guess-check-strategy') {
      _drawGuessCheck(c, s);
      return;
    }
    final centerX = s.width * .50;
    final barY = s.height * .34;
    c.drawLine(
      Offset(centerX, s.height * .22),
      Offset(centerX, s.height * .74),
      _whiteStroke,
    );
    c.drawLine(
      Offset(centerX - 105, barY),
      Offset(centerX + 105, barY),
      _stroke(AppColors.secondary, 4),
    );
    c.drawLine(
      Offset(centerX - 75, barY),
      Offset(centerX - 75, s.height * .58),
      _whiteStroke,
    );
    c.drawLine(
      Offset(centerX + 75, barY),
      Offset(centerX + 75, s.height * .58),
      _whiteStroke,
    );
    final leftBox = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(centerX - 75, s.height * .61),
        width: 92,
        height: 38,
      ),
      const Radius.circular(10),
    );
    final rightBox = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(centerX + 75, s.height * .61),
        width: 92,
        height: 38,
      ),
      const Radius.circular(10),
    );
    c.drawRRect(leftBox, _fill(AppColors.accent));
    c.drawRRect(rightBox, _fill(AppColors.primary));
    _text(c, '3x + 2', Offset(centerX - 103, s.height * .57));
    _text(c, '11', Offset(centerX + 67, s.height * .57));
    _text(
      c,
      'حافظ على توازن الطرفين',
      Offset(s.width * .34, s.height * .80),
      fontSize: 10,
    );
  }

  void _drawFunction(Canvas c, Size s) {
    if (lessonId == 'model-strategy') {
      _drawModelStrategy(c, s);
      return;
    }
    _text(c, 'x = 3', Offset(s.width * .11, s.height * .43), fontSize: 14);
    c.drawLine(
      Offset(s.width * .27, s.height * .50),
      Offset(s.width * .38, s.height * .50),
      _whiteStroke,
    );
    final box = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        s.width * .38,
        s.height * .28,
        s.width * .24,
        s.height * .42,
      ),
      const Radius.circular(16),
    );
    c.drawRRect(box, _fill(AppColors.secondary));
    _text(
      c,
      '×2 + 1',
      Offset(s.width * .43, s.height * .46),
      fontSize: 14,
      color: AppColors.primaryDark,
    );
    c.drawLine(
      Offset(s.width * .62, s.height * .50),
      Offset(s.width * .73, s.height * .50),
      _whiteStroke,
    );
    _text(
      c,
      'y = 7',
      Offset(s.width * .74, s.height * .43),
      fontSize: 14,
      color: AppColors.accent,
    );
    c.drawLine(
      Offset(s.width * .22, s.height * .78),
      Offset(s.width * .82, s.height * .78),
      _stroke(Colors.white.withValues(alpha: .30)),
    );
    c.drawLine(
      Offset(s.width * .30, s.height * .73),
      Offset(s.width * .76, s.height * .60),
      _stroke(AppColors.secondary, 3),
    );
  }

  void _drawScientific(Canvas c, Size s) {
    _text(c, '450000', Offset(s.width * .14, s.height * .31), fontSize: 22);
    _text(
      c,
      '→',
      Offset(s.width * .46, s.height * .31),
      fontSize: 22,
      color: AppColors.secondary,
    );
    _text(c, '4.5 × 10⁵', Offset(s.width * .57, s.height * .31), fontSize: 20);
    c.drawLine(
      Offset(s.width * .22, s.height * .64),
      Offset(s.width * .73, s.height * .64),
      _stroke(AppColors.accent, 3),
    );
    _text(
      c,
      '5 منازل لليسار',
      Offset(s.width * .38, s.height * .70),
      fontSize: 10,
      color: AppColors.secondary,
    );
  }

  void _drawHistogram(Canvas c, Size s) {
    final base = s.height * .78;
    final left = s.width * .16;
    c.drawLine(Offset(left, base), Offset(s.width * .86, base), _whiteStroke);
    c.drawLine(Offset(left, base), Offset(left, s.height * .16), _whiteStroke);
    final heights = <double>[.28, .48, .65, .40];
    final barWidth = s.width * .16;
    for (var i = 0; i < heights.length; i++) {
      final height = s.height * heights[i];
      final bar = Rect.fromLTWH(
        left + i * barWidth,
        base - height,
        barWidth,
        height,
      );
      c.drawRect(
        bar,
        _fill(
          i == 2
              ? AppColors.secondary
              : AppColors.primary.withValues(alpha: .75),
        ),
      );
      c.drawRect(bar, _stroke(Colors.white.withValues(alpha: .28)));
    }
    _text(c, 'فئات متجاورة', Offset(s.width * .40, s.height * .84), fontSize: 10);
  }

  void _drawPie(Canvas c, Size s) {
    final center = Offset(s.width * .50, s.height * .48);
    final radius = s.height * .30;
    final rect = Rect.fromCircle(center: center, radius: radius);
    c.drawArc(rect, -math.pi / 2, math.pi / 2, true, _fill(AppColors.secondary));
    c.drawArc(rect, 0, math.pi * .65, true, _fill(AppColors.accent));
    c.drawArc(
      rect,
      math.pi * .65,
      math.pi * .85,
      true,
      _fill(AppColors.primary),
    );
    c.drawCircle(center, radius, _stroke(Colors.white, 2));
    _text(
      c,
      '25%',
      Offset(center.dx + 18, center.dy - 44),
      color: AppColors.primaryDark,
    );
    _text(c, '50%', Offset(center.dx - 62, center.dy - 8));
  }

  void _drawBoxPlot(Canvas c, Size s) {
    final y = s.height * .50;
    final min = s.width * .14;
    final q1 = s.width * .31;
    final median = s.width * .50;
    final q3 = s.width * .69;
    final max = s.width * .86;
    c.drawLine(Offset(min, y), Offset(max, y), _whiteStroke);
    final box = Rect.fromLTRB(q1, y - 34, q3, y + 34);
    c.drawRect(box, _fill(AppColors.secondary.withValues(alpha: .22)));
    c.drawRect(box, _stroke(AppColors.secondary, 3));
    c.drawLine(
      Offset(median, y - 34),
      Offset(median, y + 34),
      _stroke(AppColors.accent, 3),
    );
    c.drawLine(Offset(min, y - 16), Offset(min, y + 16), _whiteStroke);
    c.drawLine(Offset(max, y - 16), Offset(max, y + 16), _whiteStroke);
    _text(
      c,
      'الوسيط',
      Offset(median - 22, y + 44),
      fontSize: 10,
      color: AppColors.accent,
    );
  }

  void _drawStemLeaf(Canvas c, Size s) {
    _text(
      c,
      'الساق | الورقة',
      Offset(s.width * .36, s.height * .17),
      fontSize: 13,
      color: AppColors.secondary,
    );
    _text(c, '4 | 2  5  7', Offset(s.width * .35, s.height * .36), fontSize: 18);
    _text(c, '5 | 1  3  8', Offset(s.width * .35, s.height * .54), fontSize: 18);
    _text(
      c,
      '4 | 7 = 47',
      Offset(s.width * .40, s.height * .76),
      fontSize: 11,
      color: AppColors.accent,
    );
  }

  void _drawProbabilityMeter(Canvas c, Size s) {
    final rect = Rect.fromLTWH(
      s.width * .14,
      s.height * .38,
      s.width * .72,
      28,
    );
    c.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(14)),
      _fill(Colors.white.withValues(alpha: .14)),
    );
    c.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(rect.left, rect.top, rect.width * .50, rect.height),
        const Radius.circular(14),
      ),
      _fill(AppColors.secondary),
    );
    c.drawLine(
      Offset(rect.left + rect.width * .47, rect.top - 18),
      Offset(rect.left + rect.width * .47, rect.bottom + 18),
      _stroke(AppColors.accent, 3),
    );
    _text(
      c,
      'نظري 50%',
      Offset(s.width * .17, s.height * .61),
      fontSize: 10,
      color: AppColors.secondary,
    );
    _text(
      c,
      'تجريبي 47%',
      Offset(s.width * .58, s.height * .61),
      fontSize: 10,
      color: AppColors.accent,
    );
  }

  void _drawSampling(Canvas c, Size s) {
    final points = <Offset>[
      Offset(.16, .28), Offset(.28, .20), Offset(.39, .34),
      Offset(.55, .22), Offset(.69, .31), Offset(.82, .24),
      Offset(.20, .52), Offset(.34, .61), Offset(.47, .49),
      Offset(.61, .58), Offset(.76, .52), Offset(.84, .68),
      Offset(.27, .76), Offset(.48, .74), Offset(.68, .78),
    ];
    for (var i = 0; i < points.length; i++) {
      final point = Offset(points[i].dx * s.width, points[i].dy * s.height);
      final selected = i % 3 == 0;
      c.drawCircle(
        point,
        selected ? 8 : 5,
        _fill(
          selected
              ? AppColors.secondary
              : Colors.white.withValues(alpha: .40),
        ),
      );
    }
    _text(
      c,
      'العينة موزعة بين المجتمع',
      Offset(s.width * .34, s.height * .84),
      fontSize: 10,
      color: AppColors.secondary,
    );
  }

  void _drawCompositeArea(Canvas c, Size s) {
    if (lessonId == 'simpler-problem-strategy') {
      _drawSimplerProblem(c, s);
      return;
    }
    final a = Rect.fromLTWH(
      s.width * .18,
      s.height * .22,
      s.width * .30,
      s.height * .50,
    );
    final b = Rect.fromLTWH(
      s.width * .48,
      s.height * .44,
      s.width * .30,
      s.height * .28,
    );
    c.drawRect(a, _fill(AppColors.secondary.withValues(alpha: .78)));
    c.drawRect(b, _fill(AppColors.accent.withValues(alpha: .70)));
    c.drawRect(a, _whiteStroke);
    c.drawRect(b, _whiteStroke);
    _text(
      c,
      'A1',
      Offset(a.center.dx - 10, a.center.dy - 8),
      color: AppColors.primaryDark,
    );
    _text(c, 'A2', Offset(b.center.dx - 10, b.center.dy - 8));
    _text(
      c,
      'المساحة = A1 + A2',
      Offset(s.width * .34, s.height * .80),
      fontSize: 10,
    );
  }

  void _drawLineGraph(Canvas c, Size s) {
    if (lessonId == 'graph-linear-functions') {
      _drawGraphLinearFunction(c, s);
      return;
    }
    if (lessonId == 'direct-variation') {
      _drawDirectVariation(c, s);
      return;
    }
    final origin = Offset(s.width * .18, s.height * .78);
    c.drawLine(origin, Offset(s.width * .86, origin.dy), _whiteStroke);
    c.drawLine(origin, Offset(origin.dx, s.height * .16), _whiteStroke);
    c.drawLine(
      Offset(s.width * .27, s.height * .69),
      Offset(s.width * .78, s.height * .25),
      _stroke(AppColors.secondary, 4),
    );
    c.drawLine(
      Offset(s.width * .47, s.height * .52),
      Offset(s.width * .63, s.height * .52),
      _stroke(AppColors.accent, 3),
    );
    c.drawLine(
      Offset(s.width * .63, s.height * .52),
      Offset(s.width * .63, s.height * .38),
      _stroke(AppColors.accent, 3),
    );
    _text(
      c,
      'run',
      Offset(s.width * .52, s.height * .56),
      fontSize: 9,
      color: AppColors.accent,
    );
    _text(
      c,
      'rise',
      Offset(s.width * .65, s.height * .41),
      fontSize: 9,
      color: AppColors.accent,
    );
  }

  void _drawSquareGrid(Canvas c, Size s) {
    if (lessonId == 'square-roots') {
      _drawSquareRootVisual(c, s);
      return;
    }
    final side = math.min(s.width, s.height) * .42;
    final left = s.width * .34;
    final top = s.height * .18;
    final cell = side / 3;
    final rect = Rect.fromLTWH(left, top, side, side);
    c.drawRect(rect, _fill(AppColors.secondary.withValues(alpha: .18)));
    c.drawRect(rect, _stroke(AppColors.secondary, 3));
    for (var i = 1; i < 3; i++) {
      c.drawLine(
        Offset(left + cell * i, top),
        Offset(left + cell * i, top + side),
        _stroke(Colors.white.withValues(alpha: .45)),
      );
      c.drawLine(
        Offset(left, top + cell * i),
        Offset(left + side, top + cell * i),
        _stroke(Colors.white.withValues(alpha: .45)),
      );
    }
    _text(
      c,
      '3',
      Offset(left + side / 2 - 4, top + side + 10),
      fontSize: 13,
      color: AppColors.secondary,
    );
    _text(
      c,
      '3',
      Offset(left - 20, top + side / 2 - 8),
      fontSize: 13,
      color: AppColors.secondary,
    );
    _text(
      c,
      '3² = 9',
      Offset(s.width * .64, s.height * .35),
      fontSize: 18,
      color: AppColors.accent,
    );
    _text(
      c,
      '√9 = 3',
      Offset(s.width * .64, s.height * .55),
      fontSize: 18,
      color: Colors.white,
    );
  }

  void _drawAngleDiagram(Canvas c, Size s) {
    if (lessonId == 'logical-reasoning') {
      _drawLogicalReasoning(c, s);
      return;
    }
    final o = Offset(s.width * .48, s.height * .58);
    c.drawLine(
      Offset(s.width * .14, o.dy),
      Offset(s.width * .86, o.dy),
      _stroke(Colors.white, 3),
    );
    c.drawLine(
      o,
      Offset(s.width * .72, s.height * .20),
      _stroke(AppColors.secondary, 3),
    );
    c.drawArc(
      Rect.fromCircle(center: o, radius: 42),
      -math.pi / 3,
      math.pi / 3,
      false,
      _stroke(AppColors.accent, 3),
    );
    _text(
      c,
      '70°',
      Offset(o.dx + 22, o.dy - 50),
      fontSize: 13,
      color: AppColors.secondary,
    );
    _text(
      c,
      '110°',
      Offset(o.dx - 74, o.dy - 34),
      fontSize: 13,
      color: Colors.white,
    );
    _text(
      c,
      '70 + 110 = 180',
      Offset(s.width * .34, s.height * .76),
      fontSize: 11,
      color: AppColors.accent,
    );
  }

  void _drawSymmetryDiagram(Canvas c, Size s) {
    if (lessonId == 'congruent-polygons') {
      _drawCongruentPolygons(c, s);
      return;
    }
    final midX = s.width * .50;
    c.drawLine(
      Offset(midX, s.height * .12),
      Offset(midX, s.height * .86),
      _stroke(Colors.white.withValues(alpha: .55), 2),
    );
    final left = Path()
      ..moveTo(s.width * .22, s.height * .68)
      ..lineTo(s.width * .34, s.height * .28)
      ..lineTo(s.width * .44, s.height * .68)
      ..close();
    final right = Path()
      ..moveTo(s.width * .78, s.height * .68)
      ..lineTo(s.width * .66, s.height * .28)
      ..lineTo(s.width * .56, s.height * .68)
      ..close();
    c.drawPath(left, _fill(AppColors.secondary.withValues(alpha: .70)));
    c.drawPath(right, _fill(AppColors.accent.withValues(alpha: .62)));
    c.drawPath(left, _stroke(Colors.white.withValues(alpha: .60)));
    c.drawPath(right, _stroke(Colors.white.withValues(alpha: .60)));
    _text(
      c,
      'محور التماثل',
      Offset(midX - 38, s.height * .78),
      fontSize: 10,
      color: AppColors.secondary,
    );
  }

  void _drawCoordinatePlane(Canvas c, Size s) {
    final origin = Offset(s.width * .18, s.height * .80);
    final xEnd = Offset(s.width * .88, origin.dy);
    final yEnd = Offset(origin.dx, s.height * .14);
    c.drawLine(origin, xEnd, _stroke(Colors.white.withValues(alpha: .75), 2));
    c.drawLine(origin, yEnd, _stroke(Colors.white.withValues(alpha: .75), 2));

    final p1 = Offset(s.width * .34, s.height * .66);
    final p2 = Offset(s.width * .72, s.height * .30);
    final corner = Offset(p2.dx, p1.dy);

    c.drawLine(p1, corner, _stroke(AppColors.accent, 3));
    c.drawLine(corner, p2, _stroke(AppColors.accent, 3));
    c.drawLine(p1, p2, _stroke(AppColors.secondary, 4));

    c.drawCircle(p1, 7, _fill(Colors.white));
    c.drawCircle(p2, 7, _fill(Colors.white));

    _text(c, 'A', Offset(p1.dx - 18, p1.dy - 12), fontSize: 12);
    _text(c, 'B', Offset(p2.dx + 8, p2.dy - 12), fontSize: 12);
    _text(
      c,
      'Δx',
      Offset((p1.dx + corner.dx) / 2 - 8, p1.dy + 8),
      fontSize: 10,
      color: AppColors.accent,
    );
    _text(
      c,
      'Δy',
      Offset(corner.dx + 8, (corner.dy + p2.dy) / 2 - 8),
      fontSize: 10,
      color: AppColors.accent,
    );
    _text(
      c,
      'المسافة',
      Offset((p1.dx + p2.dx) / 2 - 18, (p1.dy + p2.dy) / 2 - 24),
      fontSize: 10,
      color: AppColors.secondary,
    );
  }

  void _drawCompareRational(Canvas c, Size s) {
    final y = s.height * .55;
    final left = s.width * .10;
    final right = s.width * .90;
    c.drawLine(Offset(left, y), Offset(right, y), _whiteStroke);

    const values = <String>['-2', '-1', '0', '1', '2'];
    for (var i = 0; i < values.length; i++) {
      final x = left + (right - left) * i / 4;
      c.drawLine(Offset(x, y - 9), Offset(x, y + 9), _whiteStroke);
      _text(c, values[i], Offset(x - 8, y + 16), fontSize: 10);
    }

    final a = Offset(left + (right - left) * .22, y);
    final b = Offset(left + (right - left) * .40, y);
    c.drawCircle(a, 8, _fill(AppColors.accent));
    c.drawCircle(b, 8, _fill(AppColors.secondary));
    _text(c, '-1.1', Offset(a.dx - 18, y - 36), fontSize: 11, color: AppColors.accent);
    _text(c, '-0.4', Offset(b.dx - 18, y - 36), fontSize: 11, color: AppColors.secondary);
    _text(c, '-0.4 > -1.1', Offset(s.width * .38, s.height * .18), fontSize: 16);
  }

  void _drawRationalMultiply(Canvas c, Size s) {
    _text(c, '(-) × (+)', Offset(s.width * .15, s.height * .22), fontSize: 20);
    _text(c, '→', Offset(s.width * .47, s.height * .22), fontSize: 20, color: AppColors.secondary);
    _text(c, '(-)', Offset(s.width * .66, s.height * .22), fontSize: 22, color: AppColors.accent);

    final start = s.width * .16;
    final y = s.height * .62;
    for (var i = 0; i < 6; i++) {
      c.drawCircle(
        Offset(start + i * s.width * .12, y),
        8,
        _fill(i < 3 ? AppColors.accent : AppColors.secondary),
      );
    }
    _text(c, 'اضرب القيم ثم حدّد الإشارة', Offset(s.width * .29, s.height * .76), fontSize: 10);
  }

  void _drawRationalDivide(Canvas c, Size s) {
    _text(c, '3/4 ÷ 1/2', Offset(s.width * .18, s.height * .23), fontSize: 21);
    _text(c, 'اقلب الثاني', Offset(s.width * .42, s.height * .43), fontSize: 11, color: AppColors.secondary);
    _text(c, '3/4 × 2/1', Offset(s.width * .57, s.height * .23), fontSize: 21, color: AppColors.secondary);

    c.drawLine(
      Offset(s.width * .30, s.height * .64),
      Offset(s.width * .70, s.height * .64),
      _stroke(AppColors.accent, 3),
    );
    _text(c, '= 3/2', Offset(s.width * .44, s.height * .71), fontSize: 18, color: AppColors.accent);
  }

  void _drawLikeDenominators(Canvas c, Size s) {
    final top = s.height * .26;
    final left = s.width * .14;
    final width = s.width * .30;
    final cell = width / 5;

    for (var block = 0; block < 2; block++) {
      final x0 = block == 0 ? left : s.width * .56;
      for (var i = 0; i < 5; i++) {
        final rect = Rect.fromLTWH(x0 + i * cell, top, cell, 42);
        c.drawRect(
          rect,
          _fill(
            i < (block == 0 ? 2 : 1)
                ? AppColors.secondary
                : Colors.white.withValues(alpha: .12),
          ),
        );
        c.drawRect(rect, _stroke(Colors.white.withValues(alpha: .55)));
      }
    }

    _text(c, '2/5', Offset(left + width * .36, top + 52), fontSize: 13);
    _text(c, '+', Offset(s.width * .48, top + 8), fontSize: 18, color: AppColors.accent);
    _text(c, '1/5', Offset(s.width * .56 + width * .36, top + 52), fontSize: 13);
    _text(c, '= 3/5  المقام بقي 5', Offset(s.width * .35, s.height * .72), fontSize: 11, color: AppColors.secondary);
  }

  void _drawUnlikeDenominators(Canvas c, Size s) {
    _text(c, '1/2', Offset(s.width * .13, s.height * .20), fontSize: 17);
    _text(c, '+', Offset(s.width * .28, s.height * .20), fontSize: 17, color: AppColors.accent);
    _text(c, '1/3', Offset(s.width * .36, s.height * .20), fontSize: 17);
    _text(c, '→', Offset(s.width * .50, s.height * .20), fontSize: 17, color: AppColors.secondary);
    _text(c, '3/6 + 2/6', Offset(s.width * .60, s.height * .20), fontSize: 17, color: AppColors.secondary);

    final y = s.height * .54;
    final left = s.width * .16;
    final total = s.width * .68;
    final cell = total / 6;
    for (var i = 0; i < 6; i++) {
      final rect = Rect.fromLTWH(left + i * cell, y, cell, 38);
      c.drawRect(
        rect,
        _fill(i < 5 ? AppColors.secondary : Colors.white.withValues(alpha: .12)),
      );
      c.drawRect(rect, _stroke(Colors.white.withValues(alpha: .50)));
    }
    _text(c, '= 5/6', Offset(s.width * .44, s.height * .72), fontSize: 17, color: AppColors.accent);
  }

  void _drawEstimateSquareRoot(Canvas c, Size s) {
    final y = s.height * .57;
    final left = s.width * .18;
    final right = s.width * .82;
    c.drawLine(Offset(left, y), Offset(right, y), _whiteStroke);

    final x4 = left;
    final x5 = right;
    c.drawLine(Offset(x4, y - 10), Offset(x4, y + 10), _whiteStroke);
    c.drawLine(Offset(x5, y - 10), Offset(x5, y + 10), _whiteStroke);
    _text(c, '4', Offset(x4 - 4, y + 16), fontSize: 11);
    _text(c, '5', Offset(x5 - 4, y + 16), fontSize: 11);
    _text(c, '√20', Offset(s.width * .50, y - 42), fontSize: 16, color: AppColors.secondary);
    c.drawCircle(Offset(s.width * .55, y), 8, _fill(AppColors.secondary));
    _text(c, '16 < 20 < 25', Offset(s.width * .36, s.height * .20), fontSize: 13);
  }

  void _drawIrrationalPoint(Canvas c, Size s) {
    final y = s.height * .60;
    final left = s.width * .16;
    final right = s.width * .84;
    c.drawLine(Offset(left, y), Offset(right, y), _whiteStroke);

    const labels = <String>['1', '1.4', '1.5', '2'];
    const fractions = <double>[0, .40, .50, 1];
    for (var i = 0; i < labels.length; i++) {
      final x = left + (right - left) * fractions[i];
      c.drawLine(Offset(x, y - 9), Offset(x, y + 9), _whiteStroke);
      _text(c, labels[i], Offset(x - 9, y + 15), fontSize: 10);
    }
    final root2 = left + (right - left) * .414;
    c.drawCircle(Offset(root2, y), 8, _fill(AppColors.accent));
    _text(c, '√2 ≈ 1.414', Offset(root2 - 38, y - 42), fontSize: 12, color: AppColors.accent);
  }

  void _drawInequalityLine(Canvas c, Size s) {
    final y = s.height * .56;
    final left = s.width * .14;
    final right = s.width * .86;
    c.drawLine(Offset(left, y), Offset(right, y), _whiteStroke);

    final boundary = s.width * .50;
    c.drawCircle(
      Offset(boundary, y),
      9,
      lessonId == 'solve-inequalities'
          ? _fill(AppColors.secondary)
          : _stroke(AppColors.secondary, 3),
    );
    c.drawLine(
      Offset(boundary + 10, y),
      Offset(right, y),
      _stroke(AppColors.secondary, 5),
    );
    _text(
      c,
      lessonId == 'solve-inequalities' ? 'x ≥ 2' : 'x > 2',
      Offset(s.width * .43, s.height * .26),
      fontSize: 18,
      color: AppColors.secondary,
    );
    _text(
      c,
      lessonId == 'solve-inequalities'
          ? 'الدائرة مغلقة: 2 مشمولة'
          : 'الدائرة مفتوحة: 2 غير مشمولة',
      Offset(s.width * .31, s.height * .74),
      fontSize: 10,
    );
  }

  void _drawRateOfChange(Canvas c, Size s) {
    final a = Offset(s.width * .24, s.height * .70);
    final b = Offset(s.width * .72, s.height * .28);
    c.drawLine(a, b, _stroke(AppColors.secondary, 4));
    c.drawLine(a, Offset(b.dx, a.dy), _stroke(AppColors.accent, 3));
    c.drawLine(Offset(b.dx, a.dy), b, _stroke(AppColors.accent, 3));
    _text(c, 'Δx = 4', Offset(s.width * .43, s.height * .73), fontSize: 11, color: AppColors.accent);
    _text(c, 'Δy = 8', Offset(s.width * .73, s.height * .47), fontSize: 11, color: AppColors.accent);
    _text(c, 'معدل التغير = 8 ÷ 4 = 2', Offset(s.width * .30, s.height * .14), fontSize: 13);
  }

  void _drawConstantRate(Canvas c, Size s) {
    _text(c, '6 كم', Offset(s.width * .18, s.height * .28), fontSize: 18);
    _text(c, 'في', Offset(s.width * .40, s.height * .28), fontSize: 14, color: AppColors.accent);
    _text(c, '3 ساعات', Offset(s.width * .52, s.height * .28), fontSize: 18);
    c.drawLine(Offset(s.width * .24, s.height * .52), Offset(s.width * .76, s.height * .52), _stroke(Colors.white.withValues(alpha: .45), 2));
    _text(c, '÷ 3', Offset(s.width * .45, s.height * .57), fontSize: 12, color: AppColors.secondary);
    _text(c, '2 كم لكل ساعة', Offset(s.width * .35, s.height * .70), fontSize: 17, color: AppColors.secondary);
  }

  void _drawSolveProportion(Canvas c, Size s) {
    _text(c, '3 / 5 = x / 20', Offset(s.width * .28, s.height * .22), fontSize: 22);
    c.drawLine(Offset(s.width * .31, s.height * .50), Offset(s.width * .68, s.height * .30), _stroke(AppColors.accent, 3));
    c.drawLine(Offset(s.width * .31, s.height * .30), Offset(s.width * .68, s.height * .50), _stroke(AppColors.secondary, 3));
    _text(c, '3×20 = 5×x', Offset(s.width * .34, s.height * .58), fontSize: 15);
    _text(c, 'x = 12', Offset(s.width * .42, s.height * .75), fontSize: 18, color: AppColors.secondary);
  }

  void _drawScaleSketch(Canvas c, Size s) {
    final map = Rect.fromLTWH(s.width * .14, s.height * .22, s.width * .28, s.height * .42);
    final real = Rect.fromLTWH(s.width * .58, s.height * .16, s.width * .28, s.height * .54);
    c.drawRect(map, _stroke(AppColors.secondary, 3));
    c.drawRect(real, _stroke(AppColors.accent, 3));
    _text(c, 'رسم', Offset(map.center.dx - 14, map.center.dy - 8), fontSize: 14, color: AppColors.secondary);
    _text(c, 'حقيقي', Offset(real.center.dx - 20, real.center.dy - 8), fontSize: 14, color: AppColors.accent);
    _text(c, '1 سم : 2 م', Offset(s.width * .39, s.height * .76), fontSize: 13);
  }

  void _drawSimilarPolygons(Canvas c, Size s) {
    final p1 = Path()
      ..moveTo(s.width * .16, s.height * .66)
      ..lineTo(s.width * .30, s.height * .28)
      ..lineTo(s.width * .42, s.height * .66)
      ..close();
    final p2 = Path()
      ..moveTo(s.width * .52, s.height * .72)
      ..lineTo(s.width * .70, s.height * .18)
      ..lineTo(s.width * .86, s.height * .72)
      ..close();
    c.drawPath(p1, _stroke(AppColors.secondary, 3));
    c.drawPath(p2, _stroke(AppColors.accent, 3));
    _text(c, '× 1.5', Offset(s.width * .43, s.height * .42), fontSize: 14);
    _text(c, 'نفس الزوايا • أضلاع متناسبة', Offset(s.width * .29, s.height * .80), fontSize: 10);
  }

  void _drawScaleChange(Canvas c, Size s) {
    final small = Rect.fromLTWH(s.width * .15, s.height * .35, s.width * .20, s.height * .28);
    final large = Rect.fromLTWH(s.width * .58, s.height * .22, s.width * .28, s.height * .42);
    c.drawRect(small, _fill(AppColors.secondary.withValues(alpha: .55)));
    c.drawRect(large, _fill(AppColors.accent.withValues(alpha: .55)));
    c.drawRect(small, _stroke(Colors.white, 2));
    c.drawRect(large, _stroke(Colors.white, 2));
    _text(c, '×2', Offset(s.width * .44, s.height * .39), fontSize: 20, color: AppColors.secondary);
    _text(c, 'تكبير', Offset(s.width * .42, s.height * .64), fontSize: 11);
  }

  void _drawIndirectMeasurement(Canvas c, Size s) {
    final groundY = s.height * .74;
    c.drawLine(Offset(s.width * .10, groundY), Offset(s.width * .90, groundY), _whiteStroke);
    final treeX = s.width * .30;
    c.drawLine(Offset(treeX, groundY), Offset(treeX, s.height * .20), _stroke(AppColors.secondary, 5));
    c.drawLine(Offset(treeX, s.height * .20), Offset(s.width * .55, groundY), _stroke(AppColors.secondary, 2));
    final stickX = s.width * .68;
    c.drawLine(Offset(stickX, groundY), Offset(stickX, s.height * .49), _stroke(AppColors.accent, 5));
    c.drawLine(Offset(stickX, s.height * .49), Offset(s.width * .82, groundY), _stroke(AppColors.accent, 2));
    _text(c, 'ظل الشجرة', Offset(s.width * .37, groundY + 8), fontSize: 10, color: AppColors.secondary);
    _text(c, 'ظل العصا', Offset(s.width * .70, groundY + 8), fontSize: 10, color: AppColors.accent);
  }

  void _drawPercentEstimate(Canvas c, Size s) {
    final rect = Rect.fromLTWH(s.width * .14, s.height * .38, s.width * .72, 42);
    c.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(12)), _fill(Colors.white.withValues(alpha: .12)));
    c.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(rect.left, rect.top, rect.width * .30, rect.height), const Radius.circular(12)),
      _fill(AppColors.secondary),
    );
    _text(c, '≈ 30%', Offset(rect.left + rect.width * .10, rect.top + 11), fontSize: 12, color: AppColors.primaryDark);
    _text(c, 'قريب من الثلث', Offset(s.width * .40, s.height * .67), fontSize: 13, color: AppColors.secondary);
  }

  void _drawPercentReasonableness(Canvas c, Size s) {
    final center = Offset(s.width * .50, s.height * .65);
    final radius = s.height * .35;
    c.drawArc(Rect.fromCircle(center: center, radius: radius), math.pi, math.pi, false, _stroke(Colors.white.withValues(alpha: .35), 10));
    c.drawArc(Rect.fromCircle(center: center, radius: radius), math.pi, math.pi * .72, false, _stroke(AppColors.secondary, 10));
    final angle = math.pi + math.pi * .72;
    final needle = Offset(center.dx + radius * .72 * math.cos(angle), center.dy + radius * .72 * math.sin(angle));
    c.drawLine(center, needle, _stroke(AppColors.accent, 4));
    _text(c, 'هل 72% منطقي؟', Offset(s.width * .36, s.height * .15), fontSize: 14);
  }

  void _drawPercentEquation(Canvas c, Size s) {
    _text(c, 'الجزء', Offset(s.width * .17, s.height * .26), fontSize: 16, color: AppColors.secondary);
    _text(c, '=', Offset(s.width * .36, s.height * .26), fontSize: 18);
    _text(c, 'النسبة', Offset(s.width * .45, s.height * .26), fontSize: 16, color: AppColors.accent);
    _text(c, '×', Offset(s.width * .63, s.height * .26), fontSize: 18);
    _text(c, 'الكل', Offset(s.width * .72, s.height * .26), fontSize: 16);
    _text(c, '30 = 25% × 120', Offset(s.width * .34, s.height * .56), fontSize: 18);
    _text(c, '0.25 × 120 = 30', Offset(s.width * .36, s.height * .74), fontSize: 13, color: AppColors.secondary);
  }

  void _drawPercentChange(Canvas c, Size s) {
    final base = s.height * .72;
    final oldRect = Rect.fromLTWH(s.width * .22, base - s.height * .34, s.width * .18, s.height * .34);
    final newRect = Rect.fromLTWH(s.width * .60, base - s.height * .50, s.width * .18, s.height * .50);
    c.drawRect(oldRect, _fill(AppColors.primary.withValues(alpha: .65)));
    c.drawRect(newRect, _fill(AppColors.secondary));
    _text(c, '80', Offset(oldRect.center.dx - 8, oldRect.top - 24), fontSize: 13);
    _text(c, '100', Offset(newRect.center.dx - 11, newRect.top - 24), fontSize: 13);
    _text(c, '+25%', Offset(s.width * .43, s.height * .33), fontSize: 18, color: AppColors.accent);
    _text(c, 'قديم', Offset(oldRect.center.dx - 12, base + 8), fontSize: 10);
    _text(c, 'جديد', Offset(newRect.center.dx - 12, base + 8), fontSize: 10);
  }

  void _drawLogicalReasoning(Canvas c, Size s) {
    final boxes = <String>['معطى', 'قاعدة', 'نتيجة'];
    for (var i = 0; i < boxes.length; i++) {
      final x = s.width * (.10 + i * .30);
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, s.height * .36, s.width * .20, 48),
        const Radius.circular(12),
      );
      c.drawRRect(rect, _fill(i == 2 ? AppColors.secondary : AppColors.primary.withValues(alpha: .75)));
      _text(c, boxes[i], Offset(x + s.width * .055, s.height * .44), fontSize: 12, color: i == 2 ? AppColors.primaryDark : Colors.white);
      if (i < 2) {
        _text(c, '→', Offset(x + s.width * .22, s.height * .42), fontSize: 18, color: AppColors.accent);
      }
    }
  }

  void _drawCongruentPolygons(Canvas c, Size s) {
    final left = Rect.fromLTWH(s.width * .16, s.height * .28, s.width * .24, s.height * .36);
    final right = Rect.fromLTWH(s.width * .60, s.height * .28, s.width * .24, s.height * .36);
    c.drawRect(left, _fill(AppColors.secondary.withValues(alpha: .30)));
    c.drawRect(right, _fill(AppColors.accent.withValues(alpha: .30)));
    c.drawRect(left, _stroke(AppColors.secondary, 3));
    c.drawRect(right, _stroke(AppColors.accent, 3));
    _text(c, '≅', Offset(s.width * .47, s.height * .40), fontSize: 24);
    _text(c, 'نفس الشكل والحجم', Offset(s.width * .36, s.height * .74), fontSize: 11);
  }

  void _drawTranslation(Canvas c, Size s) {
    final p1 = Rect.fromLTWH(s.width * .18, s.height * .40, 54, 54);
    final p2 = Rect.fromLTWH(s.width * .66, s.height * .24, 54, 54);
    c.drawRect(p1, _fill(AppColors.secondary.withValues(alpha: .60)));
    c.drawRect(p2, _fill(AppColors.accent.withValues(alpha: .60)));
    c.drawLine(p1.center, p2.center, _stroke(Colors.white, 3));
    _text(c, '→ 4 ، ↑ 2', Offset(s.width * .40, s.height * .55), fontSize: 12, color: AppColors.secondary);
  }

  void _drawRotation(Canvas c, Size s) {
    final center = Offset(s.width * .50, s.height * .50);
    c.drawCircle(center, 6, _fill(Colors.white));
    final p1 = Offset(s.width * .30, s.height * .50);
    final p2 = Offset(s.width * .50, s.height * .25);
    c.drawCircle(p1, 9, _fill(AppColors.secondary));
    c.drawCircle(p2, 9, _fill(AppColors.accent));
    c.drawArc(Rect.fromCircle(center: center, radius: s.width * .16), math.pi, math.pi / 2, false, _stroke(Colors.white, 3));
    _text(c, '90°', Offset(s.width * .41, s.height * .28), fontSize: 14, color: AppColors.secondary);
    _text(c, 'مركز الدوران', Offset(s.width * .43, s.height * .58), fontSize: 10);
  }

  void _drawDataTable(Canvas c, Size s) {
    final left=s.width*.22, top=s.height*.18, w=s.width*.56, h=s.height*.62;
    c.drawRect(Rect.fromLTWH(left,top,w,h), _stroke(Colors.white,2));
    c.drawLine(Offset(left+w*.58,top),Offset(left+w*.58,top+h),_stroke(Colors.white.withValues(alpha:.5)));
    for(var i=1;i<4;i++){
      c.drawLine(Offset(left,top+h*i/4),Offset(left+w,top+h*i/4),_stroke(Colors.white.withValues(alpha:.35)));
    }
    _text(c,'الفئة',Offset(left+18,top+8),fontSize:11,color:AppColors.secondary);
    _text(c,'التكرار',Offset(left+w*.63,top+8),fontSize:11,color:AppColors.secondary);
    const labels=['A','B','C']; const counts=['4','7','3'];
    for(var i=0;i<3;i++){
      _text(c,labels[i],Offset(left+28,top+h*(.30+i*.25)),fontSize:12);
      _text(c,counts[i],Offset(left+w*.72,top+h*(.30+i*.25)),fontSize:12);
    }
  }

  void _drawCentralTendency(Canvas c, Size s) {
    final y=s.height*.55; final left=s.width*.14; final right=s.width*.86;
    c.drawLine(Offset(left,y),Offset(right,y),_whiteStroke);
    const vals=[2.0,4.0,4.0,6.0,9.0];
    for(final v in vals){
      final x=left+(right-left)*(v-2)/7;
      c.drawCircle(Offset(x,y-16),7,_fill(v==4?AppColors.secondary:AppColors.accent));
    }
    _text(c,'2   4   4   6   9',Offset(s.width*.31,s.height*.67),fontSize:12);
    _text(c,'الوسيط 4 • المنوال 4 • المدى 7',Offset(s.width*.25,s.height*.22),fontSize:12,color:AppColors.secondary);
  }

  void _drawDispersion(Canvas c, Size s) {
    final left=s.width*.18, right=s.width*.82;
    final y1=s.height*.34, y2=s.height*.68;
    c.drawLine(Offset(left,y1),Offset(right,y1),_stroke(Colors.white.withValues(alpha:.45)));
    c.drawLine(Offset(left,y2),Offset(right,y2),_stroke(Colors.white.withValues(alpha:.45)));
    for(final frac in [.42,.48,.54]){
      c.drawCircle(Offset(left+(right-left)*frac,y1),7,_fill(AppColors.secondary));
    }
    for(final frac in [.05,.50,.95]){
      c.drawCircle(Offset(left+(right-left)*frac,y2),7,_fill(AppColors.accent));
    }
    _text(c,'تشتت قليل',Offset(s.width*.40,y1-34),fontSize:11,color:AppColors.secondary);
    _text(c,'تشتت كبير',Offset(s.width*.39,y2-34),fontSize:11,color:AppColors.accent);
  }

  void _drawChooseDisplay(Canvas c, Size s) {
    final xs=[s.width*.22,s.width*.50,s.width*.78];
    final y=s.height*.46;
    c.drawRect(Rect.fromLTWH(xs[0]-28,y-30,56,60),_fill(AppColors.secondary.withValues(alpha:.65)));
    c.drawCircle(Offset(xs[1],y),30,_fill(AppColors.accent.withValues(alpha:.65)));
    c.drawLine(Offset(xs[2]-28,y+20),Offset(xs[2]+28,y-20),_stroke(Colors.white,4));
    _text(c,'أعمدة',Offset(xs[0]-19,y+38),fontSize:10);
    _text(c,'قطاعات',Offset(xs[1]-20,y+38),fontSize:10);
    _text(c,'اتجاه',Offset(xs[2]-16,y+38),fontSize:10);
    _text(c,'اختر حسب السؤال',Offset(s.width*.38,s.height*.78),fontSize:11,color:AppColors.secondary);
  }

  void _drawCompoundOutcomes(Canvas c, Size s) {
    final left=s.width*.20, top=s.height*.20, cellW=s.width*.20, cellH=s.height*.22;
    const rows=['ص','ك']; const cols=['1','2','3'];
    for(var r=0;r<2;r++){
      for(var col=0;col<3;col++){
        final rect=Rect.fromLTWH(left+col*cellW,top+r*cellH,cellW,cellH);
        c.drawRect(rect,_fill((r+col).isEven?AppColors.primary.withValues(alpha:.55):AppColors.secondary.withValues(alpha:.35)));
        c.drawRect(rect,_stroke(Colors.white.withValues(alpha:.5)));
        _text(c,'${rows[r]}-${cols[col]}',Offset(rect.left+cellW*.32,rect.top+cellH*.35),fontSize:11);
      }
    }
    _text(c,'2 × 3 = 6 نواتج',Offset(s.width*.36,s.height*.74),fontSize:13,color:AppColors.secondary);
  }

  void _drawProbabilityRepresentation(Canvas c, Size s) {
    _text(c,'تجربة',Offset(s.width*.12,s.height*.42),fontSize:14,color:AppColors.secondary);
    c.drawLine(Offset(s.width*.25,s.height*.48),Offset(s.width*.40,s.height*.30),_whiteStroke);
    c.drawLine(Offset(s.width*.25,s.height*.48),Offset(s.width*.40,s.height*.66),_whiteStroke);
    _text(c,'A',Offset(s.width*.42,s.height*.22),fontSize:13);
    _text(c,'B',Offset(s.width*.42,s.height*.64),fontSize:13);
    c.drawLine(Offset(s.width*.47,s.height*.30),Offset(s.width*.70,s.height*.22),_stroke(AppColors.secondary,2));
    c.drawLine(Offset(s.width*.47,s.height*.30),Offset(s.width*.70,s.height*.38),_stroke(AppColors.secondary,2));
    c.drawLine(Offset(s.width*.47,s.height*.66),Offset(s.width*.70,s.height*.58),_stroke(AppColors.accent,2));
    c.drawLine(Offset(s.width*.47,s.height*.66),Offset(s.width*.70,s.height*.74),_stroke(AppColors.accent,2));
    _text(c,'مثّل كل خطوة قبل العد',Offset(s.width*.36,s.height*.82),fontSize:10);
  }

  void _drawThreeDimensionalShapes(Canvas c, Size s) {
    final centers=[s.width*.22,s.width*.50,s.width*.78];
    c.drawRect(Rect.fromCenter(center:Offset(centers[0],s.height*.46),width:55,height:70),_stroke(AppColors.secondary,3));
    c.drawOval(Rect.fromCenter(center:Offset(centers[1],s.height*.35),width:58,height:18),_stroke(AppColors.accent,3));
    c.drawOval(Rect.fromCenter(center:Offset(centers[1],s.height*.61),width:58,height:18),_stroke(AppColors.accent,3));
    c.drawLine(Offset(centers[1]-29,s.height*.35),Offset(centers[1]-29,s.height*.61),_stroke(AppColors.accent,3));
    c.drawLine(Offset(centers[1]+29,s.height*.35),Offset(centers[1]+29,s.height*.61),_stroke(AppColors.accent,3));
    final p=Path()..moveTo(centers[2],s.height*.24)..lineTo(centers[2]-34,s.height*.64)..lineTo(centers[2]+34,s.height*.64)..close();
    c.drawPath(p,_stroke(Colors.white,3));
    _text(c,'منشور',Offset(centers[0]-20,s.height*.72),fontSize:10);
    _text(c,'أسطوانة',Offset(centers[1]-22,s.height*.72),fontSize:10);
    _text(c,'هرم',Offset(centers[2]-11,s.height*.72),fontSize:10);
  }

  void _drawPrismCylinderVolume(Canvas c, Size s) {
    final center=Offset(s.width*.50,s.height*.47);
    final top=Rect.fromCenter(center:Offset(center.dx,s.height*.27),width:90,height:24);
    final bottom=Rect.fromCenter(center:Offset(center.dx,s.height*.67),width:90,height:24);
    c.drawOval(top,_stroke(AppColors.secondary,3)); c.drawOval(bottom,_stroke(AppColors.secondary,3));
    c.drawLine(Offset(top.left,top.center.dy),Offset(bottom.left,bottom.center.dy),_stroke(AppColors.secondary,3));
    c.drawLine(Offset(top.right,top.center.dy),Offset(bottom.right,bottom.center.dy),_stroke(AppColors.secondary,3));
    _text(c,'B',Offset(center.dx-5,s.height*.24),fontSize:14,color:AppColors.secondary);
    _text(c,'h',Offset(top.right+12,s.height*.45),fontSize:14,color:AppColors.accent);
    _text(c,'V = B × h',Offset(s.width*.40,s.height*.78),fontSize:16);
  }

  void _drawPyramidConeVolume(Canvas c, Size s) {
    final apex=Offset(s.width*.50,s.height*.18);
    final left=Offset(s.width*.30,s.height*.68), right=Offset(s.width*.70,s.height*.68);
    c.drawLine(apex,left,_stroke(AppColors.secondary,3));
    c.drawLine(apex,right,_stroke(AppColors.secondary,3));
    c.drawOval(Rect.fromCenter(center:Offset(s.width*.50,s.height*.68),width:s.width*.40,height:28),_stroke(AppColors.secondary,3));
    c.drawLine(apex,Offset(s.width*.50,s.height*.68),_stroke(AppColors.accent,2));
    _text(c,'h',Offset(s.width*.52,s.height*.40),fontSize:13,color:AppColors.accent);
    _text(c,'V = ⅓ B h',Offset(s.width*.39,s.height*.79),fontSize:17);
  }

  void _drawCylinderNet(Canvas c, Size s) {
    final rect=Rect.fromLTWH(s.width*.31,s.height*.28,s.width*.38,s.height*.36);
    c.drawRect(rect,_fill(AppColors.secondary.withValues(alpha:.30)));
    c.drawRect(rect,_stroke(AppColors.secondary,3));
    c.drawCircle(Offset(s.width*.22,s.height*.46),28,_stroke(AppColors.accent,3));
    c.drawCircle(Offset(s.width*.78,s.height*.46),28,_stroke(AppColors.accent,3));
    _text(c,'مستطيل + دائرتان',Offset(s.width*.36,s.height*.73),fontSize:12);
  }

  void _drawPyramidNet(Canvas c, Size s) {
    final center=Rect.fromCenter(center:Offset(s.width*.50,s.height*.50),width:70,height:70);
    c.drawRect(center,_fill(AppColors.secondary.withValues(alpha:.25)));
    c.drawRect(center,_stroke(AppColors.secondary,3));
    final top=Path()..moveTo(center.left,center.top)..lineTo(center.center.dx,s.height*.18)..lineTo(center.right,center.top)..close();
    final bottom=Path()..moveTo(center.left,center.bottom)..lineTo(center.center.dx,s.height*.82)..lineTo(center.right,center.bottom)..close();
    final left=Path()..moveTo(center.left,center.top)..lineTo(s.width*.24,center.center.dy)..lineTo(center.left,center.bottom)..close();
    final right=Path()..moveTo(center.right,center.top)..lineTo(s.width*.76,center.center.dy)..lineTo(center.right,center.bottom)..close();
    for(final p in [top,bottom,left,right]){c.drawPath(p,_stroke(AppColors.accent,3));}
    _text(c,'قاعدة + 4 مثلثات',Offset(s.width*.37,s.height*.86),fontSize:11);
  }

  void _drawSimplerProblem(Canvas c, Size s) {
    final complex=Path()..moveTo(s.width*.12,s.height*.28)..lineTo(s.width*.36,s.height*.28)..lineTo(s.width*.36,s.height*.48)..lineTo(s.width*.48,s.height*.48)..lineTo(s.width*.48,s.height*.70)..lineTo(s.width*.12,s.height*.70)..close();
    c.drawPath(complex,_stroke(AppColors.accent,3));
    _text(c,'معقّد',Offset(s.width*.22,s.height*.74),fontSize:10,color:AppColors.accent);
    _text(c,'→',Offset(s.width*.49,s.height*.45),fontSize:22,color:AppColors.secondary);
    final r1=Rect.fromLTWH(s.width*.60,s.height*.30,s.width*.16,s.height*.38);
    final r2=Rect.fromLTWH(s.width*.76,s.height*.50,s.width*.10,s.height*.18);
    c.drawRect(r1,_fill(AppColors.secondary.withValues(alpha:.40))); c.drawRect(r1,_stroke(AppColors.secondary,2));
    c.drawRect(r2,_fill(AppColors.primary.withValues(alpha:.50))); c.drawRect(r2,_stroke(Colors.white,2));
    _text(c,'جزآن أبسط',Offset(s.width*.64,s.height*.74),fontSize:10);
  }

  void _drawSimplifyExpressions(Canvas c, Size s) {
    _text(c,'3x + 2x + 4',Offset(s.width*.24,s.height*.22),fontSize:21);
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(s.width*.20,s.height*.45,s.width*.22,42),const Radius.circular(12)),_fill(AppColors.secondary));
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(s.width*.44,s.height*.45,s.width*.22,42),const Radius.circular(12)),_fill(AppColors.secondary.withValues(alpha:.75)));
    _text(c,'3x',Offset(s.width*.27,s.height*.49),fontSize:14,color:AppColors.primaryDark);
    _text(c,'2x',Offset(s.width*.51,s.height*.49),fontSize:14,color:AppColors.primaryDark);
    _text(c,'→ 5x + 4',Offset(s.width*.38,s.height*.71),fontSize:18,color:AppColors.accent);
  }

  void _drawWriteEquation(Canvas c, Size s) {
    _text(c,'"ضعف عدد + 3 = 11"',Offset(s.width*.24,s.height*.22),fontSize:15);
    _text(c,'↓',Offset(s.width*.49,s.height*.38),fontSize:20,color:AppColors.secondary);
    _text(c,'2x + 3 = 11',Offset(s.width*.35,s.height*.57),fontSize:22,color:AppColors.secondary);
    _text(c,'الكلمات → معادلة',Offset(s.width*.39,s.height*.76),fontSize:11);
  }

  void _drawVariablesBothSides(Canvas c, Size s) {
    _text(c,'6x + 1',Offset(s.width*.16,s.height*.28),fontSize:18,color:AppColors.secondary);
    _text(c,'=',Offset(s.width*.48,s.height*.28),fontSize:20);
    _text(c,'4x + 11',Offset(s.width*.60,s.height*.28),fontSize:18,color:AppColors.accent);
    c.drawLine(Offset(s.width*.18,s.height*.56),Offset(s.width*.82,s.height*.56),_stroke(Colors.white.withValues(alpha:.45),2));
    _text(c,'اطرح 4x من الطرفين',Offset(s.width*.34,s.height*.64),fontSize:12);
    _text(c,'2x + 1 = 11',Offset(s.width*.38,s.height*.77),fontSize:16,color:AppColors.secondary);
  }

  void _drawGuessCheck(Canvas c, Size s) {
    const guesses=['3','4','5']; const results=['14','17','20'];
    _text(c,'تخمين',Offset(s.width*.22,s.height*.18),fontSize:12,color:AppColors.secondary);
    _text(c,'نتيجة',Offset(s.width*.62,s.height*.18),fontSize:12,color:AppColors.secondary);
    for(var i=0;i<3;i++){
      final y=s.height*(.34+i*.17);
      _text(c,guesses[i],Offset(s.width*.27,y),fontSize:14);
      _text(c,results[i],Offset(s.width*.66,y),fontSize:14,color:i==2?AppColors.secondary:Colors.white);
    }
    _text(c,'الهدف = 20 ✓',Offset(s.width*.40,s.height*.82),fontSize:12,color:AppColors.secondary);
  }

  void _drawModelStrategy(Canvas c, Size s) {
    _text(c,'12 ريال ثابتة',Offset(s.width*.12,s.height*.26),fontSize:14,color:AppColors.secondary);
    _text(c,'+',Offset(s.width*.38,s.height*.26),fontSize:16);
    _text(c,'5 لكل زيارة',Offset(s.width*.48,s.height*.26),fontSize:14,color:AppColors.accent);
    _text(c,'↓',Offset(s.width*.49,s.height*.44),fontSize:18);
    _text(c,'y = 5x + 12',Offset(s.width*.36,s.height*.60),fontSize:21);
    _text(c,'موقف حقيقي → نموذج رياضي',Offset(s.width*.31,s.height*.78),fontSize:11);
  }

  void _drawGraphLinearFunction(Canvas c, Size s) {
    final origin=Offset(s.width*.18,s.height*.78);
    c.drawLine(origin,Offset(s.width*.86,origin.dy),_whiteStroke);
    c.drawLine(origin,Offset(origin.dx,s.height*.16),_whiteStroke);
    final points=[
      Offset(s.width*.30,s.height*.66),
      Offset(s.width*.46,s.height*.53),
      Offset(s.width*.62,s.height*.40),
      Offset(s.width*.78,s.height*.27),
    ];
    for(final p in points){c.drawCircle(p,7,_fill(AppColors.accent));}
    c.drawLine(points.first,points.last,_stroke(AppColors.secondary,3));
    _text(c,'جدول قيم → نقاط → خط',Offset(s.width*.34,s.height*.84),fontSize:10);
  }

  void _drawDirectVariation(Canvas c, Size s) {
    final origin=Offset(s.width*.20,s.height*.76);
    c.drawLine(origin,Offset(s.width*.86,origin.dy),_whiteStroke);
    c.drawLine(origin,Offset(origin.dx,s.height*.16),_whiteStroke);
    c.drawLine(origin,Offset(s.width*.78,s.height*.28),_stroke(AppColors.secondary,4));
    c.drawCircle(origin,8,_fill(AppColors.accent));
    _text(c,'يمر بالأصل',Offset(origin.dx+12,origin.dy-26),fontSize:10,color:AppColors.accent);
    _text(c,'y = kx',Offset(s.width*.57,s.height*.23),fontSize:17,color:AppColors.secondary);
  }

  void _drawSquareRootVisual(Canvas c, Size s) {
    final side = math.min(s.width, s.height) * .48;
    final left = s.width * .28;
    final top = s.height * .17;
    final rect = Rect.fromLTWH(left, top, side, side);
    c.drawRect(rect, _fill(AppColors.secondary.withValues(alpha: .22)));
    c.drawRect(rect, _stroke(AppColors.secondary, 3));
    _text(c, 'المساحة = 49', Offset(left + side * .22, top + side * .40), fontSize: 15);
    _text(c, '؟', Offset(left + side + 16, top + side * .45), fontSize: 18, color: AppColors.accent);
    _text(c, '√49 = 7', Offset(s.width * .39, s.height * .76), fontSize: 18, color: AppColors.secondary);
  }

  void _drawRealNumberClassification(Canvas c, Size s) {
    final labels = <String>['حقيقية', 'نسبية', 'صحيحة', 'طبيعية'];
    for (var i = 0; i < labels.length; i++) {
      final inset = 14.0 + i * 22;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTRB(
          s.width * .10 + inset,
          s.height * .13 + inset * .45,
          s.width * .90 - inset,
          s.height * .80 - inset * .25,
        ),
        const Radius.circular(18),
      );
      c.drawRRect(
        rect,
        _stroke(
          i.isEven ? AppColors.secondary : AppColors.accent,
          2,
        ),
      );
      _text(
        c,
        labels[i],
        Offset(rect.left + 8, rect.top + 7),
        fontSize: 10,
        color: i.isEven ? AppColors.secondary : AppColors.accent,
      );
    }
    _text(c, '√2 غير نسبي لكنه حقيقي', Offset(s.width * .37, s.height * .84), fontSize: 10);
  }

  void _drawPythagoreanApplication(Canvas c, Size s) {
    final groundY=s.height*.76;
    final wallX=s.width*.28;
    c.drawLine(Offset(wallX,s.height*.16),Offset(wallX,groundY),_stroke(Colors.white,4));
    c.drawLine(Offset(wallX,groundY),Offset(s.width*.82,groundY),_stroke(Colors.white,4));
    c.drawLine(Offset(wallX,s.height*.25),Offset(s.width*.72,groundY),_stroke(AppColors.secondary,5));
    c.drawRect(Rect.fromLTWH(wallX,groundY-18,18,18),_stroke(AppColors.accent,2));
    _text(c,'الجدار 4م',Offset(s.width*.12,s.height*.44),fontSize:11);
    _text(c,'الأرض 3م',Offset(s.width*.46,groundY+8),fontSize:11);
    _text(c,'السلم ؟',Offset(s.width*.52,s.height*.42),fontSize:13,color:AppColors.secondary);
  }

  @override
  bool shouldRepaint(covariant _LessonVisualPainter oldDelegate) =>
      oldDelegate.kind != kind || oldDelegate.lessonId != lessonId;
}
