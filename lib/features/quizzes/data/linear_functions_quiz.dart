import '../models/quiz_question.dart';

const sequencesQuiz = <QuizQuestion>[
  QuizQuestion(id:'sq-1',question:'ما الحد التالي في 2، 5، 8، 11؟',options:['12','13','14','15'],correctIndex:2,explanation:'الفرق ثابت ويساوي 3، لذا 11+3=14.'),
  QuizQuestion(id:'sq-2',question:'في المتتابعة 10، 20، 30، ... القاعدة هي:',options:['+5','+10','×2 دائمًا','-10'],correctIndex:1,explanation:'نضيف 10 في كل مرة.'),
  QuizQuestion(id:'sq-3',question:'ما الحد الرابع في 3، 6، 9، ...؟',options:['10','12','15','18'],correctIndex:1,explanation:'الحدود تزيد بمقدار 3، فالحد الرابع 12.'),
  QuizQuestion(id:'sq-4',question:'المتتابعة هي:',options:['قائمة مرتبة من الحدود','مجموعة بلا ترتيب','معادلة فقط','رسم دائري'],correctIndex:0,explanation:'المتتابعة قائمة مرتبة وفق قاعدة أو نمط.'),
  QuizQuestion(id:'sq-5',question:'ما القاعدة في 1، 2، 4، 8؟',options:['+1','+2','×2','×4'],correctIndex:2,explanation:'كل حد يساوي ضعف الحد السابق.'),
];

const functionsQuiz = <QuizQuestion>[
  QuizQuestion(id:'fn-1',question:'متى تكون العلاقة دالة؟',options:['لكل مدخل مخرج واحد فقط','للمدخل مخرجان مختلفان','كل المخرجات مختلفة','لا تحتوي أعدادًا'],correctIndex:0,explanation:'الدالة تعطي لكل مدخل مخرجًا واحدًا فقط.'),
  QuizQuestion(id:'fn-2',question:'إذا ارتبط x=2 بالقيمتين 5 و7، فالعلاقة:',options:['دالة','ليست دالة','خطية دائمًا','تناسب طردي'],correctIndex:1,explanation:'المدخل نفسه له مخرجان مختلفان، لذا ليست دالة.'),
  QuizQuestion(id:'fn-3',question:'في f(x)=2x+1، ما f(3)؟',options:['5','6','7','8'],correctIndex:2,explanation:'2×3+1=7.'),
  QuizQuestion(id:'fn-4',question:'يمكن تمثيل الدالة بواسطة:',options:['جدول أو معادلة أو رسم','دائرة فقط','منقلة فقط','محيط فقط'],correctIndex:0,explanation:'للدوال صور تمثيل متعددة.'),
  QuizQuestion(id:'fn-5',question:'هل يمكن لمخرج واحد أن يرتبط بمدخلين مختلفين في دالة؟',options:['نعم','لا أبدًا','فقط إذا كان صفرًا','فقط في الرسم'],correctIndex:0,explanation:'الممنوع هو أن يرتبط المدخل الواحد بأكثر من مخرج.'),
];

const graphLinearFunctionsQuiz = <QuizQuestion>[
  QuizQuestion(id:'gl-1',question:'تمثيل الدالة الخطية يكون عادةً:',options:['خطًا مستقيمًا','دائرة','قطعًا مكافئًا دائمًا','نقطة واحدة'],correctIndex:0,explanation:'الدالة الخطية تمثل بخط مستقيم.'),
  QuizQuestion(id:'gl-2',question:'في y=2x+3، ما y عندما x=1؟',options:['2','3','5','6'],correctIndex:2,explanation:'2×1+3=5.'),
  QuizQuestion(id:'gl-3',question:'لبناء الرسم من معادلة يمكن أولًا:',options:['إنشاء جدول قيم','حذف المتغيرات','رسم دائرة','إيجاد الحجم'],correctIndex:0,explanation:'جدول القيم يعطي نقاطًا يمكن تمثيلها.'),
  QuizQuestion(id:'gl-4',question:'أي معادلة خطية؟',options:['y=3x-2','y=x²','y=1/x','y=√x'],correctIndex:0,explanation:'y=3x-2 على صورة y=mx+b.'),
  QuizQuestion(id:'gl-5',question:'إذا كانت النقاط لا تقع على خط مستقيم، فالعلاقة:',options:['ليست خطية','خطية دائمًا','تغير طردي دائمًا','ميلها صفر دائمًا'],correctIndex:0,explanation:'الخطية تتطلب أن يقع التمثيل على خط مستقيم.'),
];

