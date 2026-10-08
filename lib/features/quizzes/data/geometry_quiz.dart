import '../models/quiz_question.dart';

const anglesLinesQuiz = <QuizQuestion>[
  QuizQuestion(id:'al-1',question:'مجموع زاويتين متتامتين يساوي:',options:['90°','180°','270°','360°'],correctIndex:0,explanation:'الزاويتان المتتامتان مجموعهما 90°.'),
  QuizQuestion(id:'al-2',question:'مجموع زاويتين متكاملتين يساوي:',options:['90°','120°','180°','360°'],correctIndex:2,explanation:'الزاويتان المتكاملتان مجموعهما 180°.'),
  QuizQuestion(id:'al-3',question:'المستقيمان المتعامدان يكونان زاوية:',options:['45°','60°','90°','180°'],correctIndex:2,explanation:'التعامد يعني زاوية قائمة مقدارها 90°.'),
  QuizQuestion(id:'al-4',question:'إذا كانت زاوية 70° ومكملة لأخرى، فالأخرى؟',options:['20°','70°','110°','290°'],correctIndex:2,explanation:'180-70=110°.'),
  QuizQuestion(id:'al-5',question:'أي وصف يناسب مستقيمين متوازيين؟',options:['يلتقيان بزاوية قائمة','لا يلتقيان في المستوى','متطابقان دائمًا','يكونان دائرة'],correctIndex:1,explanation:'المستقيمان المتوازيان لا يلتقيان.'),
];

const logicalReasoningQuiz = <QuizQuestion>[
  QuizQuestion(id:'lr-1',question:'إذا كان أ=ب وب=ج، فإن:',options:['أ>ج','أ<ج','أ=ج','لا يمكن تحديده'],correctIndex:2,explanation:'هذه خاصية التعدي للمساواة.'),
  QuizQuestion(id:'lr-2',question:'التبرير المنطقي الجيد يعتمد على:',options:['معطيات وقواعد','التخمين فقط','شكل الرسم وحده','اللون'],correctIndex:0,explanation:'الاستنتاج الصحيح يبنى على معلومات وقواعد معروفة.'),
  QuizQuestion(id:'lr-3',question:'هل يمكن استنتاج أن زاويتين متساويتان من الشكل فقط؟',options:['نعم دائمًا','لا دون معلومة أو علامة','فقط إذا كان اللون نفسه','فقط في المثلث'],correctIndex:1,explanation:'الرسم وحده لا يكفي لإثبات القياسات.'),
  QuizQuestion(id:'lr-4',question:'أي عبارة تمثل استنتاجًا منطقيًا؟',options:['كل المربعات مستطيلات، وهذا مربع، إذن هو مستطيل','هذا يبدو كبيرًا إذن هو 10','ربما','لا شيء مما سبق'],correctIndex:0,explanation:'النتيجة مبنية على قاعدة ومعطى صحيحين.'),
  QuizQuestion(id:'lr-5',question:'ترتيب التبرير يبدأ عادةً بـ:',options:['النتيجة','المعطيات','الحذف','التخمين'],correctIndex:1,explanation:'نبدأ بما نعرفه ثم نبني عليه.'),
];

const polygonsAnglesQuiz = <QuizQuestion>[
  QuizQuestion(id:'pa5-1',question:'مجموع زوايا رباعي؟',options:['180°','360°','540°','720°'],correctIndex:1,explanation:'(4-2)×180=360°.'),
  QuizQuestion(id:'pa5-2',question:'مجموع زوايا خماسي؟',options:['360°','540°','720°','900°'],correctIndex:1,explanation:'(5-2)×180=540°.'),
  QuizQuestion(id:'pa5-3',question:'مجموع زوايا سداسي؟',options:['540°','720°','900°','1080°'],correctIndex:1,explanation:'(6-2)×180=720°.'),
  QuizQuestion(id:'pa5-4',question:'كم قياس كل زاوية في مربع؟',options:['60°','90°','108°','120°'],correctIndex:1,explanation:'المربع أربع زواياه قائمة.'),
  QuizQuestion(id:'pa5-5',question:'صيغة مجموع الزوايا الداخلية لمضلع n أضلاع:',options:['n×180','(n-1)×180','(n-2)×180','(n+2)×180'],correctIndex:2,explanation:'الصيغة هي (n-2)×180°.'),
];

