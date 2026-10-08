import 'grade2_math_lesson_content.dart';

const probabilityLessonContent = <String, LessonContent>{
  'count-outcomes': LessonContent(
    conceptLabel: 'عد النواتج',
    conceptMain: 'نظّم كل الاحتمالات',
    conceptHint: 'قائمة • جدول • شجرة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عند وجود تجربة متعددة الخطوات نحتاج إلى عد جميع النواتج الممكنة بطريقة منظمة حتى لا ننسى أي حالة.',
    sectionTwoTitle: 'كيف أعدها؟',
    sectionTwoBody:
        'يمكن استخدام قائمة مرتبة أو جدول أو مخطط شجري. وإذا كانت الخطوات مستقلة يمكن ضرب عدد الخيارات في كل خطوة.',
    exampleFormula: '3 قمصان × 2 بنطال = 6 نواتج',
    exampleBody:
        'كل قميص يمكن أن يقترن بكل بنطال، لذلك عدد التركيبات 3×2=6.',
    warning:
        'لا تجمع عدد الخيارات في الخطوات المستقلة عندما يكون المطلوب جميع التركيبات؛ استخدم مبدأ العد الأساسي.',
    practiceQuestion: 'لدى طالب قلمان و3 دفاتر. كم اختيارًا ممكنًا لقلم ودفتر؟',
    practiceOptions: ['5', '6', '8', '9'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 2×3=6 اختيارات ممكنة.',
  ),
  'compound-events': LessonContent(
    conceptLabel: 'حادث مركب',
    conceptMain: 'أكثر من خطوة',
    conceptHint: 'احسب النواتج الملائمة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الحادث المركب يتكون من حدثين بسيطين أو أكثر، مثل رمي قطعة نقد ثم رمي مكعب أرقام.',
    sectionTwoTitle: 'كيف أحسب الاحتمال؟',
    sectionTwoBody:
        'حدد فضاء العينة كاملًا، ثم عد النواتج التي تحقق الحادث، وبعدها اقسم عدد النواتج الملائمة على عدد النواتج الممكنة.',
    exampleFormula: 'النواتج الملائمة / جميع النواتج',
    exampleBody:
        'إذا كان هناك 8 نواتج ممكنة و2 منها تحقق الحادث، فالاحتمال 2/8=1/4.',
    warning:
        'لا تحسب احتمال الحادث المركب قبل تحديد فضاء العينة كاملًا.',
    practiceQuestion: 'من 12 ناتجًا ممكنًا، 3 تحقق الحادث. ما الاحتمال؟',
    practiceOptions: ['1/2', '1/3', '1/4', '3/4'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 3/12 تبسط إلى 1/4.',
  ),
  'theoretical-experimental': LessonContent(
    conceptLabel: 'نوعا الاحتمال',
    conceptMain: 'نظري ↔ تجريبي',
    conceptHint: 'متوقع مقابل ملاحظ',
    sectionOneTitle: 'الاحتمال النظري',
    sectionOneBody:
        'الاحتمال النظري يعتمد على النواتج الممكنة المتساوية في الفرصة دون إجراء التجربة فعليًا.',
    sectionTwoTitle: 'الاحتمال التجريبي',
    sectionTwoBody:
        'الاحتمال التجريبي يعتمد على نتائج تجربة فعلية، ويحسب بقسمة عدد مرات وقوع الحدث على عدد التجارب.',
    exampleFormula: '18 نجاحًا من 60 تجربة → 18/60 = 0.3',
    exampleBody:
        'هذا احتمال تجريبي لأنه يعتمد على نتائج حدثت فعليًا.',
    warning:
        'قد يختلف الاحتمال التجريبي عن النظري في التجارب القليلة، لكنه يميل إليه مع زيادة عدد التجارب.',
    practiceQuestion: 'ظهر الرقم 6 عشر مرات في 50 رمية. الاحتمال التجريبي؟',
    practiceOptions: ['1/5', '1/6', '1/10', '1/50'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: 10/50=1/5.',
  ),
  'represent-problem': LessonContent(
    conceptLabel: 'تمثيل المسألة',
    conceptMain: 'ارسم أو نمذج',
    conceptHint: 'اجعل الاحتمالات مرئية',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'تمثيل المسألة يساعد على رؤية جميع الحالات الممكنة والعلاقات بينها، خاصة في مسائل الاحتمال متعددة الخطوات.',
    sectionTwoTitle: 'أدوات التمثيل',
    sectionTwoBody:
        'استخدم مخططًا شجريًا أو جدولًا أو قائمة منظمة بحسب طبيعة التجربة وعدد الخطوات.',
    exampleFormula: 'اختيار أ ثم ب → فرعان في الشجرة',
    exampleBody:
        'كل خيار في الخطوة الأولى يتفرع إلى خيارات الخطوة الثانية، وبذلك تظهر جميع النواتج بوضوح.',
    warning:
        'تأكد أن التمثيل يشمل جميع الفروع ولا يكرر النتيجة نفسها دون سبب.',
    practiceQuestion: 'أي أداة مناسبة لتجربة من خطوتين؟',
    practiceOptions: ['مخطط شجري', 'مسطرة فقط', 'دائرة بلا بيانات', 'خط أعداد فقط'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: المخطط الشجري مناسب لعرض نتائج الخطوات المتتابعة.',
  ),
  'sampling-prediction': LessonContent(
    conceptLabel: 'المعاينة',
    conceptMain: 'عينة → تنبؤ',
    conceptHint: 'مثل المجتمع قدر الإمكان',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'نستخدم عينة من مجتمع كبير لتقدير خصائص المجتمع كله عندما يكون فحص كل الأفراد صعبًا.',
    sectionTwoTitle: 'العينة الجيدة',
    sectionTwoBody:
        'ينبغي أن تكون العينة ممثلة للمجتمع وغير متحيزة، وأن يكون حجمها مناسبًا حتى يكون التنبؤ أكثر موثوقية.',
    exampleFormula: '30% من عينة 200 → نحو 30% من المجتمع',
    exampleBody:
        'إذا كانت العينة ممثلة جيدًا، يمكن استخدام نسبتها لتقدير النسبة المتوقعة في المجتمع.',
    warning:
        'العينة المتحيزة قد تعطي تنبؤًا مضللًا حتى لو كان حجمها كبيرًا.',
    practiceQuestion: 'أي عينة أفضل لتقدير رأي طلاب المدرسة؟',
    practiceOptions: ['طلاب صف واحد فقط', 'طلاب مختارون عشوائيًا من صفوف مختلفة', 'أصدقاء الباحث فقط', 'طلاب النشاط الرياضي فقط'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: العينة العشوائية من صفوف مختلفة أكثر تمثيلًا للمدرسة.',
  ),
};