const slopeQuiz = <QuizQuestion>[
  QuizQuestion(id:'slp-1',question:'الميل يساوي:',options:['التغير الرأسي ÷ الأفقي','الأفقي ÷ الرأسي','مجموع التغيرين','المتوسط'],correctIndex:0,explanation:'m=Δy/Δx.'),
  QuizQuestion(id:'slp-2',question:'مستقيم يرتفع 8 ويجري أفقيًا 4، ميله؟',options:['1/2','2','4','8'],correctIndex:1,explanation:'8/4=2.'),
  QuizQuestion(id:'slp-3',question:'المستقيم الأفقي ميله:',options:['0','1','غير معرف','سالب دائمًا'],correctIndex:0,explanation:'التغير الرأسي يساوي صفرًا.'),
  QuizQuestion(id:'slp-4',question:'ميل موجب يعني أن الخط:',options:['يرتفع من اليسار إلى اليمين','ينخفض','أفقي','رأسي دائمًا'],correctIndex:0,explanation:'الميل الموجب يدل على زيادة y مع زيادة x.'),
  QuizQuestion(id:'slp-5',question:'ميل النقطتين (1,2) و(3,6)؟',options:['1','2','3','4'],correctIndex:1,explanation:'(6-2)/(3-1)=4/2=2.'),
];

const directVariationQuiz = <QuizQuestion>[
  QuizQuestion(id:'dv-1',question:'صيغة التغير الطردي:',options:['y=kx','y=k+x','y=x/k+b','y=k/x'],correctIndex:0,explanation:'التغير الطردي يكتب y=kx.'),
  QuizQuestion(id:'dv-2',question:'في y=7x، ثابت التغير؟',options:['x','y','7','0'],correctIndex:2,explanation:'k هو معامل x ويساوي 7.'),
  QuizQuestion(id:'dv-3',question:'تمثيل التغير الطردي يمر بـ:',options:['نقطة الأصل','(1,1) دائمًا','محور y فقط','أي دائرة'],correctIndex:0,explanation:'عندما x=0 يكون y=0.'),
  QuizQuestion(id:'dv-4',question:'إذا y=3x وx=4، فـy؟',options:['7','12','16','1'],correctIndex:1,explanation:'3×4=12.'),
  QuizQuestion(id:'dv-5',question:'أي علاقة ليست تغيرًا طرديًا؟',options:['y=4x','y=0.5x','y=3x+2','y=-2x'],correctIndex:2,explanation:'وجود ثابت غير صفري يعني أن الخط لا يمر بنقطة الأصل.'),
];

const modelStrategyQuiz = <QuizQuestion>[
  QuizQuestion(id:'md-1',question:'رسم ثابت 15 و4 لكل ساعة يمثل:',options:['y=4x+15','y=15x+4','y=4x','y=19x'],correctIndex:0,explanation:'15 ثابت و4 هو المعدل لكل ساعة.'),
  QuizQuestion(id:'md-2',question:'النموذج الرياضي قد يكون:',options:['معادلة أو جدولًا أو رسمًا','لونًا فقط','رقمًا بلا معنى','محيطًا دائمًا'],correctIndex:0,explanation:'النموذج تمثيل رياضي للموقف.'),
  QuizQuestion(id:'md-3',question:'ما الهدف من النموذج؟',options:['وصف العلاقة والتنبؤ','حذف البيانات','تغيير الوحدات عشوائيًا','جعل كل شيء خطيًا'],correctIndex:0,explanation:'النموذج يساعد على فهم العلاقة واستخدامها.'),
  QuizQuestion(id:'md-4',question:'تكلفة 8 ريالات لكل قطعة دون رسم ثابت تمثل:',options:['y=8x','y=x+8','y=8+x²','y=8'],correctIndex:0,explanation:'التكلفة تتناسب طرديًا مع عدد القطع.'),
  QuizQuestion(id:'md-5',question:'النموذج الجيد يجب أن:',options:['يتوافق مع المعطيات','يضيف قيمًا غير موجودة','يتجاهل الوحدات','يكون معقدًا دائمًا'],correctIndex:0,explanation:'صحة النموذج تعتمد على مطابقته للموقف.'),
];

List<QuizQuestion> linearFunctionsQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'sequences':
      return sequencesQuiz;
    case 'functions':
      return functionsQuiz;
    case 'graph-linear-functions':
      return graphLinearFunctionsQuiz;
    case 'slope':
      return slopeQuiz;
    case 'direct-variation':
      return directVariationQuiz;
    case 'model-strategy':
      return modelStrategyQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allLinearFunctionsQuestions = <QuizQuestion>[
  ...sequencesQuiz,
  ...functionsQuiz,
  ...graphLinearFunctionsQuiz,
  ...slopeQuiz,
  ...directVariationQuiz,
  ...modelStrategyQuiz,
];
