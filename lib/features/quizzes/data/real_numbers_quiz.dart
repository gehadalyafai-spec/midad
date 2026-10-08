import '../models/quiz_question.dart';

const squareRootsQuiz = <QuizQuestion>[
  QuizQuestion(id:'sr-1',question:'ما قيمة √49؟',options:['6','7','8','9'],correctIndex:1,explanation:'7×7=49، لذلك √49=7.'),
  QuizQuestion(id:'sr-2',question:'أي عدد مما يلي مربع كامل؟',options:['18','24','36','45'],correctIndex:2,explanation:'36=6²، لذلك هو مربع كامل.'),
  QuizQuestion(id:'sr-3',question:'ما قيمة √100؟',options:['5','10','20','50'],correctIndex:1,explanation:'10×10=100.'),
  QuizQuestion(id:'sr-4',question:'أي عبارة صحيحة؟',options:['√64=6','√64=7','√64=8','√64=9'],correctIndex:2,explanation:'8²=64.'),
  QuizQuestion(id:'sr-5',question:'إذا كان س²=81، فما قيمة الجذر التربيعي الرئيسي لـ81؟',options:['-9','9','±9','81'],correctIndex:1,explanation:'الجذر الرئيسي غير سالب، لذا √81=9.'),
];

const estimateSquareRootsQuiz = <QuizQuestion>[
  QuizQuestion(id:'esr-1',question:'بين أي عددين صحيحين يقع √30؟',options:['4 و5','5 و6','6 و7','7 و8'],correctIndex:1,explanation:'25<30<36، لذا 5<√30<6.'),
  QuizQuestion(id:'esr-2',question:'أي جذر أقرب إلى 4؟',options:['√5','√10','√17','√35'],correctIndex:2,explanation:'√17 قريب جدًا من √16=4.'),
  QuizQuestion(id:'esr-3',question:'بين أي عددين يقع √70؟',options:['6 و7','7 و8','8 و9','9 و10'],correctIndex:2,explanation:'64<70<81، لذا 8<√70<9.'),
  QuizQuestion(id:'esr-4',question:'ما أفضل تقدير لـ√20؟',options:['2.5','3.2','4.5','5.8'],correctIndex:2,explanation:'√20≈4.47، لذا 4.5 تقدير مناسب.'),
  QuizQuestion(id:'esr-5',question:'أي مربعين كاملين يحيطان بالعدد 45؟',options:['25 و36','36 و49','49 و64','64 و81'],correctIndex:1,explanation:'36<45<49.'),
];

const vennStrategyQuiz = <QuizQuestion>[
  QuizQuestion(id:'vn-1',question:'أين يوضع العنصر الذي ينتمي إلى مجموعتين في شكل فن؟',options:['خارج الدائرتين','في التقاطع','في الأولى فقط','في الثانية فقط'],correctIndex:1,explanation:'التقاطع يمثل العناصر المشتركة.'),
  QuizQuestion(id:'vn-2',question:'ما الهدف الأساسي من أشكال فن؟',options:['الحساب فقط','تنظيم العلاقات بين المجموعات','رسم الزوايا','قياس الأطوال'],correctIndex:1,explanation:'أشكال فن تنظّم المشترك والمختلف بين المجموعات.'),
  QuizQuestion(id:'vn-3',question:'إذا كان العدد 6 زوجيًا ومضاعفًا لـ3، فأين يوضع؟',options:['تقاطع المجموعتين','مجموعة الزوجي فقط','مضاعفات 3 فقط','خارج المجموعتين'],correctIndex:0,explanation:'6 يحقق الصفتين معًا.'),
  QuizQuestion(id:'vn-4',question:'ما الذي يوضع في الجزء غير المتقاطع من دائرة؟',options:['العناصر المشتركة','العناصر الخاصة بتلك المجموعة','كل العناصر','لا شيء'],correctIndex:1,explanation:'الجزء المنفصل يمثل العناصر الخاصة بالمجموعة.'),
  QuizQuestion(id:'vn-5',question:'أي مسألة يناسبها شكل فن؟',options:['تصنيف عناصر إلى مجموعات متداخلة','إيجاد مساحة دائرة فقط','قسمة كسرين','حل معادلة خطية فقط'],correctIndex:0,explanation:'شكل فن مناسب للمقارنة والتصنيف بين مجموعات.'),
];

