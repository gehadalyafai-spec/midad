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
};

LessonContent lessonContentFor(String lessonId) {
  return grade2MathLessonContent[lessonId] ??
      grade2MathLessonContent['rational-numbers-intro']!;
}
