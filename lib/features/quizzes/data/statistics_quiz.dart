import '../models/quiz_question.dart';

const tableStrategyQuiz = <QuizQuestion>[
  QuizQuestion(id:'st-1',question:'ما الهدف الأساسي من إنشاء جدول؟',options:['تنظيم البيانات','تغيير القيم','حذف التكرار','زيادة الأعداد'],correctIndex:0,explanation:'الجدول ينظم البيانات ويجعل المقارنة أسهل.'),
  QuizQuestion(id:'st-2',question:'ماذا يجب أن يمثل كل عمود في الجدول؟',options:['نوعًا واحدًا من المعلومات','أكثر من وحدة عشوائيًا','لونًا فقط','قيمة ثابتة دائمًا'],correctIndex:0,explanation:'وضوح الأعمدة يعتمد على تخصيص كل عمود لنوع واحد من البيانات.'),
  QuizQuestion(id:'st-3',question:'إذا أردنا عد تكرار الفئات، نضيف عمودًا لـ:',options:['التكرار','المتوسط','الزاوية','المساحة'],correctIndex:0,explanation:'عمود التكرار يبين عدد مرات ظهور كل فئة.'),
  QuizQuestion(id:'st-4',question:'أفضل استخدام للجدول هو:',options:['تنظيم العلاقات بين البيانات','إلغاء الوحدات','تغيير النتائج','رسم دائرة'],correctIndex:0,explanation:'الجداول أدوات تنظيم وعرض.'),
  QuizQuestion(id:'st-5',question:'أي ممارسة صحيحة؟',options:['خلط وحدات مختلفة في العمود','تسمية الأعمدة بوضوح','ترك الفئات بلا أسماء','تكرار الصف نفسه'],correctIndex:1,explanation:'تسمية الأعمدة توضح معنى البيانات.'),
];

const histogramsQuiz = <QuizQuestion>[
  QuizQuestion(id:'hg-1',question:'ماذا يمثل ارتفاع العمود في المدرج التكراري؟',options:['التكرار','المتوسط','المدى','الفئة نفسها'],correctIndex:0,explanation:'ارتفاع العمود يمثل تكرار القيم في الفئة.'),
  QuizQuestion(id:'hg-2',question:'أعمدة المدرج التكراري تكون غالبًا:',options:['متباعدة','متجاورة','دائرية','مائلة'],correctIndex:1,explanation:'الفئات العددية المتصلة تجعل الأعمدة متجاورة.'),
  QuizQuestion(id:'hg-3',question:'المحور الأفقي يمثل عادةً:',options:['الفئات','التكرار','المتوسط فقط','الوسيط'],correctIndex:0,explanation:'الفئات تظهر على المحور الأفقي.'),
  QuizQuestion(id:'hg-4',question:'إذا بلغ ارتفاع عمود فئة ما 8 فهذا يعني:',options:['هناك 8 قيم في الفئة','المتوسط 8','المدى 8','الفئة تبدأ من 8'],correctIndex:0,explanation:'الارتفاع يساوي التكرار.'),
  QuizQuestion(id:'hg-5',question:'أفضل استخدام للمدرج التكراري هو:',options:['عرض توزيع بيانات عددية في فئات','عرض أجزاء الكل فقط','إيجاد وتر مثلث','حل تناسب'],correctIndex:0,explanation:'المدرج يعرض توزيع البيانات العددية المجمعة.'),
];

const circleSectorsQuiz = <QuizQuestion>[
  QuizQuestion(id:'cs-1',question:'مجموع نسب القطاعات الدائرية يساوي:',options:['50%','90%','100%','360%'],correctIndex:2,explanation:'الدائرة تمثل كامل البيانات أي 100%.'),
  QuizQuestion(id:'cs-2',question:'قطاع يمثل 25%، زاويته؟',options:['45°','90°','120°','180°'],correctIndex:1,explanation:'0.25×360=90°.'),
  QuizQuestion(id:'cs-3',question:'قطاع زاويته 180° يمثل:',options:['25%','50%','75%','100%'],correctIndex:1,explanation:'180/360=0.5=50%.'),
  QuizQuestion(id:'cs-4',question:'أي تمثيل أفضل لأجزاء من كل؟',options:['قطاعات دائرية','خط أعداد','مخطط فن فقط','جدول ضرب'],correctIndex:0,explanation:'القطاعات الدائرية توضح نسب الأجزاء من الكل.'),
  QuizQuestion(id:'cs-5',question:'لحساب زاوية قطاع نستخدم:',options:['النسبة×360°','النسبة÷360°','360+النسبة','100-النسبة'],correctIndex:0,explanation:'زاوية القطاع = النسبة العشرية × 360°.'),
];

