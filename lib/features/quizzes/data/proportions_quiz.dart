import '../models/quiz_question.dart';

const proportionalRelationshipsQuiz = <QuizQuestion>[
  QuizQuestion(id:'pr-1',question:'أي علاقة متناسبة؟',options:['1→2 ، 2→4','1→2 ، 2→5','2→3 ، 4→7','1→3 ، 3→8'],correctIndex:0,explanation:'النسبة y/x ثابتة وتساوي 2.'),
  QuizQuestion(id:'pr-2',question:'في العلاقة y=4x، ما ثابت التناسب؟',options:['1','2','4','x'],correctIndex:2,explanation:'ثابت التناسب هو معامل x، أي 4.'),
  QuizQuestion(id:'pr-3',question:'أي وصف يميز العلاقة المتناسبة؟',options:['النسبة ثابتة','الفروق دائمًا صفر','لا تمر بالأصل','لا يمكن تمثيلها'],correctIndex:0,explanation:'ثبات النسبة بين الكميتين هو أساس التناسب.'),
  QuizQuestion(id:'pr-4',question:'إذا كانت y/x تساوي 5 لكل زوج، فالعلاقة:',options:['متناسبة','غير متناسبة','تربيعية','عشوائية'],correctIndex:0,explanation:'ثبات y/x يعني أن العلاقة متناسبة.'),
  QuizQuestion(id:'pr-5',question:'الرسم المتناسب الخطي يمر عادةً بـ:',options:['(1,1)','نقطة الأصل','أي نقطة فقط','محور y فقط'],correctIndex:1,explanation:'التناسب المباشر y=kx يمر بنقطة الأصل.'),
];

const rateOfChangeQuiz = <QuizQuestion>[
  QuizQuestion(id:'rc-1',question:'إذا تغيرت y من 4 إلى 10 وx من 1 إلى 3، فما معدل التغير؟',options:['2','3','4','6'],correctIndex:1,explanation:'(10-4)/(3-1)=6/2=3.'),
  QuizQuestion(id:'rc-2',question:'معدل التغير يساوي:',options:['Δx/Δy','Δy/Δx','x+y','xy'],correctIndex:1,explanation:'معدل التغير هو التغير الرأسي على التغير الأفقي.'),
  QuizQuestion(id:'rc-3',question:'معدل تغير سالب يعني أن y غالبًا:',options:['تزداد','تنقص','ثابتة دائمًا','تساوي صفرًا'],correctIndex:1,explanation:'الإشارة السالبة تدل على تناقص y مع زيادة x.'),
  QuizQuestion(id:'rc-4',question:'إذا زادت y بمقدار 20 عند زيادة x بمقدار 5، فالمعدل؟',options:['2','4','5','10'],correctIndex:1,explanation:'20/5=4.'),
  QuizQuestion(id:'rc-5',question:'لماذا نهتم بوحدات معدل التغير؟',options:['لتفسير المعنى','لتغيير الإشارة','لإلغاء الأعداد','لا أهمية لها'],correctIndex:0,explanation:'الوحدات توضّح معنى المعدل مثل ريال لكل ساعة.'),
];

const constantRateQuiz = <QuizQuestion>[
  QuizQuestion(id:'cr3-1',question:'متى يكون معدل التغير ثابتًا؟',options:['عندما تتغير النسبة كل مرة','عندما تتكرر قيمة الميل','عندما تكون y صفرًا','عندما لا توجد نقاط'],correctIndex:1,explanation:'ثبات الميل بين النقاط يعني معدل تغير ثابت.'),
  QuizQuestion(id:'cr3-2',question:'إذا زادت x بمقدار 2 وy بمقدار 8 كل مرة، فالمعدل؟',options:['2','4','6','8'],correctIndex:1,explanation:'8/2=4.'),
  QuizQuestion(id:'cr3-3',question:'الرسم ذو معدل التغير الثابت يكون:',options:['خطًا مستقيمًا','دائرة','منحنى دائمًا','نقطة واحدة'],correctIndex:0,explanation:'العلاقة الخطية ذات ميل ثابت تظهر كخط مستقيم.'),
  QuizQuestion(id:'cr3-4',question:'إذا كان المعدل 3، فزيادة x بمقدار 4 تقابل زيادة y بمقدار:',options:['7','12','1','3'],correctIndex:1,explanation:'Δy=3×4=12.'),
  QuizQuestion(id:'cr3-5',question:'ما الذي يجب مقارنته للتحقق من ثبات المعدل؟',options:['ألوان الجدول','Δy/Δx بين فترات مختلفة','أكبر قيمة فقط','عدد الصفوف'],correctIndex:1,explanation:'نقارن معدل التغير بين أكثر من زوج من النقاط.'),
];

