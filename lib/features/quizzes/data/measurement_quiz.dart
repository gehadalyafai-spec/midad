import '../models/quiz_question.dart';

const compositeAreasQuiz = <QuizQuestion>[
  QuizQuestion(id:'ma-1',question:'شكل مركب مساحتا جزأيه 14 و9. المساحة الكلية؟',options:['5','23','126','28'],correctIndex:1,explanation:'نجمع المساحتين: 14+9=23.'),
  QuizQuestion(id:'ma-2',question:'أفضل طريقة غالبًا لإيجاد مساحة شكل مركب:',options:['تقسيمه إلى أشكال بسيطة','جمع الأطوال فقط','ضرب جميع الأبعاد','تجاهل جزء منه'],correctIndex:0,explanation:'نقسم الشكل إلى أشكال مساحاتها معروفة.'),
  QuizQuestion(id:'ma-3',question:'إذا كان الشكل مستطيلًا كبيرًا مع جزء مفرغ، فالمساحة:',options:['الكبرى + المفرغة','الكبرى - المفرغة','المفرغة فقط','المحيط'],correctIndex:1,explanation:'نطرح مساحة الجزء المفرغ من المساحة الكبرى.'),
  QuizQuestion(id:'ma-4',question:'وحدة قياس المساحة تكون:',options:['وحدة طول','وحدة مربعة','وحدة مكعبة','درجة'],correctIndex:1,explanation:'المساحة تقاس بوحدات مربعة.'),
  QuizQuestion(id:'ma-5',question:'مستطيل 4×5 ومربع 2×2 غير متداخلين في شكل مركب. المساحة؟',options:['20','22','24','28'],correctIndex:2,explanation:'20+4=24.'),
];

const simplerProblemQuiz = <QuizQuestion>[
  QuizQuestion(id:'sm-1',question:'استراتيجية حل مسألة أبسط تعني:',options:['حل حالة أسهل مشابهة','حذف السؤال','تغيير المطلوب','التخمين فقط'],correctIndex:0,explanation:'نبدأ بحالة أبسط تحمل العلاقة نفسها.'),
  QuizQuestion(id:'sm-2',question:'متى تكون هذه الاستراتيجية مفيدة؟',options:['عند تعقيد المسألة','فقط إذا لا توجد أرقام','فقط في الاحتمال','لا تستخدم أبدًا'],correctIndex:0,explanation:'تفيد في كشف نمط أو طريقة الحل في المسائل المعقدة.'),
  QuizQuestion(id:'sm-3',question:'بعد حل الحالة الأبسط ننتقل إلى:',options:['تعميم الفكرة على الأصلية','نسيان المسألة الأصلية','تغيير الوحدات فقط','إلغاء النتيجة'],correctIndex:0,explanation:'الهدف هو تطبيق ما تعلمناه على المسألة الأصلية.'),
  QuizQuestion(id:'sm-4',question:'ما الشرط المهم للحالة الأبسط؟',options:['أن تحافظ على العلاقة الأساسية','أن تكون مختلفة تمامًا','أن تكون بلا أرقام','أن يكون جوابها صفرًا'],correctIndex:0,explanation:'يجب أن تكون مشابهة في البنية الرياضية.'),
  QuizQuestion(id:'sm-5',question:'أي مثال مناسب؟',options:['حل شكل من جزأين قبل شكل من عدة أجزاء','تغيير الشكل إلى لون آخر','حذف نصف المعطيات','استخدام جواب عشوائي'],correctIndex:0,explanation:'هذه حالة أبسط تحافظ على الفكرة نفسها.'),
];