const centralTendencyQuiz = <QuizQuestion>[
  QuizQuestion(id:'ct-1',question:'ما منوال البيانات 2،4،4،7؟',options:['2','4','7','17'],correctIndex:1,explanation:'4 هو الأكثر تكرارًا.'),
  QuizQuestion(id:'ct-2',question:'ما مدى البيانات 3،8،10؟',options:['3','5','7','10'],correctIndex:2,explanation:'المدى=10-3=7.'),
  QuizQuestion(id:'ct-3',question:'ما وسيط 1،3،5؟',options:['1','3','4','5'],correctIndex:1,explanation:'القيمة الوسطى بعد الترتيب هي 3.'),
  QuizQuestion(id:'ct-4',question:'أي مقياس يتأثر كثيرًا بالقيم المتطرفة؟',options:['المتوسط','الوسيط فقط','المنوال فقط','لا شيء'],correctIndex:0,explanation:'القيمة المتطرفة تؤثر مباشرة في مجموع القيم والمتوسط.'),
  QuizQuestion(id:'ct-5',question:'أي مقياس يصف الانتشار لا المركز؟',options:['المتوسط','الوسيط','المنوال','المدى'],correctIndex:3,explanation:'المدى يقيس الفرق بين أكبر وأصغر قيمة.'),
];

const dispersionQuiz = <QuizQuestion>[
  QuizQuestion(id:'dp-1',question:'التشتت يصف:',options:['انتشار البيانات','مركز الدائرة','نوع الزاوية','عامل التشابه'],correctIndex:0,explanation:'التشتت يبين مدى تقارب أو تباعد القيم.'),
  QuizQuestion(id:'dp-2',question:'أي مجموعة أكثر تشتتًا؟',options:['5،6،7','1،6،11','8،8،8','3،4،5'],correctIndex:1,explanation:'الفارق بين القيم فيها أكبر.'),
  QuizQuestion(id:'dp-3',question:'إذا كانت القيم متقاربة جدًا، فالتشتت:',options:['كبير','صغير','لا يمكن وصفه','يساوي 100'],correctIndex:1,explanation:'التقارب يعني تشتتًا أقل.'),
  QuizQuestion(id:'dp-4',question:'لماذا لا يكفي المتوسط وحده؟',options:['لأنه لا يصف الانتشار','لأنه لا يستخدم أرقامًا','لأنه دائمًا صفر','لأنه لا يمكن حسابه'],correctIndex:0,explanation:'قد تتساوى المتوسطات وتختلف درجة التشتت.'),
  QuizQuestion(id:'dp-5',question:'مجموعة 10،10،10 تشتتها مقارنة بـ5،10،15:',options:['أكبر','أصغر','متساوٍ','غير معروف'],correctIndex:1,explanation:'القيم الأولى متطابقة فلا انتشار بينها.'),
];

const boxPlotQuiz = <QuizQuestion>[
  QuizQuestion(id:'bp-1',question:'الخط داخل الصندوق يمثل عادةً:',options:['المتوسط','الوسيط','المنوال','المدى'],correctIndex:1,explanation:'الخط داخل الصندوق يمثل الوسيط.'),
  QuizQuestion(id:'bp-2',question:'الصندوق يمتد من:',options:['Q1 إلى Q3','أدنى قيمة إلى أعلى قيمة','المتوسط إلى الوسيط','الصفر إلى Q1'],correctIndex:0,explanation:'الصندوق يمثل النصف الأوسط بين الربيعين.'),
  QuizQuestion(id:'bp-3',question:'ما الذي يوضحه طول الصندوق؟',options:['انتشار النصف الأوسط','المتوسط فقط','عدد القيم','الوحدات'],correctIndex:0,explanation:'طول الصندوق مرتبط بالمدى الربيعي.'),
  QuizQuestion(id:'bp-4',question:'طرفا التمثيل يمتدان عادةً إلى:',options:['القيمتين الدنيا والعليا','المتوسط والمنوال','Q1 وQ3 فقط','الصفر دائمًا'],correctIndex:0,explanation:'الأطراف تصل إلى القيم القصوى وفق التمثيل المدرسي.'),
  QuizQuestion(id:'bp-5',question:'هذا التمثيل مفيد في:',options:['مقارنة توزيعات البيانات','قياس الزوايا','حل المعادلات فقط','رسم المثلثات'],correctIndex:0,explanation:'الصندوق وطرفاه يلخص التوزيع ويسهل المقارنة.'),
];