const solveProportionsQuiz = <QuizQuestion>[
  QuizQuestion(id:'sp-1',question:'حل 3/5 = x/20.',options:['8','10','12','15'],correctIndex:2,explanation:'3×20=5x، 60=5x، إذن x=12.'),
  QuizQuestion(id:'sp-2',question:'في a/b=c/d، الضرب التبادلي يعطي:',options:['a+b=c+d','ad=bc','ab=cd','ac=bd'],correctIndex:1,explanation:'نضرب الطرفين المتقابلين: ad=bc.'),
  QuizQuestion(id:'sp-3',question:'حل x/6 = 4/12.',options:['1','2','3','4'],correctIndex:1,explanation:'12x=24، إذن x=2.'),
  QuizQuestion(id:'sp-4',question:'قبل حل التناسب يجب التأكد من:',options:['ترتيب الكميات المتناظرة','جمع المقامات','تغيير كل الإشارات','حذف الوحدات'],correctIndex:0,explanation:'ترتيب الكميات المتناظرة يمنع تكوين تناسب خاطئ.'),
  QuizQuestion(id:'sp-5',question:'حل 5/x = 10/8.',options:['2','4','8','16'],correctIndex:1,explanation:'5×8=10x، 40=10x، إذن x=4.'),
];

const drawingStrategyQuiz = <QuizQuestion>[
  QuizQuestion(id:'ds-1',question:'ما فائدة الرسم في المسألة اللفظية؟',options:['تنظيم العلاقات بصريًا','إلغاء المعطيات','تغيير الوحدات','تخمين الجواب فقط'],correctIndex:0,explanation:'الرسم ينظم المعطيات والعلاقات.'),
  QuizQuestion(id:'ds-2',question:'ما الخطوة الأولى؟',options:['الرسم العشوائي','تحديد المعطيات','حذف المجهول','ضرب كل القيم'],correctIndex:1,explanation:'نحدد المعطيات أولًا ثم نمثلها.'),
  QuizQuestion(id:'ds-3',question:'هل يجب أن يكون الرسم بمقياس دقيق دائمًا؟',options:['نعم','لا','فقط في الجبر','فقط إذا لا توجد أرقام'],correctIndex:1,explanation:'الرسم التخطيطي قد يكون تقريبيًا ما دام يوضح العلاقات.'),
  QuizQuestion(id:'ds-4',question:'ما الذي لا ينبغي فعله؟',options:['تسمية المجهول','وضع المعطيات','قياس قيمة غير معطاة من الرسم وحده','تبسيط الشكل'],correctIndex:2,explanation:'الرسم التنظيمي ليس مصدرًا لقيمة غير معطاة.'),
  QuizQuestion(id:'ds-5',question:'بعد الرسم نبحث عن:',options:['علاقة رياضية مناسبة','لون جديد','عدد صفحات','خط أكبر'],correctIndex:0,explanation:'الرسم يساعدنا على اختيار العلاقة أو القانون المناسب.'),
];

const similarPolygonsQuiz = <QuizQuestion>[
  QuizQuestion(id:'sim-1',question:'المضلعات المتشابهة لها:',options:['زوايا متناظرة متطابقة وأضلاع متناسبة','أضلاع متساوية دائمًا','مساحات متساوية','محيطات متساوية دائمًا'],correctIndex:0,explanation:'هذا هو تعريف التشابه.'),
  QuizQuestion(id:'sim-2',question:'3،4،5 و6،8،10 لهما عامل تشابه:',options:['1/2 من الأول للثاني','2 من الأول للثاني','3','4'],correctIndex:1,explanation:'كل ضلع في الثاني يساوي ضعفي المناظر في الأول.'),
  QuizQuestion(id:'sim-3',question:'هل التشابه يعني التطابق؟',options:['دائمًا','لا، قد يختلف الحجم','فقط للمربعات','فقط للمثلثات'],correctIndex:1,explanation:'المتشابهات لها الشكل نفسه وقد تختلف في الحجم.'),
  QuizQuestion(id:'sim-4',question:'إذا كان عامل التشابه 3 وطول ضلع 5، فالمناظر؟',options:['8','15','2','5'],correctIndex:1,explanation:'5×3=15.'),
  QuizQuestion(id:'sim-5',question:'أي شيء يجب أن يكون ثابتًا بين الأضلاع المتناظرة؟',options:['الفرق','النسبة','المجموع','الإشارة'],correctIndex:1,explanation:'نسب الأضلاع المتناظرة متساوية.'),
];

