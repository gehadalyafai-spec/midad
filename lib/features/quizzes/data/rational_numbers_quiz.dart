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
