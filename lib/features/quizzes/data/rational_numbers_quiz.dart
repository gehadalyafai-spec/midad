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

const multiplyRationalQuiz = <QuizQuestion>[
  QuizQuestion(
    id: 'mr-1',
    question: 'ما إشارة ناتج (-2/3) × (5/7)؟',
    options: ['موجب', 'سالب', 'صفر', 'لا يمكن تحديدها'],
    correctIndex: 1,
    explanation:
        'الإشارتان مختلفتان، لذلك ناتج الضرب سالب.',
  ),
  QuizQuestion(
    id: 'mr-2',
    question: 'ما ناتج (2/5) × (3/4)؟',
    options: ['5/9', '6/20', '6/9', '5/20'],
    correctIndex: 1,
    explanation:
        'نضرب البسطين 2×3=6 والمقامين 5×4=20، فيكون الناتج 6/20 ويساوي 3/10 بعد التبسيط.',
  ),
  QuizQuestion(
    id: 'mr-3',
    question: 'ما ناتج (-1/2) × (-4/3)؟',
    options: ['-2/3', '2/3', '-4/6', '1/6'],
    correctIndex: 1,
    explanation:
        'الإشارتان متماثلتان فالناتج موجب، و4/6 تبسّط إلى 2/3.',
  ),
  QuizQuestion(
    id: 'mr-4',
    question: 'أي عبارة صحيحة عند ضرب كسرين؟',
    options: [
      'نجمع البسطين',
      'نوحّد المقامات أولًا',
      'نضرب البسطين والمقامين',
      'نقلب الكسر الثاني دائمًا'
    ],
    correctIndex: 2,
    explanation:
        'في ضرب الكسور نضرب البسط في البسط والمقام في المقام ثم نبسّط.',
  ),
  QuizQuestion(
    id: 'mr-5',
    question: 'ما ناتج (-3/8) × 0؟',
    options: ['-3/8', '0', '3/8', '-3'],
    correctIndex: 1,
    explanation:
        'أي عدد مضروبًا في صفر يساوي صفرًا.',
  ),
];

const divideRationalQuiz = <QuizQuestion>[
  QuizQuestion(
    id: 'dr-1',
    question: 'ما الخطوة الصحيحة عند قسمة 2/3 على 4/5؟',
    options: [
      '2/3 × 4/5',
      '2/3 × 5/4',
      '3/2 × 4/5',
      '3/2 × 5/4'
    ],
    correctIndex: 1,
    explanation:
        'نثبت الكسر الأول ونضربه في مقلوب الكسر الثاني، أي 2/3 × 5/4.',
  ),
  QuizQuestion(
    id: 'dr-2',
    question: 'ما ناتج (3/4) ÷ (1/2)؟',
    options: ['3/8', '3/2', '2/3', '1/6'],
    correctIndex: 1,
    explanation:
        '3/4 ÷ 1/2 تصبح 3/4 × 2/1 = 6/4 = 3/2.',
  ),
  QuizQuestion(
    id: 'dr-3',
    question: 'ما إشارة ناتج (-5/6) ÷ (2/3)؟',
    options: ['موجب', 'سالب', 'صفر', 'غير معرّف'],
    correctIndex: 1,
    explanation:
        'الإشارتان مختلفتان، لذلك الناتج سالب.',
  ),
  QuizQuestion(
    id: 'dr-4',
    question: 'أي عملية غير معرّفة؟',
    options: ['3/4 ÷ 2', '3/4 ÷ 1/2', '3/4 ÷ 0', '0 ÷ 3/4'],
    correctIndex: 2,
    explanation:
        'القسمة على صفر غير معرّفة.',
  ),
  QuizQuestion(
    id: 'dr-5',
    question: 'ما ناتج (2/5) ÷ (-4/3)؟',
    options: ['-3/10', '3/10', '-8/15', '8/15'],
    correctIndex: 0,
    explanation:
        '2/5 × (-3/4) = -6/20، وبالتبسيط يساوي -3/10.',
  ),
];

const addSubtractRationalQuiz = <QuizQuestion>[
  QuizQuestion(
    id: 'asr-1',
    question: 'ما ناتج 1/3 + 1/6؟',
    options: ['2/9', '1/2', '2/6', '1/9'],
    correctIndex: 1,
    explanation:
        'نحوّل 1/3 إلى 2/6، ثم 2/6 + 1/6 = 3/6 = 1/2.',
  ),
  QuizQuestion(
    id: 'asr-2',
    question: 'ما ناتج 3/4 - 1/2؟',
    options: ['1/4', '2/2', '2/4', '1/2'],
    correctIndex: 0,
    explanation:
        '1/2 = 2/4، ثم 3/4 - 2/4 = 1/4.',
  ),
  QuizQuestion(
    id: 'asr-3',
    question: 'ما ناتج -2/5 + 1/5؟',
    options: ['-3/5', '-1/5', '1/5', '3/5'],
    correctIndex: 1,
    explanation:
        'المقامات متساوية، فنحسب -2 + 1 = -1، والناتج -1/5.',
  ),
  QuizQuestion(
    id: 'asr-4',
    question: 'عند جمع 2/3 و 1/4، ما المقام المشترك المناسب؟',
    options: ['7', '12', '6', '8'],
    correctIndex: 1,
    explanation:
        'المضاعف المشترك الأصغر للعددين 3 و4 هو 12.',
  ),
  QuizQuestion(
    id: 'asr-5',
    question: 'أي عبارة صحيحة عند جمع كسرين مختلفي المقام؟',
    options: [
      'نجمع المقامين مباشرة',
      'نوحّد المقامات أولًا',
      'نضرب البسطين',
      'نقلب الكسر الثاني'
    ],
    correctIndex: 1,
    explanation:
        'يجب توحيد المقامات أولًا ثم إجراء الجمع أو الطرح على البسطين.',
  ),
];

List<QuizQuestion> quizForLesson(String lessonId) {
  switch (lessonId) {
    case 'compare-rational':
      return compareRationalQuiz;
    case 'multiply-rational':
      return multiplyRationalQuiz;
    case 'divide-rational':
      return divideRationalQuiz;
    case 'add-subtract-rational':
      return addSubtractRationalQuiz;
    case 'rational-numbers-intro':
    default:
      return rationalNumbersIntroQuiz;
  }
}

const allRationalNumbersQuestions = <QuizQuestion>[
  ...rationalNumbersIntroQuiz,
  ...compareRationalQuiz,
  ...multiplyRationalQuiz,
  ...divideRationalQuiz,
  ...addSubtractRationalQuiz,
];