const scaleUpDownQuiz = <QuizQuestion>[
  QuizQuestion(id:'sc-1',question:'عامل مقياس 2 يعني:',options:['تصغير للنصف','تكبير للضعف','لا تغيير','دوران'],correctIndex:1,explanation:'كل طول يضرب في 2.'),
  QuizQuestion(id:'sc-2',question:'عامل 0.5 يعني:',options:['تكبير','تصغير للنصف','إزاحة','انعكاس'],correctIndex:1,explanation:'عامل أقل من 1 يؤدي إلى تصغير.'),
  QuizQuestion(id:'sc-3',question:'طول 12 صُغّر بعامل 1/3، يصبح:',options:['3','4','6','36'],correctIndex:1,explanation:'12×1/3=4.'),
  QuizQuestion(id:'sc-4',question:'للحفاظ على التشابه يجب:',options:['استخدام العامل نفسه لكل الأبعاد','تغيير كل بعد بعامل مختلف','تغيير الزوايا','حذف ضلع'],correctIndex:0,explanation:'عامل مقياس واحد يحافظ على الشكل.'),
  QuizQuestion(id:'sc-5',question:'طول 7 كُبّر بعامل 1.5، يصبح:',options:['8.5','10.5','12','14'],correctIndex:1,explanation:'7×1.5=10.5.'),
];

const indirectMeasurementQuiz = <QuizQuestion>[
  QuizQuestion(id:'im-1',question:'القياس غير المباشر يعتمد غالبًا على:',options:['التشابه','الجمع فقط','الاحتمال','المساحة فقط'],correctIndex:0,explanation:'نستخدم مثلثات أو أشكالًا متشابهة ونسبًا متناظرة.'),
  QuizQuestion(id:'im-2',question:'عمود 2 م ظله 3 م، جسم ظله 9 م. ارتفاعه؟',options:['4','6','8','12'],correctIndex:1,explanation:'2/3=h/9، فيكون h=6.'),
  QuizQuestion(id:'im-3',question:'لماذا نستخدم القياس غير المباشر؟',options:['عندما يصعب القياس مباشرة','لإلغاء الوحدات','فقط للأعداد الصغيرة','لمنع الرسم'],correctIndex:0,explanation:'يستخدم عندما يكون القياس المباشر صعبًا أو غير عملي.'),
  QuizQuestion(id:'im-4',question:'في التناسب يجب مقارنة:',options:['أضلاع متناظرة','أي ضلعين عشوائيًا','الألوان','المساحات فقط'],correctIndex:0,explanation:'التناسب الصحيح يعتمد على الأضلاع المتناظرة.'),
  QuizQuestion(id:'im-5',question:'1.5/2 = h/8، قيمة h؟',options:['4','6','8','12'],correctIndex:1,explanation:'2h=12، إذن h=6.'),
];

List<QuizQuestion> proportionsQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'proportional-relationships':
      return proportionalRelationshipsQuiz;
    case 'rate-of-change':
      return rateOfChangeQuiz;
    case 'constant-rate':
      return constantRateQuiz;
    case 'solve-proportions':
      return solveProportionsQuiz;
    case 'drawing-strategy':
      return drawingStrategyQuiz;
    case 'similar-polygons':
      return similarPolygonsQuiz;
    case 'scale-up-down':
      return scaleUpDownQuiz;
    case 'indirect-measurement':
      return indirectMeasurementQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allProportionsQuestions = <QuizQuestion>[
  ...proportionalRelationshipsQuiz,
  ...rateOfChangeQuiz,
  ...constantRateQuiz,
  ...solveProportionsQuiz,
  ...drawingStrategyQuiz,
  ...similarPolygonsQuiz,
  ...scaleUpDownQuiz,
  ...indirectMeasurementQuiz,
];
