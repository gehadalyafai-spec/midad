import '../models/quiz_question.dart';

const countOutcomesQuiz = <QuizQuestion>[
  QuizQuestion(id:'co-1',question:'لدى طالب 3 قمصان و2 بنطال. كم زيًا ممكنًا؟',options:['5','6','8','9'],correctIndex:1,explanation:'باستخدام مبدأ العد الأساسي: 3×2=6.'),
  QuizQuestion(id:'co-2',question:'أي أداة تساعد في عد النواتج لتجربة متعددة الخطوات؟',options:['مخطط شجري','خط أعداد فقط','مسطرة','منقلة'],correctIndex:0,explanation:'المخطط الشجري ينظم جميع الفروع والنواتج.'),
  QuizQuestion(id:'co-3',question:'إذا كان هناك 4 خيارات في الخطوة الأولى و3 في الثانية، فعدد النواتج؟',options:['7','12','16','24'],correctIndex:1,explanation:'4×3=12 ناتجًا.'),
  QuizQuestion(id:'co-4',question:'مبدأ العد الأساسي يعتمد غالبًا على:',options:['ضرب عدد الخيارات','جمع كل القيم دائمًا','طرح النواتج','إيجاد المتوسط'],correctIndex:0,explanation:'عند تركيب اختيارات مستقلة نضرب أعداد الخيارات.'),
  QuizQuestion(id:'co-5',question:'قلم من لونين ودفتر من 5 ألوان يعطي:',options:['7','10','12','25'],correctIndex:1,explanation:'2×5=10 اختيارات.'),
];

const compoundEventsQuiz = <QuizQuestion>[
  QuizQuestion(id:'ce-1',question:'الحادث المركب يتكون من:',options:['حدث واحد فقط','حدثين أو أكثر','عدد بلا تجربة','رسم فقط'],correctIndex:1,explanation:'الحادث المركب يجمع أكثر من حدث بسيط.'),
  QuizQuestion(id:'ce-2',question:'إذا كان هناك 8 نواتج و2 ملائمة، فالاحتمال؟',options:['1/2','1/4','1/8','3/4'],correctIndex:1,explanation:'2/8=1/4.'),
  QuizQuestion(id:'ce-3',question:'أول خطوة لحساب احتمال حادث مركب هي:',options:['تحديد فضاء العينة','ضرب النتيجة في 100','حذف بعض النواتج','إيجاد المتوسط'],correctIndex:0,explanation:'يجب معرفة جميع النواتج الممكنة أولًا.'),
  QuizQuestion(id:'ce-4',question:'احتمال 3 نواتج ملائمة من 12 ناتجًا يساوي:',options:['1/2','1/3','1/4','3/4'],correctIndex:2,explanation:'3/12=1/4.'),
  QuizQuestion(id:'ce-5',question:'الناتج الممكن يعني:',options:['نتيجة يمكن أن تحدث','نتيجة مستحيلة','قيمة متوسطة','تكرار فقط'],correctIndex:0,explanation:'فضاء العينة يضم كل النتائج الممكنة.'),
];

const theoreticalExperimentalQuiz = <QuizQuestion>[
  QuizQuestion(id:'te-1',question:'احتمال ظهور صورة في قطعة نقد عادلة نظريًا؟',options:['0','1/4','1/2','1'],correctIndex:2,explanation:'هناك نتيجتان متساويتان في الفرصة، لذا الاحتمال 1/2.'),
  QuizQuestion(id:'te-2',question:'ظهر حدث 20 مرة في 100 تجربة. الاحتمال التجريبي؟',options:['0.1','0.2','0.5','2'],correctIndex:1,explanation:'20/100=0.2.'),
  QuizQuestion(id:'te-3',question:'الاحتمال النظري يعتمد على:',options:['النواتج الممكنة','نتائج التجربة الفعلية فقط','المتوسط','المدى'],correctIndex:0,explanation:'الاحتمال النظري يحسب من فضاء العينة دون تنفيذ التجربة.'),
  QuizQuestion(id:'te-4',question:'الاحتمال التجريبي يعتمد على:',options:['بيانات حدثت فعليًا','التخمين فقط','النظرية فقط','الزوايا'],correctIndex:0,explanation:'يحسب من مرات وقوع الحدث في التجارب.'),
  QuizQuestion(id:'te-5',question:'مع زيادة عدد التجارب، الاحتمال التجريبي غالبًا:',options:['يقترب من النظري','يصبح صفرًا دائمًا','يتجاوز 1','يختفي'],correctIndex:0,explanation:'التكرار الكبير يجعل النتائج أقرب للتوقع النظري.'),
];