const congruentPolygonsQuiz = <QuizQuestion>[
  QuizQuestion(id:'cp-1',question:'المضلعات المتطابقة لها:',options:['الشكل نفسه فقط','الحجم نفسه فقط','الشكل والحجم نفسيهما','زوايا مختلفة'],correctIndex:2,explanation:'التطابق يعني تساوي الشكل والحجم.'),
  QuizQuestion(id:'cp-2',question:'في △ABC ≅ △DEF، الرأس B يقابل:',options:['D','E','F','A'],correctIndex:1,explanation:'ترتيب الرؤوس يحدد التناظر: A↔D وB↔E وC↔F.'),
  QuizQuestion(id:'cp-3',question:'أي شيء يجب أن يتساوى في مضلعين متطابقين؟',options:['الأضلاع المتناظرة','المساحات فقط','عدد الألوان','المحيط فقط'],correctIndex:0,explanation:'الأضلاع والزوايا المتناظرة متطابقة.'),
  QuizQuestion(id:'cp-4',question:'هل كل شكلين متشابهين متطابقان؟',options:['نعم','لا','فقط إذا كانا مثلثين','فقط إذا كانا مربعين'],correctIndex:1,explanation:'قد يختلف الحجم في التشابه.'),
  QuizQuestion(id:'cp-5',question:'التطابق يحافظ على:',options:['الأطوال والزوايا','الزوايا فقط','الأطوال فقط','لا شيء'],correctIndex:0,explanation:'الشكل والحجم يبقيان نفسيهما.'),
];

const symmetryQuiz = <QuizQuestion>[
  QuizQuestion(id:'sy-1',question:'كم محور تماثل للمربع؟',options:['1','2','3','4'],correctIndex:3,explanation:'للمربع أربعة محاور تماثل.'),
  QuizQuestion(id:'sy-2',question:'كم محور تماثل للمستطيل غير المربع؟',options:['1','2','3','4'],correctIndex:1,explanation:'له محور أفقي ومحور رأسي.'),
  QuizQuestion(id:'sy-3',question:'متى يكون الخط محور تماثل؟',options:['إذا قسم الشكل لنصفين متطابقين','إذا مر بالمركز فقط','إذا كان رأسيًا فقط','إذا كان أطول من الشكل'],correctIndex:0,explanation:'محور التماثل يجعل النصفين ينطبقان.'),
  QuizQuestion(id:'sy-4',question:'أي شكل له عدد كبير من محاور التماثل؟',options:['الدائرة','مثلث مختلف الأضلاع','متوازي الأضلاع العام','شكل غير منتظم'],correctIndex:0,explanation:'كل قطر في الدائرة يمثل محور تماثل.'),
  QuizQuestion(id:'sy-5',question:'التماثل الخطي يشبه:',options:['الطي','التمدد','القياس فقط','الجمع'],correctIndex:0,explanation:'يمكن تصور طي الشكل حول المحور لتطابق النصفين.'),
];

const reflectionQuiz = <QuizQuestion>[
  QuizQuestion(id:'rf-1',question:'صورة (3,2) حول محور y؟',options:['(3,-2)','(-3,2)','(-3,-2)','(2,3)'],correctIndex:1,explanation:'يتغير x وتبقى y.'),
  QuizQuestion(id:'rf-2',question:'صورة (4,-1) حول محور x؟',options:['(-4,-1)','(4,1)','(-4,1)','(1,4)'],correctIndex:1,explanation:'حول محور x تتغير إشارة y فقط.'),
  QuizQuestion(id:'rf-3',question:'الانعكاس ينتج:',options:['صورة مرآة','تكبير فقط','دوران فقط','تغيير حجم'],correctIndex:0,explanation:'الانعكاس يشبه صورة المرآة.'),
  QuizQuestion(id:'rf-4',question:'النقطة وصورتها عن خط الانعكاس تكونان:',options:['على مسافتين متساويتين','في الموقع نفسه دائمًا','بزاوية 90° دائمًا','بحجم مختلف'],correctIndex:0,explanation:'المسافة العمودية إلى خط الانعكاس متساوية.'),
  QuizQuestion(id:'rf-5',question:'هل الانعكاس يغير طول الأضلاع؟',options:['نعم','لا','فقط في المربع','فقط في المثلث'],correctIndex:1,explanation:'الانعكاس تحويل يحافظ على الأطوال.'),
];