const threeDimensionalShapesQuiz = <QuizQuestion>[
  QuizQuestion(id:'td-1',question:'أي مجسم له قاعدتان دائريتان متطابقتان؟',options:['هرم','أسطوانة','مخروط','كرة'],correctIndex:1,explanation:'الأسطوانة لها قاعدتان دائريتان متوازيتان ومتطابقتان.'),
  QuizQuestion(id:'td-2',question:'المنشور يتميز بوجود:',options:['قاعدتين متطابقتين ومتوازيتين','قاعدة واحدة فقط','لا أوجه له','سطح كروي فقط'],correctIndex:0,explanation:'هذه خاصية أساسية للمنشور.'),
  QuizQuestion(id:'td-3',question:'الرأس في المجسم هو:',options:['نقطة تقاطع أحرف','سطح كامل','مساحة القاعدة','الحجم'],correctIndex:0,explanation:'الرأس نقطة تلتقي عندها أحرف.'),
  QuizQuestion(id:'td-4',question:'الحرف في المجسم هو:',options:['تقاطع وجهين','نقطة فقط','حجم الجسم','زاوية دائرية'],correctIndex:0,explanation:'الحرف ينتج عن التقاء وجهين.'),
  QuizQuestion(id:'td-5',question:'أي مجسم له قاعدة واحدة وأوجه جانبية مثلثة؟',options:['أسطوانة','هرم','منشور','كرة'],correctIndex:1,explanation:'الهرم له قاعدة واحدة وأوجه جانبية مثلثة.'),
];

const prismCylinderVolumeQuiz = <QuizQuestion>[
  QuizQuestion(id:'pv-1',question:'حجم منشور مساحة قاعدته 10 وارتفاعه 6؟',options:['16','60','30','600'],correctIndex:1,explanation:'V=Bh=10×6=60.'),
  QuizQuestion(id:'pv-2',question:'قانون حجم المنشور هو:',options:['V=Bh','V=B+h','V=2B','V=B/h'],correctIndex:0,explanation:'الحجم = مساحة القاعدة × الارتفاع.'),
  QuizQuestion(id:'pv-3',question:'قانون حجم الأسطوانة:',options:['πr²h','2πr','πr²','1/3πr²h'],correctIndex:0,explanation:'مساحة القاعدة πr² ثم نضرب في الارتفاع.'),
  QuizQuestion(id:'pv-4',question:'وحدة قياس الحجم:',options:['متر','متر مربع','متر مكعب','درجة'],correctIndex:2,explanation:'الحجم يقاس بوحدات مكعبة.'),
  QuizQuestion(id:'pv-5',question:'أسطوانة نصف قطرها 2 وارتفاعها 3، حجمها الرمزي؟',options:['6π','12π','18π','4π'],correctIndex:1,explanation:'π×2²×3=12π.'),
];

const pyramidConeVolumeQuiz = <QuizQuestion>[
  QuizQuestion(id:'pcv-1',question:'قانون حجم الهرم:',options:['Bh','1/2Bh','1/3Bh','3Bh'],correctIndex:2,explanation:'حجم الهرم = ثلث مساحة القاعدة في الارتفاع.'),
  QuizQuestion(id:'pcv-2',question:'هرم B=18 وh=6. الحجم؟',options:['36','54','72','108'],correctIndex:0,explanation:'1/3×18×6=36.'),
  QuizQuestion(id:'pcv-3',question:'مخروط نصف قطره r وارتفاعه h، حجمه:',options:['πr²h','1/3πr²h','2πrh','πrh'],correctIndex:1,explanation:'حجم المخروط ثلث حجم الأسطوانة المناظرة.'),
  QuizQuestion(id:'pcv-4',question:'هرم ومنشور لهما القاعدة والارتفاع نفسيهما. حجم الهرم:',options:['يساوي المنشور','نصف المنشور','ثلث المنشور','ثلاثة أمثال المنشور'],correctIndex:2,explanation:'حجم الهرم ثلث حجم المنشور.'),
  QuizQuestion(id:'pcv-5',question:'نسيان 1/3 في قانون الهرم يؤدي إلى:',options:['حجم المنشور المناظر','المساحة','المحيط','الصفر'],correctIndex:0,explanation:'Bh هو قانون حجم المنشور.'),
];

