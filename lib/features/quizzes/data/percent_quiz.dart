import '../models/quiz_question.dart';

const mentalPercentQuiz = <QuizQuestion>[
  QuizQuestion(id:'mp-1',question:'ما 10% من 300؟',options:['20','30','40','60'],correctIndex:1,explanation:'10% تعني عُشر العدد، وعُشر 300 يساوي 30.'),
  QuizQuestion(id:'mp-2',question:'ما 50% من 84؟',options:['21','42','50','84'],correctIndex:1,explanation:'50% تساوي النصف، ونصف 84 يساوي 42.'),
  QuizQuestion(id:'mp-3',question:'ما 25% من 120؟',options:['20','25','30','40'],correctIndex:2,explanation:'25% تساوي الربع، وربع 120 يساوي 30.'),
  QuizQuestion(id:'mp-4',question:'ما 5% من 200؟',options:['5','10','15','20'],correctIndex:1,explanation:'10% من 200=20، و5% نصف ذلك =10.'),
  QuizQuestion(id:'mp-5',question:'أي كسر يساوي 20%؟',options:['1/2','1/4','1/5','2/5'],correctIndex:2,explanation:'20/100 تبسّط إلى 1/5.'),
];

const percentEstimationQuiz = <QuizQuestion>[
  QuizQuestion(id:'pe-1',question:'قدّر 19% من 51.',options:['حوالي 5','حوالي 10','حوالي 20','حوالي 30'],correctIndex:1,explanation:'19%≈20% و51≈50، و20% من 50=10.'),
  QuizQuestion(id:'pe-2',question:'قدّر 31% من 99.',options:['حوالي 10','حوالي 20','حوالي 30','حوالي 60'],correctIndex:2,explanation:'31%≈30% و99≈100، فيكون التقدير 30.'),
  QuizQuestion(id:'pe-3',question:'أي تقدير مناسب لـ48% من 202؟',options:['حوالي 20','حوالي 50','حوالي 100','حوالي 180'],correctIndex:2,explanation:'48%≈50% و202≈200، ونصف 200=100.'),
  QuizQuestion(id:'pe-4',question:'لماذا نستخدم التقدير؟',options:['للحصول على جواب قريب بسرعة','لإلغاء النسبة','لجعل الناتج أكبر دائمًا','لمنع الحساب الدقيق'],correctIndex:0,explanation:'التقدير يعطي قيمة قريبة ويساعد في التحقق.'),
  QuizQuestion(id:'pe-5',question:'قدّر 9% من 410.',options:['حوالي 4','حوالي 40','حوالي 90','حوالي 400'],correctIndex:1,explanation:'9%≈10% و10% من 410≈41.'),
];

const reasonablenessQuiz = <QuizQuestion>[
  QuizQuestion(id:'rs-1',question:'أي ناتج معقول لـ51% من 80؟',options:['4','20','40','160'],correctIndex:2,explanation:'51% قريب من النصف، ونصف 80=40.'),
  QuizQuestion(id:'rs-2',question:'إذا حسبت 25% من 40 وخرج 100، فهذا الناتج:',options:['معقول','غير معقول','دقيق دائمًا','لا يمكن فحصه'],correctIndex:1,explanation:'ربع 40 قريب من 10، لذلك 100 بعيد جدًا.'),
  QuizQuestion(id:'rs-3',question:'أفضل طريقة سريعة لفحص الجواب هي:',options:['التقدير','تغيير الوحدة','حذف الفاصلة','مضاعفة الناتج دائمًا'],correctIndex:0,explanation:'التقدير يكشف النتائج البعيدة عن المتوقع.'),
  QuizQuestion(id:'rs-4',question:'49% من 200 يجب أن يكون قريبًا من:',options:['10','50','100','400'],correctIndex:2,explanation:'49% قريب من 50% ونصف 200=100.'),
  QuizQuestion(id:'rs-5',question:'هل التحقق من المعقولية يثبت الدقة التامة؟',options:['نعم دائمًا','لا، لكنه يكشف الأخطاء الكبيرة','فقط مع الكسور','فقط مع الأعداد الصحيحة'],correctIndex:1,explanation:'هو فحص منطقي وليس بديلاً عن الحساب الدقيق.'),
];

const percentEquationQuiz = <QuizQuestion>[
  QuizQuestion(id:'peq-1',question:'ما 30% من 90؟',options:['18','27','30','60'],correctIndex:1,explanation:'0.30×90=27.'),
  QuizQuestion(id:'peq-2',question:'أي معادلة تمثل 20% من 150؟',options:['x=20×150','x=0.20×150','x=150÷0.20','x=150+20'],correctIndex:1,explanation:'نحوّل 20% إلى 0.20 ثم نضرب في الكل.'),
  QuizQuestion(id:'peq-3',question:'إذا كان 18 يساوي 30% من عدد، فالعدد؟',options:['40','50','60','90'],correctIndex:2,explanation:'18=0.30×b، ومنه b=60.'),
  QuizQuestion(id:'peq-4',question:'حوّل 8% إلى عدد عشري.',options:['0.8','0.08','0.008','8.0'],correctIndex:1,explanation:'نقسم 8 على 100 فنحصل على 0.08.'),
  QuizQuestion(id:'peq-5',question:'ما 12% من 50؟',options:['5','6','7','12'],correctIndex:1,explanation:'0.12×50=6.'),
];

const percentChangeQuiz = <QuizQuestion>[
  QuizQuestion(id:'pc-1',question:'زاد عدد من 50 إلى 60. نسبة الزيادة؟',options:['10%','20%','25%','50%'],correctIndex:1,explanation:'الزيادة 10، و10/50=20%.'),
  QuizQuestion(id:'pc-2',question:'انخفض سعر من 100 إلى 80. نسبة النقصان؟',options:['10%','20%','25%','80%'],correctIndex:1,explanation:'النقصان 20 من أصل 100 أي 20%.'),
  QuizQuestion(id:'pc-3',question:'في التغير المئوي نقسم مقدار التغير على:',options:['القيمة الجديدة','القيمة الأصلية','مجموع القيمتين','100 دائمًا'],correctIndex:1,explanation:'المقام هو القيمة الأصلية.'),
  QuizQuestion(id:'pc-4',question:'من 40 إلى 50 يمثل:',options:['زيادة 10%','زيادة 20%','زيادة 25%','نقصان 25%'],correctIndex:2,explanation:'التغير 10، و10/40=25%.'),
  QuizQuestion(id:'pc-5',question:'من 200 إلى 150 يمثل نقصانًا قدره:',options:['20%','25%','30%','50%'],correctIndex:1,explanation:'النقصان 50، و50/200=25%.'),
];

List<QuizQuestion> percentQuizForLesson(String lessonId) {
  switch (lessonId) {
    case 'mental-percent':
      return mentalPercentQuiz;
    case 'percent-estimation':
      return percentEstimationQuiz;
    case 'reasonableness-strategy':
      return reasonablenessQuiz;
    case 'percent-equation':
      return percentEquationQuiz;
    case 'percent-change':
      return percentChangeQuiz;
    default:
      return const <QuizQuestion>[];
  }
}

const allPercentQuestions = <QuizQuestion>[
  ...mentalPercentQuiz,
  ...percentEstimationQuiz,
  ...reasonablenessQuiz,
  ...percentEquationQuiz,
  ...percentChangeQuiz,
];