const realNumbersQuiz = <QuizQuestion>[
  QuizQuestion(id:'rn2-1',question:'أي عدد غير نسبي؟',options:['3/4','0.5','√2','-8'],correctIndex:2,explanation:'√2 غير نسبي.'),
  QuizQuestion(id:'rn2-2',question:'أي عدد نسبي؟',options:['π','√3','0.25','√5'],correctIndex:2,explanation:'0.25=1/4 وهو عدد نسبي.'),
  QuizQuestion(id:'rn2-3',question:'الأعداد الحقيقية تتكون من:',options:['الصحيحة فقط','النسبية فقط','النسبية وغير النسبية','الطبيعية فقط'],correctIndex:2,explanation:'الأعداد الحقيقية تشمل النسبية وغير النسبية.'),
  QuizQuestion(id:'rn2-4',question:'أي جذر يعطي عددًا نسبيًا؟',options:['√7','√11','√16','√19'],correctIndex:2,explanation:'√16=4 وهو نسبي.'),
  QuizQuestion(id:'rn2-5',question:'أي وصف يناسب عددًا غير نسبي؟',options:['عشري منتهٍ','عشري دوري','يمكن كتابته ككسر','عشري غير منتهٍ وغير دوري'],correctIndex:3,explanation:'هذا هو وصف العدد غير النسبي.'),
];

const pythagoreanQuiz = <QuizQuestion>[
  QuizQuestion(id:'py-1',question:'ما قانون فيثاغورس؟',options:['a+b=c','a²+b²=c²','a²-b²=c²','ab=c'],correctIndex:1,explanation:'في المثلث القائم a²+b²=c².'),
  QuizQuestion(id:'py-2',question:'في مثلث قائم، ماذا يمثل c؟',options:['أقصر ضلع','أي ضلع','الوتر','الارتفاع فقط'],correctIndex:2,explanation:'c يمثل الوتر المقابل للزاوية القائمة.'),
  QuizQuestion(id:'py-3',question:'إذا كان ضلعا القائمة 3 و4، فالوتر؟',options:['5','6','7','8'],correctIndex:0,explanation:'3²+4²=25، إذن الوتر 5.'),
  QuizQuestion(id:'py-4',question:'هل الأطوال 5،12،13 تحقق فيثاغورس؟',options:['نعم','لا','فقط إذا كان 5 هو الوتر','لا يمكن التحديد'],correctIndex:0,explanation:'25+144=169=13².'),
  QuizQuestion(id:'py-5',question:'أي ضلع هو الأطول في المثلث القائم؟',options:['أحد ضلعي القائمة دائمًا','الوتر','جميعها متساوية','لا يوجد'],correctIndex:1,explanation:'الوتر هو الأطول.'),
];

const pythagoreanApplicationsQuiz = <QuizQuestion>[
  QuizQuestion(id:'pa-1',question:'مستطيل 6×8، كم طول قطره؟',options:['10','12','14','48'],correctIndex:0,explanation:'6²+8²=100، فالقطر 10.'),
  QuizQuestion(id:'pa-2',question:'سلم يبعد 5 م عن جدار ويصل 12 م ارتفاعًا، طوله؟',options:['13','15','17','7'],correctIndex:0,explanation:'5²+12²=169، فالطول 13.'),
  QuizQuestion(id:'pa-3',question:'قبل استخدام فيثاغورس في موقف عملي يجب التأكد من وجود:',options:['مثلث متساوي الأضلاع','زاوية قائمة','دائرة','مربع كامل فقط'],correctIndex:1,explanation:'النظرية تتعلق بالمثلث القائم.'),
  QuizQuestion(id:'pa-4',question:'إذا كان الوتر 10 وأحد الضلعين 6، فالضلع الآخر؟',options:['4','8','12','16'],correctIndex:1,explanation:'10²-6²=64، والجذر 8.'),
  QuizQuestion(id:'pa-5',question:'أي مسألة تناسب فيثاغورس؟',options:['محيط دائرة','قطر مستطيل','متوسط حسابي','جمع كسرين'],correctIndex:1,explanation:'قطر المستطيل يكون وتر مثلث قائم.'),
];