const prismCylinderSurfaceQuiz = <QuizQuestion>[
  QuizQuestion(id:'pcs-1',question:'مساحة سطح المجسم تعني:',options:['مجموع مساحات الأسطح الخارجية','حجمه','ارتفاعه فقط','محيط قاعدته فقط'],correctIndex:0,explanation:'مساحة السطح تجمع مساحات كل الأوجه أو الأسطح الخارجية.'),
  QuizQuestion(id:'pcs-2',question:'مساحة سطح الأسطوانة:',options:['2πr²+2πrh','πr²h','1/3πr²h','2πr'],correctIndex:0,explanation:'نجمع القاعدتين والسطح الجانبي.'),
  QuizQuestion(id:'pcs-3',question:'2πr² في قانون سطح الأسطوانة يمثل:',options:['القاعدتين','السطح الجانبي','الحجم','الارتفاع'],correctIndex:0,explanation:'كل قاعدة مساحتها πr² وهناك قاعدتان.'),
  QuizQuestion(id:'pcs-4',question:'2πrh يمثل:',options:['المساحة الجانبية للأسطوانة','حجمها','قطرها','مساحة قاعدة واحدة'],correctIndex:0,explanation:'فرد السطح الجانبي يعطي مستطيلًا أبعاده 2πr وh.'),
  QuizQuestion(id:'pcs-5',question:'وحدة مساحة السطح:',options:['مكعبة','مربعة','طولية فقط','درجة'],correctIndex:1,explanation:'مساحة السطح تقاس بوحدات مربعة.'),
];

const pyramidSurfaceQuiz = <QuizQuestion>[
  QuizQuestion(id:'pys-1',question:'مساحة سطح الهرم تساوي:',options:['مساحة القاعدة + الأوجه الجانبية','الحجم فقط','المحيط فقط','الارتفاع فقط'],correctIndex:0,explanation:'نجمع مساحة القاعدة وكل الأوجه المثلثة.'),
  QuizQuestion(id:'pys-2',question:'قاعدة مساحتها 20 وأوجه جانبية مجموعها 30. مساحة السطح؟',options:['10','30','50','600'],correctIndex:2,explanation:'20+30=50.'),
  QuizQuestion(id:'pys-3',question:'لحساب مساحة الوجه المثلث الجانبي نحتاج غالبًا:',options:['الارتفاع المائل','حجم الهرم','قطر القاعدة فقط','المتوسط'],correctIndex:0,explanation:'مساحة المثلث الجانبي تستخدم ارتفاعه المائل.'),
  QuizQuestion(id:'pys-4',question:'هل الارتفاع المائل هو نفسه الارتفاع العمودي للهرم دائمًا؟',options:['نعم','لا','فقط في المكعب','فقط في الأسطوانة'],correctIndex:1,explanation:'هما طولان مختلفان في أغلب الأهرام.'),
  QuizQuestion(id:'pys-5',question:'مساحة السطح تقيس:',options:['السطوح الخارجية','الحيز الداخلي','عدد الرؤوس','الارتفاع فقط'],correctIndex:0,explanation:'هي مجموع مساحات الأسطح الخارجية.'),
];

List<QuizQuestion> measurementQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'composite-areas':
      return compositeAreasQuiz;
    case 'simpler-problem-strategy':
      return simplerProblemQuiz;
    case 'three-dimensional-shapes':
      return threeDimensionalShapesQuiz;
    case 'prism-cylinder-volume':
      return prismCylinderVolumeQuiz;
    case 'pyramid-cone-volume':
      return pyramidConeVolumeQuiz;
    case 'prism-cylinder-surface-area':
      return prismCylinderSurfaceQuiz;
    case 'pyramid-surface-area':
      return pyramidSurfaceQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allMeasurementQuestions = <QuizQuestion>[
  ...compositeAreasQuiz,
  ...simplerProblemQuiz,
  ...threeDimensionalShapesQuiz,
  ...prismCylinderVolumeQuiz,
  ...pyramidConeVolumeQuiz,
  ...prismCylinderSurfaceQuiz,
  ...pyramidSurfaceQuiz,
];
