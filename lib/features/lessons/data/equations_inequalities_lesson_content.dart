import 'grade2_math_lesson_content.dart';

const equationsInequalitiesLessonContent = <String, LessonContent>{
  'simplify-expressions': LessonContent(
    conceptLabel: 'التبسيط',
    conceptMain: 'اجمع الحدود المتشابهة',
    conceptHint: 'المتغير والأس نفسيهما',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'تبسيط العبارة الجبرية يعني كتابتها بصورة مكافئة أبسط باستخدام خصائص العمليات وجمع الحدود المتشابهة.',
    sectionTwoTitle: 'الحدود المتشابهة',
    sectionTwoBody:
        'يمكن جمع أو طرح الحدود التي لها المتغير نفسه والأس نفسه، مثل 3س + 5س = 8س.',
    exampleFormula: '4x + 3 + 2x - 1 = 6x + 2',
    exampleBody:
        'جمعنا حدود x معًا والثوابت معًا.',
    warning:
        'لا تجمع حدودًا غير متشابهة مثل 3x و2y.',
    practiceQuestion: 'بسّط: 5س + 2س - 3.',
    practiceOptions: ['7س - 3', '7س', '10س - 3', '3س - 3'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: 5س + 2س = 7س، ويبقى -3.',
  ),
  'two-step-equations': LessonContent(
    conceptLabel: 'معادلة خطوتين',
    conceptMain: 'اعكس العمليات',
    conceptHint: 'حافظ على توازن الطرفين',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'لحل معادلة ذات خطوتين نعكس العمليات بترتيب مناسب حتى نعزل المتغير مع المحافظة على تساوي الطرفين.',
    sectionTwoTitle: 'مثال للترتيب',
    sectionTwoBody:
        'في 3س + 5 = 20 نطرح 5 أولًا ثم نقسم على 3.',
    exampleFormula: '3x + 5 = 20 → 3x = 15 → x = 5',
    exampleBody:
        'أجرينا العملية نفسها على طرفي المعادلة في كل خطوة.',
    warning:
        'أي عملية تجريها على طرف يجب أن تجريها على الطرف الآخر.',
    practiceQuestion: 'حل: 2س + 6 = 18.',
    practiceOptions: ['4', '6', '8', '12'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 2س=12، إذن س=6.',
  ),
  'write-two-step-equations': LessonContent(
    conceptLabel: 'ترجمة لفظية',
    conceptMain: 'كلمات → معادلة',
    conceptHint: 'حدد المجهول أولًا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يمكن تحويل موقف لفظي إلى معادلة باختيار متغير للمجهول ثم ترجمة العلاقات والعمليات إلى رموز.',
    sectionTwoTitle: 'كلمات مهمة',
    sectionTwoBody:
        'أكثر من تعني جمعًا، أقل من قد تعني طرحًا مع الانتباه للترتيب، ضعف العدد يعني 2س.',
    exampleFormula: 'ضعف عدد زائد 3 يساوي 15 → 2x + 3 = 15',
    exampleBody:
        'بعد كتابة المعادلة نحلها بالطريقة المعتادة.',
    warning:
        'عبارة أقل من تحتاج انتباهًا لترتيب الطرح.',
    practiceQuestion: 'ثلاثة أمثال عدد ناقص 4 يساوي 11. المعادلة؟',
    practiceOptions: ['3س-4=11', '3س+4=11', 'س-4=33', '4س-3=11'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: ثلاثة أمثال العدد = 3س ثم ناقص 4.',
  ),
  'variables-both-sides': LessonContent(
    conceptLabel: 'متغير في الطرفين',
    conceptMain: 'اجمع المتغيرات في جهة',
    conceptHint: 'ثم اعزل المتغير',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عندما يظهر المتغير في طرفي المعادلة، ننقل حدود المتغير إلى طرف واحد والثوابت إلى الطرف الآخر باستخدام العمليات العكسية.',
    sectionTwoTitle: 'خطوات عملية',
    sectionTwoBody:
        'ابدأ بتقليل عدد الحدود المتغيرة في أحد الطرفين، ثم أكمل الحل كمعادلة عادية.',
    exampleFormula: '5x + 2 = 3x + 10 → 2x = 8 → x = 4',
    exampleBody:
        'طرحنا 3x من الطرفين ثم طرحنا 2.',
    warning:
        'راقب الإشارات عند نقل الحدود ولا تختصر حدودًا من طرف واحد فقط.',
    practiceQuestion: 'حل: 4س + 3 = 2س + 11.',
    practiceOptions: ['2', '4', '6', '7'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 2س=8، إذن س=4.',
  ),
  'guess-check-strategy': LessonContent(
    conceptLabel: 'التخمين والتحقق',
    conceptMain: 'خمّن → اختبر → عدّل',
    conceptHint: 'استخدم التغذية الراجعة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'في بعض المسائل يمكن اختيار قيمة معقولة ثم التحقق منها، وبعد ذلك تعديل التخمين بناءً على النتيجة حتى نصل للحل.',
    sectionTwoTitle: 'كيف يكون التخمين ذكيًا؟',
    sectionTwoBody:
        'استخدم حدودًا أو أنماطًا من المعطيات لتقليل عدد المحاولات بدل التخمين العشوائي.',
    exampleFormula: 'التخمين 5 → التحقق لا يطابق → جرّب 6',
    exampleBody:
        'كل محاولة تعطي معلومة تساعد على تحسين التخمين التالي.',
    warning:
        'التخمين وحده ليس حلًا؛ يجب التحقق من القيمة داخل شروط المسألة.',
    practiceQuestion: 'ما الخطوة التي تأتي بعد التخمين؟',
    practiceOptions: ['التحقق', 'الحذف', 'التجاهل', 'التقريب دائمًا'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: نختبر التخمين في شروط المسألة.',
  ),
  'inequalities': LessonContent(
    conceptLabel: 'متباينة',
    conceptMain: '< > ≤ ≥',
    conceptHint: 'مجموعة من الحلول',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'المتباينة تقارن بين مقدارين ولا تقتصر عادةً على قيمة واحدة، بل تمثل مجموعة قيم تحقق الشرط.',
    sectionTwoTitle: 'تمثيلها',
    sectionTwoBody:
        'يمكن تمثيل المتباينة على خط الأعداد بدائرة مفتوحة للحد غير المشمول ودائرة مغلقة للحد المشمول.',
    exampleFormula: 'x > 3',
    exampleBody:
        'يشمل جميع الأعداد الأكبر من 3 ولا يشمل العدد 3 نفسه.',
    warning:
        'فرّق بين > و≥؛ الثانية تشمل قيمة الحد.',
    practiceQuestion: 'أي رمز يعني "على الأقل"؟',
    practiceOptions: ['<', '>', '≤', '≥'],
    practiceCorrectIndex: 3,
    practiceFeedback:
        'صحيح: "على الأقل" تعني أكبر من أو يساوي.',
  ),
  'solve-inequalities': LessonContent(
    conceptLabel: 'حل المتباينات',
    conceptMain: 'حل كالمعادلة',
    conceptHint: 'واعكس الرمز عند ضرب/قسمة سالب',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'نحل المتباينات بخطوات مشابهة للمعادلات، مع قاعدة مهمة عند الضرب أو القسمة في عدد سالب.',
    sectionTwoTitle: 'قاعدة الإشارة',
    sectionTwoBody:
        'عند ضرب أو قسمة طرفي المتباينة في عدد سالب يجب عكس اتجاه رمز المتباينة.',
    exampleFormula: '-2x > 6 → x < -3',
    exampleBody:
        'قسمنا الطرفين على -2 فعكسنا الرمز من > إلى <.',
    warning:
        'نسيان عكس الرمز عند القسمة أو الضرب في سالب من أكثر الأخطاء شيوعًا.',
    practiceQuestion: 'حل: -3س < 9.',
    practiceOptions: ['س < -3', 'س > -3', 'س < 3', 'س > 3'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: بالقسمة على -3 نعكس الرمز، فيصبح س > -3.',
  ),
};