const irrationalRepresentationQuiz = <QuizQuestion>[
  QuizQuestion(id:'ir-1',question:'مثلث قائم ضلعا قائمته 1 و1، طول وتره؟',options:['1','√2','2','√3'],correctIndex:1,explanation:'1²+1²=2، فالوتر √2.'),
  QuizQuestion(id:'ir-2',question:'لتمثيل √5 هندسيًا يمكن استخدام ضلعي قائمة:',options:['1 و1','1 و2','2 و2','2 و3'],correctIndex:1,explanation:'1²+2²=5.'),
  QuizQuestion(id:'ir-3',question:'هل التقريب 1.41 يساوي √2 تمامًا؟',options:['نعم','لا','فقط على خط الأعداد','فقط في المثلث'],correctIndex:1,explanation:'1.41 تقريب وليس القيمة الدقيقة.'),
  QuizQuestion(id:'ir-4',question:'ما الأداة الرياضية الأساسية في بناء تمثيل √n هندسيًا؟',options:['فيثاغورس','النسبة المئوية','الجمع المتكرر','الاحتمال'],correctIndex:0,explanation:'نستخدم أطوال أضلاع مثلث قائم ونظرية فيثاغورس.'),
  QuizQuestion(id:'ir-5',question:'أي عدد يمكن تمثيله نقطةً على خط الأعداد؟',options:['الأعداد الصحيحة فقط','النسبية فقط','الحقيقية كلها','الموجبة فقط'],correctIndex:2,explanation:'كل عدد حقيقي له موضع على خط الأعداد.'),
];

const coordinateDistanceQuiz = <QuizQuestion>[
  QuizQuestion(id:'cd-1',question:'المسافة بين (0,0) و(3,4)؟',options:['4','5','6','7'],correctIndex:1,explanation:'√(3²+4²)=5.'),
  QuizQuestion(id:'cd-2',question:'الفرق الأفقي بين (2,1) و(7,1)؟',options:['3','4','5','6'],correctIndex:2,explanation:'7-2=5.'),
  QuizQuestion(id:'cd-3',question:'المسافة بين (1,2) و(1,8)؟',options:['5','6','7','9'],correctIndex:1,explanation:'النقطتان لهما السين نفسه، والفرق الرأسي 6.'),
  QuizQuestion(id:'cd-4',question:'لحساب المسافة بين نقطتين نستخدم فروق:',options:['الإحداثيات','الألوان','المساحات فقط','الزوايا فقط'],correctIndex:0,explanation:'نحسب فرق x وفرق y ثم نطبق فيثاغورس.'),
  QuizQuestion(id:'cd-5',question:'إذا كان فرق x=5 وفرق y=12، فالمسافة؟',options:['13','15','17','7'],correctIndex:0,explanation:'√(25+144)=√169=13.'),
];

List<QuizQuestion> realNumbersQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'square-roots':
      return squareRootsQuiz;
    case 'estimate-square-roots':
      return estimateSquareRootsQuiz;
    case 'venn-strategy':
      return vennStrategyQuiz;
    case 'real-numbers':
      return realNumbersQuiz;
    case 'pythagorean-theorem':
      return pythagoreanQuiz;
    case 'pythagorean-applications':
      return pythagoreanApplicationsQuiz;
    case 'irrational-representation':
      return irrationalRepresentationQuiz;
    case 'coordinate-distance':
      return coordinateDistanceQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allRealNumbersQuestions = <QuizQuestion>[
  ...squareRootsQuiz,
  ...estimateSquareRootsQuiz,
  ...vennStrategyQuiz,
  ...realNumbersQuiz,
  ...pythagoreanQuiz,
  ...pythagoreanApplicationsQuiz,
  ...irrationalRepresentationQuiz,
  ...coordinateDistanceQuiz,
];