const representProblemQuiz = <QuizQuestion>[
  QuizQuestion(id:'rp-1',question:'أفضل تمثيل لتجربة من مرحلتين غالبًا:',options:['مخطط شجري','زاوية','مربع فقط','منقلة'],correctIndex:0,explanation:'المخطط الشجري يوضح الفروع المتتابعة.'),
  QuizQuestion(id:'rp-2',question:'وظيفة تمثيل المسألة هي:',options:['إظهار الحالات الممكنة بوضوح','تغيير الاحتمال','حذف البيانات','تكبير القيم'],correctIndex:0,explanation:'التمثيل ينظم النواتج والعلاقات.'),
  QuizQuestion(id:'rp-3',question:'في المخطط الشجري، كل فرع يمثل:',options:['خيارًا أو نتيجة في خطوة','متوسطًا','زاوية قائمة','مدى'],correctIndex:0,explanation:'الفروع تمثل الاختيارات أو النتائج الممكنة.'),
  QuizQuestion(id:'rp-4',question:'ما الذي يجب تجنبه عند التمثيل؟',options:['نسيان بعض الفروع','تسمية النتائج','تنظيم الخيارات','استخدام جدول'],correctIndex:0,explanation:'نسيان فرع يؤدي إلى فضاء عينة ناقص.'),
  QuizQuestion(id:'rp-5',question:'يمكن أيضًا تمثيل النواتج باستخدام:',options:['قائمة منظمة','منقلة فقط','حساب مساحة','جذر تربيعي فقط'],correctIndex:0,explanation:'القائمة المنظمة من أدوات تمثيل فضاء العينة.'),
];

const samplingPredictionQuiz = <QuizQuestion>[
  QuizQuestion(id:'sp7-1',question:'أفضل عينة لتمثيل طلاب المدرسة:',options:['طلاب من صفوف مختلفة باختيار عشوائي','أصدقاء الباحث فقط','طلاب فصل واحد فقط','فريق رياضي واحد'],correctIndex:0,explanation:'العشوائية والتنوع يقللان التحيز.'),
  QuizQuestion(id:'sp7-2',question:'العينة المتحيزة قد تؤدي إلى:',options:['تنبؤ مضلل','نتيجة أدق دائمًا','احتمال يساوي 1','عدم وجود بيانات'],correctIndex:0,explanation:'التحيز يجعل العينة لا تمثل المجتمع جيدًا.'),
  QuizQuestion(id:'sp7-3',question:'إذا أيد 30% من عينة ممثلة فكرة ما، نتوقع تقريبًا:',options:['نسبة قريبة في المجتمع','100% من المجتمع','0% دائمًا','لا علاقة'],correctIndex:0,explanation:'العينة الممثلة تستخدم لتقدير المجتمع.'),
  QuizQuestion(id:'sp7-4',question:'لماذا نستخدم العينة؟',options:['لأن فحص المجتمع كله قد يكون صعبًا','لزيادة التحيز','لإلغاء البيانات','لمنع التنبؤ'],correctIndex:0,explanation:'العينة توفر طريقة عملية لتقدير خصائص مجتمع كبير.'),
  QuizQuestion(id:'sp7-5',question:'أي عامل يحسن التنبؤ غالبًا؟',options:['عينة ممثلة بحجم مناسب','عينة من فئة واحدة','اختيار المتاح فقط','تجاهل العشوائية'],correctIndex:0,explanation:'التمثيل الجيد والحجم المناسب يزيدان موثوقية التقدير.'),
];

List<QuizQuestion> probabilityQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'count-outcomes':
      return countOutcomesQuiz;
    case 'compound-events':
      return compoundEventsQuiz;
    case 'theoretical-experimental':
      return theoreticalExperimentalQuiz;
    case 'represent-problem':
      return representProblemQuiz;
    case 'sampling-prediction':
      return samplingPredictionQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allProbabilityQuestions = <QuizQuestion>[
  ...countOutcomesQuiz,
  ...compoundEventsQuiz,
  ...theoreticalExperimentalQuiz,
  ...representProblemQuiz,
  ...samplingPredictionQuiz,
];
