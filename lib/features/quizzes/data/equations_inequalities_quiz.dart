import '../models/quiz_question.dart';

const simplifyExpressionsQuiz = <QuizQuestion>[
  QuizQuestion(id:'se-1',question:'بسّط: 3س + 4س.',options:['7س','12س','7','س'],correctIndex:0,explanation:'الحدان متشابهان، لذا نجمع المعاملين: 3+4=7.'),
  QuizQuestion(id:'se-2',question:'بسّط: 5س + 2 - 2س + 3.',options:['3س+5','7س+5','3س-1','7س-1'],correctIndex:0,explanation:'5س-2س=3س، و2+3=5.'),
  QuizQuestion(id:'se-3',question:'أي حدين متشابهان؟',options:['3س و5س','3س و3ص','س و س²','4 و4س'],correctIndex:0,explanation:'لهما المتغير والأس نفسيهما.'),
  QuizQuestion(id:'se-4',question:'بسّط: 2(س+3).',options:['2س+3','2س+6','س+6','2س+5'],correctIndex:1,explanation:'نوزع 2 على س وعلى 3.'),
  QuizQuestion(id:'se-5',question:'بسّط: 7 + س - 2.',options:['س+5','س+9','5س','س-5'],correctIndex:0,explanation:'7-2=5، فيصبح س+5.'),
];

const twoStepEquationsQuiz = <QuizQuestion>[
  QuizQuestion(id:'tse-1',question:'حل: 2س + 4 = 14.',options:['4','5','6','9'],correctIndex:1,explanation:'2س=10 ثم س=5.'),
  QuizQuestion(id:'tse-2',question:'حل: 3س - 6 = 9.',options:['3','5','6','9'],correctIndex:1,explanation:'3س=15 ثم س=5.'),
  QuizQuestion(id:'tse-3',question:'في 4س+3=19، أول خطوة مناسبة:',options:['طرح 3 من الطرفين','قسمة الطرفين على 4 مباشرة','جمع 3','ضرب في 4'],correctIndex:0,explanation:'نزيل الثابت أولًا بعكس عملية الجمع.'),
  QuizQuestion(id:'tse-4',question:'حل: س/2 + 3 = 7.',options:['2','4','8','10'],correctIndex:2,explanation:'س/2=4 ثم س=8.'),
  QuizQuestion(id:'tse-5',question:'ما القاعدة الأساسية عند حل المعادلة؟',options:['إجراء العملية نفسها على الطرفين','تغيير طرف واحد فقط','حذف المتغير','تبديل الإشارة دائمًا'],correctIndex:0,explanation:'المعادلة تبقى متوازنة بإجراء العملية نفسها على الطرفين.'),
];

const writeTwoStepEquationsQuiz = <QuizQuestion>[
  QuizQuestion(id:'wte-1',question:'ضعف عدد زائد 5 يساوي 17. المعادلة؟',options:['2س+5=17','2س-5=17','س+2=17','5س+2=17'],correctIndex:0,explanation:'ضعف العدد 2س، ثم زائد 5.'),
  QuizQuestion(id:'wte-2',question:'ثلاثة أمثال عدد ناقص 2 يساوي 10.',options:['3س-2=10','3س+2=10','س-2=30','2س-3=10'],correctIndex:0,explanation:'ثلاثة أمثال العدد =3س ثم ناقص 2.'),
  QuizQuestion(id:'wte-3',question:'عدد مقسوم على 4 ثم زائد 1 يساوي 6.',options:['س/4+1=6','4س+1=6','س+4=6','س/4-1=6'],correctIndex:0,explanation:'نترجم القسمة على 4 ثم الجمع.'),
  QuizQuestion(id:'wte-4',question:'ما أول خطوة في تحويل مسألة لفظية لمعادلة؟',options:['تحديد المجهول','الحل مباشرة','حذف الأرقام','تغيير الكلمات'],correctIndex:0,explanation:'نختار متغيرًا يمثل المجهول أولًا.'),
  QuizQuestion(id:'wte-5',question:'خمسة أكثر من عدد يساوي 12.',options:['س+5=12','5س=12','س-5=12','5-س=12'],correctIndex:0,explanation:'خمسة أكثر من عدد تعني العدد +5.'),
];

const variablesBothSidesQuiz = <QuizQuestion>[
  QuizQuestion(id:'vb-1',question:'حل: 5س+2=3س+10.',options:['2','4','6','8'],correctIndex:1,explanation:'2س=8، إذن س=4.'),
  QuizQuestion(id:'vb-2',question:'حل: 4س+1=2س+9.',options:['3','4','5','6'],correctIndex:1,explanation:'2س=8، إذن س=4.'),
  QuizQuestion(id:'vb-3',question:'الهدف الأول عند وجود متغير في الطرفين:',options:['جمع حدود المتغير في جهة واحدة','حذف كل الثوابت','ضرب الطرفين بصفر','تغيير المتغير'],correctIndex:0,explanation:'نقل حدود المتغير إلى طرف واحد يسهل العزل.'),
  QuizQuestion(id:'vb-4',question:'حل: 7س-3=5س+9.',options:['3','6','9','12'],correctIndex:1,explanation:'2س=12، إذن س=6.'),
  QuizQuestion(id:'vb-5',question:'ما الذي يجب الحفاظ عليه أثناء الحل؟',options:['توازن الطرفين','طرف واحد فقط','الإشارة نفسها دائمًا','عدد الحدود'],correctIndex:0,explanation:'أي عملية يجب تطبيقها على الطرفين.'),
];