const stemLeafQuiz = <QuizQuestion>[
  QuizQuestion(id:'sl-1',question:'إذا كان المفتاح 4|7=47، فالقيمة 5|2 تعني:',options:['25','52','5.2','502'],correctIndex:1,explanation:'الساق 5 عشرات والورقة 2 آحاد.'),
  QuizQuestion(id:'sl-2',question:'ميزة تمثيل الساق والورقة أنه:',options:['يحافظ على القيم الأصلية','يحذف القيم','يعرض نسبًا فقط','لا يستخدم أعدادًا'],correctIndex:0,explanation:'يمكن استعادة كل قيمة من الساق والورقة.'),
  QuizQuestion(id:'sl-3',question:'في 6|3، ما الورقة؟',options:['6','3','63','0'],correctIndex:1,explanation:'الورقة هي الجزء على يمين الخط.'),
  QuizQuestion(id:'sl-4',question:'لماذا نحتاج مفتاحًا للتمثيل؟',options:['لتوضيح معنى الساق والورقة','لتغيير القيم','لزيادة التكرار','لإيجاد المتوسط مباشرة'],correctIndex:0,explanation:'المفتاح يوضح كيفية قراءة القيم.'),
  QuizQuestion(id:'sl-5',question:'4|2 5 7 تمثل:',options:['42،45،47','24،54،74','4.257','4257'],correctIndex:0,explanation:'الساق 4 مع الأوراق 2،5،7 تعطي 42،45،47.'),
];

const chooseDisplayQuiz = <QuizQuestion>[
  QuizQuestion(id:'cds-1',question:'أفضل تمثيل لأجزاء من كل هو:',options:['القطاعات الدائرية','المدرج فقط','خط الأعداد','جدول الضرب'],correctIndex:0,explanation:'القطاعات توضح النسب من كامل البيانات.'),
  QuizQuestion(id:'cds-2',question:'أفضل تمثيل لفئات عددية متصلة هو:',options:['المدرج التكراري','الدائرة فقط','مخطط فن','الانعكاس'],correctIndex:0,explanation:'المدرج مناسب لتوزيع القيم ضمن فئات.'),
  QuizQuestion(id:'cds-3',question:'أفضل تمثيل يحافظ على القيم الفردية هو:',options:['الساق والورقة','القطاع الدائري فقط','الصندوق فقط','المضلعات'],correctIndex:0,explanation:'يمكن قراءة القيم الأصلية من الساق والورقة.'),
  QuizQuestion(id:'cds-4',question:'اختيار الرسم يعتمد على:',options:['نوع البيانات والهدف','اللون فقط','عدد الصفحات','اسم الطالب'],correctIndex:0,explanation:'التمثيل الجيد يختار حسب البيانات والسؤال المطلوب.'),
  QuizQuestion(id:'cds-5',question:'الصندوق وطرفاه مفيد خصوصًا في:',options:['مقارنة التوزيعات','إيجاد محيط دائرة','قسمة الكسور','حساب زاوية قائمة'],correctIndex:0,explanation:'هو ملخص بصري ممتاز لمقارنة التوزيعات.'),
];

List<QuizQuestion> statisticsQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'table-strategy':
      return tableStrategyQuiz;
    case 'histograms':
      return histogramsQuiz;
    case 'circle-sectors':
      return circleSectorsQuiz;
    case 'central-tendency-range':
      return centralTendencyQuiz;
    case 'dispersion':
      return dispersionQuiz;
    case 'box-plot':
      return boxPlotQuiz;
    case 'stem-leaf':
      return stemLeafQuiz;
    case 'choose-display':
      return chooseDisplayQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allStatisticsQuestions = <QuizQuestion>[
  ...tableStrategyQuiz,
  ...histogramsQuiz,
  ...circleSectorsQuiz,
  ...centralTendencyQuiz,
  ...dispersionQuiz,
  ...boxPlotQuiz,
  ...stemLeafQuiz,
  ...chooseDisplayQuiz,
];
