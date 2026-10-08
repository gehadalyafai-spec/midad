import '../models/quiz_question.dart';

const rationalNumbersIntroQuiz = <QuizQuestion>[
  QuizQuestion(
    id: 'rn-1',
    question: 'أي مما يلي عدد نسبي؟',
    options: ['3/5', 'π', '√2', '√3'],
    correctIndex: 0,
    explanation:
        'العدد النسبي يمكن كتابته على صورة كسر من عددين صحيحين ومقامه لا يساوي صفرًا، مثل 3/5.',
  ),
  QuizQuestion(
    id: 'rn-2',
    question: 'أي كسر يساوي العدد العشري -0.5؟',
    options: ['1/2', '-1/2', '-2/5', '5/2'],
    correctIndex: 1,
    explanation: '-0.5 يساوي -5/10، وبالتبسيط يصبح -1/2.',
  ),
  QuizQuestion(
    id: 'rn-3',
    question: 'ما العلاقة الصحيحة بين -2/3 و -1/3؟',
    options: ['-2/3 > -1/3', '-2/3 < -1/3', 'متساويان', 'لا يمكن المقارنة'],
    correctIndex: 1,
    explanation:
        'على خط الأعداد يقع -2/3 إلى يسار -1/3، ولذلك فهو أصغر منه.',
  ),
  QuizQuestion(
    id: 'rn-4',
    question: 'كيف يمكن كتابة العدد الصحيح -4 على صورة عدد نسبي؟',
    options: ['-4/1', '1/-4', '4/0', '-4/0'],
    correctIndex: 0,
    explanation:
        'كل عدد صحيح عدد نسبي؛ لأن -4 يمكن كتابته على الصورة -4/1.',
  ),
  QuizQuestion(
    id: 'rn-5',
    question: 'في الكسر الذي يمثل عددًا نسبيًا، ما الشرط على المقام؟',
    options: [
      'يجب أن يكون موجبًا دائمًا',
      'يجب أن يكون أكبر من البسط',
      'يجب ألا يساوي صفرًا',
      'يجب أن يكون عددًا زوجيًا',
    ],
    correctIndex: 2,
    explanation: 'المقام لا يمكن أن يساوي صفرًا؛ لأن القسمة على صفر غير معرّفة.',
  ),
];

const compareRationalQuiz = <QuizQuestion>[
  QuizQuestion(
    id: 'cr-1',
    question: 'أي علاقة صحيحة بين -1/2 و -3/4؟',
    options: ['-1/2 > -3/4', '-1/2 < -3/4', 'متساويان', 'لا يمكن المقارنة'],
    correctIndex: 0,
    explanation:
        '-1/2 يساوي -2/4، وهو يقع إلى يمين -3/4 على خط الأعداد، لذلك هو الأكبر.',
  ),
  QuizQuestion(
    id: 'cr-2',
    question: 'أي عدد هو الأكبر؟',
    options: ['-0.8', '-0.3', '-0.6', '-0.9'],
    correctIndex: 1,
    explanation:
        'بين الأعداد السالبة يكون العدد الأقرب إلى الصفر هو الأكبر، لذلك -0.3 هو الأكبر.',
  ),
  QuizQuestion(
    id: 'cr-3',
    question: 'رتّب 1/2 و 3/4 تصاعديًا.',
    options: ['3/4 ، 1/2', '1/2 ، 3/4', 'متساويان', 'لا يمكن الترتيب'],
    correctIndex: 1,
    explanation:
        '1/2 يساوي 2/4، ولذلك 2/4 أصغر من 3/4.',
  ),
  QuizQuestion(
    id: 'cr-4',
    question: 'ما العلاقة بين -2/5 و 1/5؟',
    options: ['-2/5 > 1/5', '-2/5 < 1/5', 'متساويان', 'كلاهما صفر'],
    correctIndex: 1,
    explanation:
        'أي عدد سالب أصغر من أي عدد موجب، لذلك -2/5 أصغر من 1/5.',
  ),
  QuizQuestion(
    id: 'cr-5',
    question: 'أي عبارة صحيحة على خط الأعداد؟',
    options: [
      'العدد الأكبر يقع دائمًا إلى اليسار',
      'العدد الأصغر يقع دائمًا إلى اليمين',
      'العدد الأكبر يقع إلى اليمين',
      'الموقع لا يساعد في المقارنة'
    ],
    correctIndex: 2,
    explanation:
        'على خط الأعداد تزداد القيم كلما اتجهنا إلى اليمين، لذا يقع العدد الأكبر إلى اليمين.',
  ),
];

List<QuizQuestion> quizForLesson(String lessonId) {
  switch (lessonId) {
    case 'compare-rational':
      return compareRationalQuiz;
    case 'rational-numbers-intro':
    default:
      return rationalNumbersIntroQuiz;
  }
}

const allRationalNumbersQuestions = <QuizQuestion>[
  ...rationalNumbersIntroQuiz,
  ...compareRationalQuiz,
];
