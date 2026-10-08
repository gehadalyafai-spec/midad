class LessonContent {
  const LessonContent({
    required this.conceptLabel,
    required this.conceptMain,
    required this.conceptHint,
    required this.sectionOneTitle,
    required this.sectionOneBody,
    required this.sectionTwoTitle,
    required this.sectionTwoBody,
    required this.exampleFormula,
    required this.exampleBody,
    required this.warning,
    required this.practiceQuestion,
    required this.practiceOptions,
    required this.practiceCorrectIndex,
    required this.practiceFeedback,
  });

  final String conceptLabel;
  final String conceptMain;
  final String conceptHint;
  final String sectionOneTitle;
  final String sectionOneBody;
  final String sectionTwoTitle;
  final String sectionTwoBody;
  final String exampleFormula;
  final String exampleBody;
  final String warning;
  final String practiceQuestion;
  final List<String> practiceOptions;
  final int practiceCorrectIndex;
  final String practiceFeedback;
}

const grade2MathLessonContent = <String, LessonContent>{
  'rational-numbers-intro': LessonContent(
    conceptLabel: 'الشكل العام',
    conceptMain: 'أ / ب',
    conceptHint: 'ب ≠ 0',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'العدد النسبي هو أي عدد يمكن كتابته على صورة أ/ب، حيث أ و ب عددان صحيحان، وب لا يساوي صفرًا.',
    sectionTwoTitle: 'كيف أفهمها؟',
    sectionTwoBody:
        'تشمل الأعداد النسبية الكسور والأعداد الصحيحة وبعض الأعداد العشرية. فالعدد -2 نسبي لأنه يساوي -2/1، والعدد 0.75 نسبي لأنه يساوي 3/4.',
    exampleFormula: '-5 = -5/1',
    exampleBody:
        'إذن -5 عدد نسبي؛ لأننا كتبناه على صورة كسر مقامه لا يساوي صفرًا. وكذلك 0.75 = 3/4.',
    warning:
        'لا يمكن أن يكون مقام الكسر صفرًا؛ لذلك أي تعبير على صورة أ/0 غير معرّف.',
    practiceQuestion: 'أي عدد مما يلي يمكن كتابته مباشرةً على صورة عدد نسبي؟',
    practiceOptions: ['√2', 'π', '-7', '√5'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: -7 عدد صحيح، وكل عدد صحيح يمكن كتابته على صورة -7/1.',
  ),
  'compare-rational': LessonContent(
    conceptLabel: 'قاعدة المقارنة',
    conceptMain: 'يسار < يمين',
    conceptHint: 'على خط الأعداد',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عند تمثيل عددين نسبيين على خط الأعداد، يكون العدد الواقع إلى اليمين أكبر، والعدد الواقع إلى اليسار أصغر.',
    sectionTwoTitle: 'كيف أقارن الكسور؟',
    sectionTwoBody:
        'يمكن توحيد المقامات ثم مقارنة البسطين. ومع الأعداد السالبة تذكّر أن العدد الأقرب إلى الصفر هو الأكبر.',
    exampleFormula: '-1/3 > -2/3',
    exampleBody:
        'العددان لهما المقام نفسه. وعلى خط الأعداد يقع -1/3 إلى يمين -2/3، لذلك -1/3 هو الأكبر.',
    warning:
        'في الأعداد السالبة لا تعكس القاعدة ذهنيًا بشكل آلي؛ استخدم خط الأعداد أو فكّر: الأقرب إلى الصفر أكبر.',
    practiceQuestion: 'أي العلاقتين صحيحة؟',
    practiceOptions: [
      '-3/4 > -1/4',
      '-3/4 < -1/4',
      '-3/4 = -1/4',
      'لا يمكن المقارنة'
    ],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: -3/4 يقع إلى يسار -1/4 على خط الأعداد، ولذلك هو أصغر.',
  ),
  'multiply-rational': LessonContent(
    conceptLabel: 'قاعدة الإشارات',
    conceptMain: 'نفس الإشارة = موجب',
    conceptHint: 'مختلفتان = سالب',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'لضرب عددين نسبيين نضرب البسطين معًا والمقامين معًا، ثم نبسّط الناتج. وتُحدد إشارة الناتج من إشارات العددين.',
    sectionTwoTitle: 'كيف أحدد الإشارة؟',
    sectionTwoBody:
        'إذا كانت الإشارتان متماثلتين فالناتج موجب، وإذا كانتا مختلفتين فالناتج سالب. بعد ذلك نفذ الضرب كالمعتاد ثم بسّط الكسر.',
    exampleFormula: '(-2/3) × (3/5) = -2/5',
    exampleBody:
        'الإشارتان مختلفتان إذن الناتج سالب. نضرب 2×3=6 و3×5=15 فنحصل على -6/15، وبالتبسيط يساوي -2/5.',
    warning:
        'لا تجمع البسطين أو المقامين عند الضرب. في الضرب نضرب بسطًا في بسط ومقامًا في مقام.',
    practiceQuestion: 'ما ناتج (-3/4) × (2/5)؟',
    practiceOptions: ['-6/20', '6/9', '-5/8', '6/20'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: الإشارتان مختلفتان فالناتج سالب، و3×2=6 و4×5=20، أي -6/20 ويمكن تبسيطه إلى -3/10.',
  ),
  'divide-rational': LessonContent(
    conceptLabel: 'قاعدة القسمة',
    conceptMain: 'اقلب واضرب',
    conceptHint: 'مقلوب المقسوم عليه',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'لقسمة عدد نسبي على عدد نسبي آخر غير الصفر، نضرب العدد الأول في مقلوب العدد الثاني.',
    sectionTwoTitle: 'كيف أطبقها؟',
    sectionTwoBody:
        'ثبت الكسر الأول، وحوّل القسمة إلى ضرب، ثم اقلب الكسر الثاني. بعدها طبق قواعد ضرب الأعداد النسبية وبسّط الناتج.',
    exampleFormula: '(2/3) ÷ (-4/5) = -5/6',
    exampleBody:
        'نحوّل القسمة إلى ضرب: 2/3 × (-5/4) = -10/12، وبالتبسيط نحصل على -5/6.',
    warning:
        'لا يجوز القسمة على صفر، ولا تنس قلب الكسر الثاني فقط عند تحويل القسمة إلى ضرب.',
    practiceQuestion: 'ما ناتج (3/7) ÷ (2/5)؟',
    practiceOptions: ['6/35', '15/14', '14/15', '5/21'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 3/7 ÷ 2/5 تصبح 3/7 × 5/2، والناتج 15/14.',
  ),
  'add-subtract-rational': LessonContent(
    conceptLabel: 'قاعدة الجمع',
    conceptMain: 'وحّد المقامات',
    conceptHint: 'ثم اجمع أو اطرح',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عند جمع أو طرح كسور ذات مقامات مختلفة، يجب أولًا إيجاد مقام مشترك ثم تحويل الكسور إلى كسور مكافئة.',
    sectionTwoTitle: 'كيف أتعامل مع الإشارات؟',
    sectionTwoBody:
        'بعد توحيد المقامات نتعامل مع البسطين كأعداد صحيحة: إذا كانت الإشارتان متماثلتين نجمع القيم ونحافظ على الإشارة، وإذا اختلفتا نطرح الأصغر من الأكبر ونأخذ إشارة الأكبر قيمةً.',
    exampleFormula: '1/3 + (-1/2) = -1/6',
    exampleBody:
        'المقام المشترك هو 6: يصبح 1/3 = 2/6 و-1/2 = -3/6، ثم 2/6 + (-3/6) = -1/6.',
    warning:
        'لا تجمع المقامات أو تطرحها. المقام يبقى موحدًا بعد إيجاد المقام المشترك، والعملية تكون على البسطين فقط.',
    practiceQuestion: 'ما ناتج 2/5 + 1/10؟',
    practiceOptions: ['3/15', '5/10', '1/2', '3/10'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 2/5 = 4/10، ثم 4/10 + 1/10 = 5/10 = 1/2.',
  ),
  'powers': LessonContent(
    conceptLabel: 'القوة',
    conceptMain: 'aⁿ',
    conceptHint: 'الأس يحدد عدد مرات التكرار',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'القوة طريقة مختصرة لكتابة الضرب المتكرر. في التعبير 3⁴ يسمى 3 الأساس ويسمى 4 الأس، ومعناه 3×3×3×3.',
    sectionTwoTitle: 'ماذا عن الإشارات؟',
    sectionTwoBody:
        'عندما يكون العدد السالب داخل قوسين فإننا نكرر ضربه بعدد مرات الأس. الأس الزوجي يعطي ناتجًا موجبًا، والأس الفردي يبقي الناتج سالبًا.',
    exampleFormula: '(-2)³ = -8',
    exampleBody:
        'نكرر ضرب -2 ثلاث مرات: (-2)×(-2)×(-2). حاصل ضرب الأولين موجب 4، ثم 4×(-2) = -8.',
    warning:
        'انتبه لمكان السالب والأقواس. التعبير (-2)² يختلف في المعنى الكتابي عن -2² لأن الأس يُطبّق قبل الإشارة الخارجية.',
    practiceQuestion: 'ما قيمة (-3)²؟',
    practiceOptions: ['-9', '9', '6', '-6'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: (-3)×(-3)=9، والأس زوجي لذلك الناتج موجب.',
  ),
  'scientific-notation': LessonContent(
    conceptLabel: 'الصيغة العلمية',
    conceptMain: 'a × 10ⁿ',
    conceptHint: '1 ≤ |a| < 10',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'تُستخدم الصيغة العلمية لكتابة الأعداد الكبيرة أو الصغيرة بصورة مختصرة على الشكل a × 10ⁿ، حيث القيمة المطلقة لـ a لا تقل عن 1 وتقل عن 10.',
    sectionTwoTitle: 'كيف أحدد الأس؟',
    sectionTwoBody:
        'حرّك الفاصلة حتى يصبح أمامها رقم واحد غير صفري. عدد الحركات هو قيمة الأس: يكون موجبًا للأعداد الكبيرة وسالبًا للأعداد الصغيرة بين صفر وواحد.',
    exampleFormula: '450000 = 4.5 × 10⁵',
    exampleBody:
        'حرّكنا الفاصلة خمس خانات إلى اليسار حتى أصبح العدد 4.5، لذلك الأس يساوي 5.',
    warning:
        'يجب أن يكون العدد الأول في الصيغة العلمية بين 1 و10 من حيث القيمة المطلقة؛ لذلك 45 × 10⁴ ليست الصيغة العلمية القياسية.',
    practiceQuestion: 'أي صيغة علمية تمثل 0.0032؟',
    practiceOptions: [
      '3.2 × 10⁻³',
      '3.2 × 10³',
      '32 × 10⁻⁴',
      '0.32 × 10⁻²'
    ],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: نحرك الفاصلة ثلاث خانات إلى اليمين لنحصل على 3.2، لذلك الأس -3.',
  ),
};

LessonContent lessonContentFor(String lessonId) {
  return grade2MathLessonContent[lessonId] ??
      grade2MathLessonContent['rational-numbers-intro']!;
}
