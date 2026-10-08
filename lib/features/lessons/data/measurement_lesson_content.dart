import 'grade2_math_lesson_content.dart';

const measurementLessonContent = <String, LessonContent>{
  'composite-areas': LessonContent(
    conceptLabel: 'مساحات مركبة',
    conceptMain: 'قسّم ثم اجمع',
    conceptHint: 'أشكال بسيطة داخل شكل أكبر',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الشكل المركب يتكون من شكلين بسيطين أو أكثر. لإيجاد مساحته نقسمه إلى أشكال معروفة ثم نجمع المساحات أو نطرح الجزء المفقود.',
    sectionTwoTitle: 'كيف أختار التقسيم؟',
    sectionTwoBody:
        'اختر تقسيمًا يجعل الأبعاد واضحة ويقلل عدد العمليات. يمكن تقسيم الشكل إلى مستطيلات ومثلثات ودوائر بحسب الحالة.',
    exampleFormula: 'مساحة الشكل = مساحة 1 + مساحة 2',
    exampleBody:
        'إذا كان الشكل مكونًا من مستطيل مساحته 24 ومثلث مساحته 6، فالمساحة الكلية 30 وحدة مربعة.',
    warning:
        'لا تجمع الأطوال بدل المساحات؛ احسب مساحة كل جزء أولًا.',
    practiceQuestion: 'شكل مركب مساحتا جزأيه 18 و12. ما المساحة الكلية؟',
    practiceOptions: ['6', '24', '30', '216'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 18+12=30 وحدة مربعة.',
  ),
  'simpler-problem-strategy': LessonContent(
    conceptLabel: 'حل مسألة أبسط',
    conceptMain: 'بسّط ثم عمّم',
    conceptHint: 'ابدأ بحالة أسهل',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عندما تبدو المسألة معقدة، يمكن حل حالة أبسط مشابهة لاكتشاف القاعدة أو الخطوات ثم تطبيقها على المسألة الأصلية.',
    sectionTwoTitle: 'متى تفيد؟',
    sectionTwoBody:
        'تفيد في الأشكال المركبة أو الأنماط أو المسائل التي تحتوي على عدة أجزاء مترابطة.',
    exampleFormula: 'حل شكل من جزأين قبل شكل من خمسة أجزاء',
    exampleBody:
        'بعد فهم طريقة جمع مساحتي جزأين، يمكن تكرار الخطوات مع عدد أكبر من الأجزاء.',
    warning:
        'يجب أن تبقى العلاقة الأساسية نفسها بين المسألة الأبسط والأصلية.',
    practiceQuestion: 'ما أول خطوة مناسبة لمسألة معقدة جدًا؟',
    practiceOptions: ['اختيار حالة أبسط مشابهة', 'تجاهل المعطيات', 'ضرب كل الأعداد', 'تخمين الجواب النهائي'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: حل حالة أبسط مشابهة يساعد على اكتشاف الطريقة.',
  ),
  'three-dimensional-shapes': LessonContent(
    conceptLabel: 'مجسمات',
    conceptMain: 'أوجه • أحرف • رؤوس',
    conceptHint: 'ثلاثة أبعاد',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الشكل الثلاثي الأبعاد له طول وعرض وارتفاع، ويتكون غالبًا من أوجه وأحرف ورؤوس بحسب نوع المجسم.',
    sectionTwoTitle: 'أمثلة مهمة',
    sectionTwoBody:
        'المنشور له قاعدتان متطابقتان ومتوازيتان، والأسطوانة لها قاعدتان دائريتان، والهرم له قاعدة واحدة وأوجه جانبية مثلثة.',
    exampleFormula: 'المنشور: قاعدتان متوازيتان ومتطابقتان',
    exampleBody:
        'اسم المنشور يعتمد على شكل القاعدة، مثل منشور ثلاثي أو رباعي.',
    warning:
        'لا تخلط بين الوجه والحرف والرأس؛ الوجه سطح، والحرف تقاطع وجهين، والرأس نقطة تقاطع أحرف.',
    practiceQuestion: 'أي مجسم له قاعدتان دائريتان متطابقتان؟',
    practiceOptions: ['هرم', 'أسطوانة', 'مخروط', 'كرة'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: الأسطوانة لها قاعدتان دائريتان متوازيتان ومتطابقتان.',
  ),
  'prism-cylinder-volume': LessonContent(
    conceptLabel: 'الحجم',
    conceptMain: 'V = B × h',
    conceptHint: 'مساحة القاعدة × الارتفاع',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'حجم المنشور يساوي مساحة القاعدة مضروبة في الارتفاع. والأسطوانة تتبع الفكرة نفسها مع قاعدة دائرية.',
    sectionTwoTitle: 'الأسطوانة',
    sectionTwoBody:
        'مساحة قاعدة الأسطوانة πr²، لذلك حجمها V=πr²h.',
    exampleFormula: 'B=12 ، h=5 → V=60',
    exampleBody:
        'إذا كانت مساحة قاعدة المنشور 12 وحدة مربعة وارتفاعه 5، فحجمه 60 وحدة مكعبة.',
    warning:
        'الحجم يقاس بوحدات مكعبة، وليس مربعة.',
    practiceQuestion: 'منشور مساحة قاعدته 8 وارتفاعه 4. حجمه؟',
    practiceOptions: ['12', '24', '32', '64'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: V=8×4=32 وحدة مكعبة.',
  ),
  'pyramid-cone-volume': LessonContent(
    conceptLabel: 'هرم ومخروط',
    conceptMain: 'V = 1/3 Bh',
    conceptHint: 'ثلث حجم المنشور المناظر',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'حجم الهرم أو المخروط يساوي ثلث حاصل ضرب مساحة القاعدة في الارتفاع.',
    sectionTwoTitle: 'لماذا الثلث؟',
    sectionTwoBody:
        'هرم ومنشور لهما القاعدة والارتفاع نفسيهما، يكون حجم الهرم ثلث حجم المنشور.',
    exampleFormula: 'B=18 ، h=6 → V=36',
    exampleBody:
        'V=1/3×18×6=36 وحدة مكعبة.',
    warning:
        'لا تنس عامل 1/3؛ استخدام Bh وحده يعطي حجم المنشور لا الهرم أو المخروط.',
    practiceQuestion: 'هرم مساحة قاعدته 15 وارتفاعه 6. حجمه؟',
    practiceOptions: ['30', '45', '60', '90'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: 1/3×15×6=30.',
  ),
  'prism-cylinder-surface-area': LessonContent(
    conceptLabel: 'مساحة السطح',
    conceptMain: 'مجموع مساحات الأوجه',
    conceptHint: 'قواعد + سطح جانبي',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'مساحة سطح المنشور هي مجموع مساحات جميع أوجهه. وفي الأسطوانة نجمع مساحتي القاعدتين ومساحة السطح الجانبي.',
    sectionTwoTitle: 'الأسطوانة',
    sectionTwoBody:
        'مساحة سطح الأسطوانة = 2πr² + 2πrh.',
    exampleFormula: 'SA = 2πr² + 2πrh',
    exampleBody:
        'الحد الأول يمثل القاعدتين، والحد الثاني يمثل المستطيل الناتج عن فرد السطح الجانبي.',
    warning:
        'مساحة السطح تقاس بوحدات مربعة لأنها مجموع مساحات.',
    practiceQuestion: 'مساحة سطح مجسم تعني:', practiceOptions: ['حجمه', 'مجموع مساحات أوجهه', 'ارتفاعه', 'طول حرفه'], practiceCorrectIndex: 1, practiceFeedback: 'صحيح: مساحة السطح تجمع مساحات الأسطح الخارجية.',
  ),
  'pyramid-surface-area': LessonContent(
    conceptLabel: 'سطح الهرم',
    conceptMain: 'قاعدة + أوجه مثلثة',
    conceptHint: 'اجمع جميع المساحات',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'مساحة سطح الهرم تساوي مساحة القاعدة زائد مجموع مساحات الأوجه الجانبية المثلثة.',
    sectionTwoTitle: 'الارتفاع المائل',
    sectionTwoBody:
        'عند حساب مساحة الوجه المثلث نحتاج غالبًا إلى الارتفاع المائل للوجه، وليس الارتفاع العمودي للهرم.',
    exampleFormula: 'SA = B + المساحة الجانبية',
    exampleBody:
        'إذا كانت مساحة القاعدة 20 ومجموع الأوجه الجانبية 36، فمساحة السطح 56 وحدة مربعة.',
    warning:
        'لا تستخدم ارتفاع الهرم العمودي بدل الارتفاع المائل في مساحة المثلث الجانبي.',
    practiceQuestion: 'قاعدة هرم مساحتها 25 وأوجهه الجانبية مجموعها 40. مساحة السطح؟',
    practiceOptions: ['15', '40', '65', '100'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 25+40=65 وحدة مربعة.',
  ),
};
