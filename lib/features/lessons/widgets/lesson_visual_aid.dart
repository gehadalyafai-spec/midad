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
            _caption(kind),
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
                painter: _LessonVisualPainter(kind),
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
          ..._insights(kind).map(
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
                        _realLifeExample(kind),
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
  _LessonVisualPainter(this.kind);

  final LessonVisualKind kind;

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

  @override
  bool shouldRepaint(covariant _LessonVisualPainter oldDelegate) =>
      oldDelegate.kind != kind;
}