const translationQuiz = <QuizQuestion>[
  QuizQuestion(id:'tr-1',question:'انسحاب (2,3) أربع وحدات يمينًا يعطي:',options:['(6,3)','(-2,3)','(2,7)','(6,7)'],correctIndex:0,explanation:'نضيف 4 إلى x فقط.'),
  QuizQuestion(id:'tr-2',question:'انسحاب (1,5) وحدتين أسفل يعطي:',options:['(1,3)','(3,5)','(1,7)','(-1,5)'],correctIndex:0,explanation:'نطرح 2 من y.'),
  QuizQuestion(id:'tr-3',question:'الانسحاب يحافظ على:',options:['الشكل والحجم','الحجم فقط','اللون فقط','لا شيء'],correctIndex:0,explanation:'كل النقاط تتحرك بنفس المتجه.'),
  QuizQuestion(id:'tr-4',question:'في الانسحاب تتحرك كل نقاط الشكل:',options:['المسافة والاتجاه نفسيهما','مسافات مختلفة','اتجاهات مختلفة','حول مركز'],correctIndex:0,explanation:'هذه هي خاصية الانسحاب.'),
  QuizQuestion(id:'tr-5',question:'التحويل (x,y)→(x-3,y+2) يعني:',options:['3 يسار و2 أعلى','3 يمين و2 أعلى','3 يسار و2 أسفل','دوران'],correctIndex:0,explanation:'طرح 3 من x يعني يسارًا وإضافة 2 إلى y يعني أعلى.'),
];

const rotationQuiz = <QuizQuestion>[
  QuizQuestion(id:'ro-1',question:'صورة (2,-3) بدوران 180° حول الأصل؟',options:['(-2,3)','(2,3)','(-3,2)','(3,-2)'],correctIndex:0,explanation:'في 180° تتغير إشارتا الإحداثيين.'),
  QuizQuestion(id:'ro-2',question:'الدوران يحدث حول:',options:['مركز دوران','خط فقط','محور x دائمًا','أي ضلع'],correctIndex:0,explanation:'كل دوران له مركز.'),
  QuizQuestion(id:'ro-3',question:'هل الدوران يغير حجم الشكل؟',options:['نعم','لا','فقط عند 90°','فقط عند 180°'],correctIndex:1,explanation:'الدوران يحافظ على الشكل والحجم.'),
  QuizQuestion(id:'ro-4',question:'ما الذي يجب تحديده للدوران؟',options:['المركز والزاوية والاتجاه','اللون فقط','المساحة فقط','الطول فقط'],correctIndex:0,explanation:'هذه عناصر تعريف الدوران.'),
  QuizQuestion(id:'ro-5',question:'دوران كامل يعادل:',options:['90°','180°','270°','360°'],correctIndex:3,explanation:'الدورة الكاملة مقدارها 360°.'),
];

List<QuizQuestion> geometryQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'angles-lines':
      return anglesLinesQuiz;
    case 'logical-reasoning':
      return logicalReasoningQuiz;
    case 'polygons-angles':
      return polygonsAnglesQuiz;
    case 'congruent-polygons':
      return congruentPolygonsQuiz;
    case 'symmetry':
      return symmetryQuiz;
    case 'reflection':
      return reflectionQuiz;
    case 'translation':
      return translationQuiz;
    case 'rotation':
      return rotationQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allGeometryQuestions = <QuizQuestion>[
  ...anglesLinesQuiz,
  ...logicalReasoningQuiz,
  ...polygonsAnglesQuiz,
  ...congruentPolygonsQuiz,
  ...symmetryQuiz,
  ...reflectionQuiz,
  ...translationQuiz,
  ...rotationQuiz,
];
