import 'grade2_math_lesson_content.dart';

const realNumbersLessonContent = <String, LessonContent>{
  'square-roots': LessonContent(
    conceptLabel: 'الجذر التربيعي',
    conceptMain: '√a',
    conceptHint: 'العدد الذي مربعه يساوي a',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الجذر التربيعي لعدد موجب هو العدد الموجب الذي إذا ضرب في نفسه أعطى ذلك العدد. فمثلًا √49 = 7 لأن 7×7 = 49.',
    sectionTwoTitle: 'المربعات الكاملة',
    sectionTwoBody:
        'من المفيد حفظ بعض المربعات الكاملة مثل 1، 4، 9، 16، 25، 36، 49، 64، 81، 100؛ لأنها تساعدك في إيجاد الجذور بسرعة.',
    exampleFormula: '√64 = 8',
    exampleBody:
        'نبحث عن عدد مربعه 64. بما أن 8×8 = 64، فإن الجذر التربيعي الرئيسي لـ64 هو 8.',
    warning:
        'رمز √ يعطي الجذر التربيعي الرئيسي غير السالب. أما حل المعادلة س² = 64 فله حلان: 8 و-8.',
    practiceQuestion: 'ما قيمة √81؟',
    practiceOptions: ['7', '8', '9', '10'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 9×9 = 81، لذلك √81 = 9.',
  ),
  'estimate-square-roots': LessonContent(
    conceptLabel: 'التقدير',
    conceptMain: 'بين مربعين كاملين',
    conceptHint: 'حدد العددين الأقرب',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'إذا لم يكن العدد مربعًا كاملًا، نحدد مربعين كاملين يقع بينهما. وبذلك نعرف بين أي عددين صحيحين يقع الجذر.',
    sectionTwoTitle: 'كيف أقدّر؟',
    sectionTwoBody:
        'مثلًا 20 يقع بين 16 و25، لذلك √20 يقع بين 4 و5. ويمكن تحسين التقدير باستخدام قيمة عشرية مناسبة.',
    exampleFormula: '4 < √20 < 5',
    exampleBody:
        'لأن 4² = 16 و5² = 25، فإن √20 بين 4 و5، وهو أقرب إلى 4 من 5.',
    warning:
        'لا تقرّب الجذر قبل تحديد المربعين الكاملين المحيطين به؛ هذه الخطوة تمنع كثيرًا من أخطاء التقدير.',
    practiceQuestion: 'بين أي عددين صحيحين يقع √50؟',
    practiceOptions: ['5 و6', '6 و7', '7 و8', '8 و9'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 7² = 49 و8² = 64، لذلك √50 بين 7 و8.',
  ),
  'venn-strategy': LessonContent(
    conceptLabel: 'أشكال فن',
    conceptMain: 'مشترك / مختلف',
    conceptHint: 'نظّم المعلومات بصريًا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'أشكال فن تساعد على تنظيم مجموعتين أو أكثر. توضع الصفات المشتركة في منطقة التقاطع، والصفات الخاصة بكل مجموعة في الجزء المنفصل.',
    sectionTwoTitle: 'متى أستخدمها؟',
    sectionTwoBody:
        'استخدمها عندما تحتاج إلى مقارنة مجموعات أو تصنيف عناصر حسب أكثر من صفة، مثل تصنيف أعداد إلى نسبية وصحيحة أو موجبة وسالبة.',
    exampleFormula: 'التقاطع = عناصر مشتركة',
    exampleBody:
        'إذا كانت مجموعة أ تحتوي الأعداد الزوجية ومجموعة ب تحتوي مضاعفات 3، فإن العدد 6 يظهر في منطقة التقاطع لأنه يحقق الصفتين.',
    warning:
        'لا تضع العنصر في التقاطع إلا إذا كان يحقق شروط المجموعتين معًا.',
    practiceQuestion: 'أين نضع عنصرًا ينتمي إلى المجموعتين في شكل فن؟',
    practiceOptions: ['خارج الدائرتين', 'في التقاطع', 'في الدائرة الأولى فقط', 'في الدائرة الثانية فقط'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: العنصر المشترك بين المجموعتين يوضع في منطقة التقاطع.',
  ),
  'real-numbers': LessonContent(
    conceptLabel: 'الأعداد الحقيقية',
    conceptMain: 'نسبية + غير نسبية',
    conceptHint: 'كلها على خط الأعداد',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الأعداد الحقيقية تشمل الأعداد النسبية والأعداد غير النسبية. وكل عدد حقيقي يمكن تمثيله بنقطة على خط الأعداد.',
    sectionTwoTitle: 'كيف أميز غير النسبي؟',
    sectionTwoBody:
        'العدد غير النسبي لا يمكن كتابته على صورة كسر من عددين صحيحين، وتمثيله العشري غير منتهٍ وغير دوري، مثل √2 وπ.',
    exampleFormula: '√2 ∉ الأعداد النسبية',
    exampleBody:
        '√2 عدد غير نسبي لأن تمثيله العشري يستمر دون نمط دوري، لكنه عدد حقيقي ويمكن تمثيله على خط الأعداد.',
    warning:
        'ليس كل جذر تربيعي غير نسبي؛ فمثلًا √49 = 7 وهو عدد نسبي.',
    practiceQuestion: 'أي عدد مما يلي غير نسبي؟',
    practiceOptions: ['0.75', '-4', '√3', '2/5'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: √3 غير نسبي، بينما بقية الخيارات يمكن كتابتها على صورة كسر.',
  ),
  'pythagorean-theorem': LessonContent(
    conceptLabel: 'نظرية فيثاغورس',
    conceptMain: 'a² + b² = c²',
    conceptHint: 'c هو الوتر',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'في أي مثلث قائم الزاوية، مجموع مربعي طولي الضلعين القائمين يساوي مربع طول الوتر.',
    sectionTwoTitle: 'كيف أحدد الوتر؟',
    sectionTwoBody:
        'الوتر هو الضلع المقابل للزاوية القائمة، وهو أطول أضلاع المثلث القائم. نضع طوله مكان c في القانون.',
    exampleFormula: '3² + 4² = 5²',
    exampleBody:
        '9 + 16 = 25، ولذلك المثلث الذي أطوال أضلاعه 3 و4 و5 مثلث قائم.',
    warning:
        'لا تضع أي ضلع مكان c؛ يجب أن يكون c هو الوتر المقابل للزاوية القائمة.',
    practiceQuestion: 'إذا كان ضلعا القائمة 6 و8، فما طول الوتر؟',
    practiceOptions: ['10', '12', '14', '16'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: 6² + 8² = 36 + 64 = 100، و√100 = 10.',
  ),
  'pythagorean-applications': LessonContent(
    conceptLabel: 'التطبيق',
    conceptMain: 'ارسم → حدّد → عوّض',
    conceptHint: 'حوّل الموقف إلى مثلث قائم',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'تُستخدم نظرية فيثاغورس في مسائل المسافة والارتفاع والسلالم والأقطار عندما نستطيع تمثيل الموقف بمثلث قائم.',
    sectionTwoTitle: 'خطوات الحل',
    sectionTwoBody:
        'ارسم مخططًا بسيطًا، حدّد الوتر والضلع المجهول، اكتب القانون، عوّض القيم ثم احسب الجذر عند الحاجة.',
    exampleFormula: '5² + 12² = 13²',
    exampleBody:
        'إذا كان سلم يبعد 5 م عن الحائط ويصل إلى ارتفاع 12 م، فإن طول السلم 13 م.',
    warning:
        'تأكد أن الزاوية قائمة قبل استخدام النظرية؛ فهي لا تنطبق بهذه الصورة على أي مثلث.',
    practiceQuestion: 'مستطيل طوله 8 وعرضه 6، كم طول قطره؟',
    practiceOptions: ['10', '12', '14', '48'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: القطر وتر لمثلث قائم، و8² + 6² = 64 + 36 = 100، فطوله 10.',
  ),
  'irrational-representation': LessonContent(
    conceptLabel: 'تمثيل غير النسبي',
    conceptMain: '√n على خط الأعداد',
    conceptHint: 'استخدم مثلثًا قائمًا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يمكن تمثيل بعض الجذور غير النسبية بدقة هندسيًا باستخدام مثلث قائم ثم نقل طول الوتر إلى خط الأعداد.',
    sectionTwoTitle: 'مثال √2',
    sectionTwoBody:
        'إذا أنشأنا مثلثًا قائمًا ضلعا قائمته 1 و1، فإن طول وتره √2 حسب فيثاغورس، ويمكن استخدام هذا الطول لتحديد √2 على خط الأعداد.',
    exampleFormula: '1² + 1² = (√2)²',
    exampleBody:
        'مجموع المربعين يساوي 2، لذلك طول الوتر √2، وهو طول يمكن نقله هندسيًا إلى خط الأعداد.',
    warning:
        'التقريب العشري يساعد في معرفة الموقع، لكنه لا يساوي القيمة الدقيقة للجذر غير النسبي.',
    practiceQuestion: 'أي مثلث قائم يعطي وترًا طوله √5؟',
    practiceOptions: ['ضلعا القائمة 1 و1', 'ضلعا القائمة 1 و2', 'ضلعا القائمة 2 و2', 'ضلعا القائمة 2 و3'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 1² + 2² = 1 + 4 = 5، لذلك الوتر √5.',
  ),
  'coordinate-distance': LessonContent(
    conceptLabel: 'المسافة',
    conceptMain: 'Δx و Δy',
    conceptHint: 'كوّنا مثلثًا قائمًا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يمكن إيجاد المسافة بين نقطتين في المستوى الإحداثي بتكوين مثلث قائم؛ الفرق الأفقي يمثل ضلعًا، والفرق الرأسي يمثل الضلع الآخر.',
    sectionTwoTitle: 'كيف أحسب؟',
    sectionTwoBody:
        'احسب الفرق بين الإحداثيين السينيين والفرق بين الإحداثيين الصاديين، ثم استخدم فيثاغورس لإيجاد الوتر الذي يمثل المسافة.',
    exampleFormula: '(0,0) إلى (3,4) = 5',
    exampleBody:
        'الفرق الأفقي 3 والفرق الرأسي 4، لذلك المسافة √(3²+4²)=√25=5.',
    warning:
        'استخدم فروق الإحداثيات لا القيم نفسها إذا لم تبدأ إحدى النقطتين من الأصل.',
    practiceQuestion: 'ما المسافة بين (1,2) و(4,6)؟',
    practiceOptions: ['4', '5', '6', '7'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: الفرق الأفقي 3 والرأسي 4، والمسافة √(9+16)=5.',
  ),
};