const guessCheckQuiz = <QuizQuestion>[
  QuizQuestion(id:'gc-1',question:'بعد اختيار تخمين مناسب ننتقل إلى:',options:['التحقق منه','تجاهله','حذف المعطيات','كتابة جواب جديد بلا اختبار'],correctIndex:0,explanation:'التخمين يجب اختباره داخل شروط المسألة.'),
  QuizQuestion(id:'gc-2',question:'إذا كان التخمين منخفضًا جدًا، الخطوة التالية غالبًا:',options:['زيادة التخمين','تقليله أكثر دائمًا','إيقاف الحل','حذف السؤال'],correctIndex:0,explanation:'نتيجة التحقق تساعد على تعديل التخمين في الاتجاه المناسب.'),
  QuizQuestion(id:'gc-3',question:'أفضل تخمين أولي هو:',options:['قيمة مبنية على المعطيات','قيمة عشوائية دائمًا','أكبر عدد ممكن','صفر دائمًا'],correctIndex:0,explanation:'استخدام حدود ومعطيات المسألة يجعل التخمين أكثر كفاءة.'),
  QuizQuestion(id:'gc-4',question:'هل التخمين وحده يكفي؟',options:['لا، يجب التحقق','نعم دائمًا','فقط في الهندسة','فقط في الإحصاء'],correctIndex:0,explanation:'التحقق هو الذي يثبت أن التخمين يحقق الشروط.'),
  QuizQuestion(id:'gc-5',question:'ميزة الاستراتيجية أنها:',options:['تستخدم نتائج المحاولات لتحسين الحل','تلغي الحاجة للمعطيات','تمنع التحقق','تعطي جوابًا ثابتًا'],correctIndex:0,explanation:'كل محاولة تعطي تغذية راجعة للمحاولة التالية.'),
];

const inequalitiesQuiz = <QuizQuestion>[
  QuizQuestion(id:'iq-1',question:'"على الأقل 10" تكتب:',options:['س>10','س≥10','س<10','س≤10'],correctIndex:1,explanation:'على الأقل تعني أكبر من أو يساوي.'),
  QuizQuestion(id:'iq-2',question:'"أقل من 5" تكتب:',options:['س<5','س≤5','س>5','س≥5'],correctIndex:0,explanation:'أقل من لا تشمل 5 نفسها.'),
  QuizQuestion(id:'iq-3',question:'الدائرة المفتوحة على خط الأعداد تعني:',options:['القيمة غير مشمولة','القيمة مشمولة','كل القيم','لا توجد حلول'],correctIndex:0,explanation:'الرمزان < و> يستخدمان حدًا غير مشمول.'),
  QuizQuestion(id:'iq-4',question:'الدائرة المغلقة تعني:',options:['الحد مشمول','الحد غير مشمول','لا يوجد حد','المتباينة خاطئة'],correctIndex:0,explanation:'≤ و≥ يشملان قيمة الحد.'),
  QuizQuestion(id:'iq-5',question:'أي رمز يعني "لا يزيد عن"؟',options:['<','>','≤','≥'],correctIndex:2,explanation:'لا يزيد عن تعني أصغر من أو يساوي.'),
];

const solveInequalitiesQuiz = <QuizQuestion>[
  QuizQuestion(id:'si-1',question:'حل: س+3>8.',options:['س>5','س<5','س≥11','س<11'],correctIndex:0,explanation:'نطرح 3 من الطرفين فنحصل على س>5.'),
  QuizQuestion(id:'si-2',question:'حل: 2س≤10.',options:['س≤5','س≥5','س<8','س>8'],correctIndex:0,explanation:'نقسم على 2 الموجب فلا يتغير اتجاه الرمز.'),
  QuizQuestion(id:'si-3',question:'حل: -2س>6.',options:['س>-3','س<-3','س>3','س<3'],correctIndex:1,explanation:'نقسم على -2 فنعكس الرمز: س<-3.'),
  QuizQuestion(id:'si-4',question:'متى نعكس رمز المتباينة؟',options:['عند الضرب أو القسمة في سالب','عند الجمع فقط','عند الضرب في موجب','دائمًا'],correctIndex:0,explanation:'هذه القاعدة الخاصة بالعدد السالب.'),
  QuizQuestion(id:'si-5',question:'حل: -4س≤12.',options:['س≤-3','س≥-3','س≤3','س≥3'],correctIndex:1,explanation:'بالقسمة على -4 نعكس الرمز، فيصبح س≥-3.'),
];

List<QuizQuestion> equationsInequalitiesQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'simplify-expressions':
      return simplifyExpressionsQuiz;
    case 'two-step-equations':
      return twoStepEquationsQuiz;
    case 'write-two-step-equations':
      return writeTwoStepEquationsQuiz;
    case 'variables-both-sides':
      return variablesBothSidesQuiz;
    case 'guess-check-strategy':
      return guessCheckQuiz;
    case 'inequalities':
      return inequalitiesQuiz;
    case 'solve-inequalities':
      return solveInequalitiesQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allEquationsInequalitiesQuestions = <QuizQuestion>[
  ...simplifyExpressionsQuiz,
  ...twoStepEquationsQuiz,
  ...writeTwoStepEquationsQuiz,
  ...variablesBothSidesQuiz,
  ...guessCheckQuiz,
  ...inequalitiesQuiz,
  ...solveInequalitiesQuiz,
];
