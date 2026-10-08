import 'grade2_math_lesson_content.dart';

const linearFunctionsLessonContent = <String, LessonContent>{
  'sequences': LessonContent(
    conceptLabel: 'المتتابعات',
    conceptMain: 'حدود مرتبة',
    conceptHint: 'ابحث عن القاعدة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'المتتابعة قائمة مرتبة من الأعداد تسمى حدودًا، ويحدد نمط أو قاعدة كيفية الانتقال من حد إلى الحد الذي يليه.',
    sectionTwoTitle: 'كيف أجد الحد التالي؟',
    sectionTwoBody:
        'قارن بين الحدود المتتالية وابحث عن فرق ثابت أو نسبة ثابتة أو قاعدة أخرى تتكرر.',
    exampleFormula: '3، 7، 11، 15، ...',
    exampleBody:
        'الفرق بين كل حد والذي يليه يساوي 4، لذلك الحد التالي 19.',
    warning:
        'لا تفترض أن النمط جمع ثابت دائمًا؛ قد يكون ضربًا أو قاعدة أخرى.',
    practiceQuestion: 'ما الحد التالي في 5، 9، 13، 17؟',
    practiceOptions: ['19', '20', '21', '22'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: الفرق ثابت ويساوي 4، لذلك 17+4=21.',
  ),
  'functions': LessonContent(
    conceptLabel: 'الدالة',
    conceptMain: 'مدخل → مخرج واحد',
    conceptHint: 'لكل مدخل قيمة واحدة فقط',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الدالة علاقة تربط كل قيمة مدخلة بقيمة مخرجة واحدة فقط. ويمكن تمثيلها بجدول أو أزواج مرتبة أو مخطط أو معادلة.',
    sectionTwoTitle: 'كيف أميز الدالة؟',
    sectionTwoBody:
        'إذا ارتبط المدخل نفسه بأكثر من مخرج مختلف، فالعلاقة ليست دالة.',
    exampleFormula: 'x → 2x + 1',
    exampleBody:
        'لكل قيمة x نحصل على قيمة واحدة فقط من 2x+1، لذلك هذه القاعدة تمثل دالة.',
    warning:
        'يمكن لمخرج واحد أن يرتبط بأكثر من مدخل، لكن المدخل الواحد لا يجوز أن يرتبط بأكثر من مخرج.',
    practiceQuestion: 'أي وصف يعرّف الدالة؟',
    practiceOptions: [
      'كل مدخل له مخرج واحد',
      'كل مدخل له مخرجان',
      'كل المخرجات مختلفة دائمًا',
      'لا تحتوي متغيرات'
    ],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: الشرط الأساسي للدالة هو أن يكون لكل مدخل مخرج واحد فقط.',
  ),
  'graph-linear-functions': LessonContent(
    conceptLabel: 'دالة خطية',
    conceptMain: 'y = mx + b',
    conceptHint: 'تمثيلها خط مستقيم',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الدالة الخطية يمكن تمثيلها بخط مستقيم، ويمكن تكوين نقاطها من جدول قيم ثم رسمها في المستوى الإحداثي.',
    sectionTwoTitle: 'كيف أمثلها؟',
    sectionTwoBody:
        'اختر قيمًا مناسبة لـx، احسب y، كوّن أزواجًا مرتبة، ثم مثل النقاط ووصلها بخط مستقيم إذا كانت العلاقة خطية.',
    exampleFormula: 'y = 2x + 1',
    exampleBody:
        'عند x=0 يكون y=1، وعند x=1 يكون y=3، فتظهر نقاط تقع على خط مستقيم.',
    warning:
        'لا تصل النقاط بخط مستقيم إلا إذا كانت العلاقة خطية.',
    practiceQuestion: 'في y=3x+2، ما قيمة y عندما x=2؟',
    practiceOptions: ['5', '6', '8', '10'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: y=3×2+2=8.',
  ),
  'slope': LessonContent(
    conceptLabel: 'الميل',
    conceptMain: 'Δy / Δx',
    conceptHint: 'التغير الرأسي ÷ الأفقي',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'ميل المستقيم يصف معدل تغيره واتجاهه، ويساوي التغير الرأسي مقسومًا على التغير الأفقي بين نقطتين.',
    sectionTwoTitle: 'إشارة الميل',
    sectionTwoBody:
        'الميل الموجب يعني أن المستقيم يرتفع من اليسار إلى اليمين، والسالب يعني أنه ينخفض، والمستقيم الأفقي ميله صفر.',
    exampleFormula: 'm = (7-3)/(4-2) = 2',
    exampleBody:
        'التغير الرأسي 4 والأفقي 2، لذا الميل يساوي 2.',
    warning:
        'استخدم ترتيب النقطتين نفسه في البسط والمقام حتى لا تغير إشارة الميل.',
    practiceQuestion: 'ما ميل مستقيم يرتفع 6 وحدات لكل 3 وحدات أفقية؟',
    practiceOptions: ['1/2', '2', '3', '6'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: الميل = 6/3 = 2.',
  ),
  'direct-variation': LessonContent(
    conceptLabel: 'التغير الطردي',
    conceptMain: 'y = kx',
    conceptHint: 'يمر بنقطة الأصل',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'في التغير الطردي تكون y متناسبة مباشرة مع x وفق y=kx، حيث k ثابت التغير.',
    sectionTwoTitle: 'كيف أجد k؟',
    sectionTwoBody:
        'إذا كانت x لا تساوي صفرًا، فإن k=y/x. ويكون تمثيل العلاقة خطًا مستقيمًا يمر بنقطة الأصل.',
    exampleFormula: 'y=4x → k=4',
    exampleBody:
        'لكل زيادة وحدة واحدة في x تزيد y أربع وحدات، وثابت التغير يساوي 4.',
    warning:
        'العلاقة y=mx+b ليست تغيرًا طرديًا إذا كان b لا يساوي صفرًا.',
    practiceQuestion: 'إذا كان y=5x، فما ثابت التغير؟',
    practiceOptions: ['1', '5', 'x', 'y'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: معامل x في y=kx هو ثابت التغير k=5.',
  ),
  'model-strategy': LessonContent(
    conceptLabel: 'إنشاء نموذج',
    conceptMain: 'موقف → تمثيل رياضي',
    conceptHint: 'جدول أو رسم أو معادلة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'إنشاء نموذج يعني تمثيل موقف واقعي بطريقة رياضية تساعد على فهم العلاقة والتنبؤ بقيم جديدة.',
    sectionTwoTitle: 'اختيار النموذج',
    sectionTwoBody:
        'يمكن استخدام جدول أو رسم بياني أو معادلة، ونختار التمثيل الذي يوضح العلاقة بأبسط صورة.',
    exampleFormula: 'التكلفة = 10 + 3 × عدد الساعات',
    exampleBody:
        'هذه المعادلة نموذج لموقف فيه رسم ثابت 10 ثم 3 لكل ساعة.',
    warning:
        'النموذج يجب أن يتوافق مع المعطيات؛ لا تضف ثابتًا أو معدلًا غير موجود في الموقف.',
    practiceQuestion: 'أجرة ثابتة 20 ريالًا و5 ريالات لكل ساعة. أي نموذج صحيح؟',
    practiceOptions: ['y=5x', 'y=20x', 'y=5x+20', 'y=20x+5x'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 20 رسم ثابت و5 لكل ساعة، لذلك y=5x+20.',
  ),
};
