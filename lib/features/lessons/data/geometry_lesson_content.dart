import 'grade2_math_lesson_content.dart';

const geometryLessonContent = <String, LessonContent>{
  'angles-lines': LessonContent(
    conceptLabel: 'الزوايا والمستقيمات',
    conceptMain: 'متوازية • متعامدة',
    conceptHint: 'وعلاقات الزوايا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'عند قطع مستقيمين بقاطع تتكون أزواج من الزوايا لها علاقات مختلفة، مثل الزوايا المتناظرة والمتبادلة والداخلية.',
    sectionTwoTitle: 'المتوازي والمتعامد',
    sectionTwoBody:
        'المستقيمان المتوازيان لا يلتقيان، بينما المستقيمان المتعامدان يلتقيان ويكوّنان زاوية قائمة مقدارها 90 درجة.',
    exampleFormula: 'زاويتان متكاملتان: مجموعهما 180°',
    exampleBody:
        'إذا كانت إحدى الزاويتين 65° وكانت الزاويتان متكاملتين، فالزاوية الأخرى 115°.',
    warning:
        'لا تفترض أن مستقيمين متوازيان أو متعامدان من الرسم فقط؛ يجب وجود علامة أو معلومة تؤكد ذلك.',
    practiceQuestion: 'إذا كانت زاويتان متتامتين وإحداهما 35°، فما الأخرى؟',
    practiceOptions: ['45°', '55°', '65°', '145°'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: الزاويتان المتتامتان مجموعهما 90°، و90-35=55.',
  ),
  'logical-reasoning': LessonContent(
    conceptLabel: 'التبرير المنطقي',
    conceptMain: 'معطيات → استنتاج',
    conceptHint: 'اربط الأدلة بالنتيجة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'التبرير المنطقي يعني استخدام معلومات صحيحة وقواعد معروفة للوصول إلى نتيجة يمكن الدفاع عنها.',
    sectionTwoTitle: 'كيف أبني تبريرًا؟',
    sectionTwoBody:
        'ابدأ بالمعطيات، ثم استخدم خاصية أو قاعدة في كل خطوة، وتأكد أن كل استنتاج يعتمد على ما سبقه.',
    exampleFormula: 'إذا كان أ=B وB=C إذن أ=C',
    exampleBody:
        'هذه نتيجة من خاصية التعدي للمساواة: إذا تساوى شيئان مع ثالث فهما متساويان.',
    warning:
        'الاستنتاج الصحيح لا يعتمد على الشكل الظاهري فقط؛ يجب أن يستند إلى معطيات أو خصائص.',
    practiceQuestion: 'إذا كان س=ص، وص=ع، فما الاستنتاج؟',
    practiceOptions: ['س>ع', 'س<ع', 'س=ع', 'لا علاقة'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: بخاصية التعدي، س=ع.',
  ),
  'polygons-angles': LessonContent(
    conceptLabel: 'المضلعات',
    conceptMain: '(n-2) × 180°',
    conceptHint: 'مجموع الزوايا الداخلية',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'مجموع قياسات الزوايا الداخلية لمضلع ذي n أضلاع يساوي (n-2)×180 درجة.',
    sectionTwoTitle: 'المضلع المنتظم',
    sectionTwoBody:
        'في المضلع المنتظم تكون جميع الأضلاع والزوايا متطابقة، ويمكن إيجاد قياس كل زاوية بقسمة المجموع على عدد الزوايا.',
    exampleFormula: 'خماسي: (5-2)×180 = 540°',
    exampleBody:
        'مجموع الزوايا الداخلية للخماسي 540°، وإذا كان منتظمًا فكل زاوية 108°.',
    warning:
        'لا تستخدم n×180؛ يجب طرح 2 أولًا من عدد الأضلاع.',
    practiceQuestion: 'ما مجموع الزوايا الداخلية لسداسي؟',
    practiceOptions: ['540°', '720°', '900°', '1080°'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: (6-2)×180=720°.',
  ),
  'congruent-polygons': LessonContent(
    conceptLabel: 'التطابق',
    conceptMain: 'نفس الشكل والحجم',
    conceptHint: 'أضلاع وزوايا متناظرة متطابقة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يكون مضلعان متطابقين عندما تتساوى الأضلاع المتناظرة وتتطابق الزوايا المتناظرة، فيكون لهما الشكل والحجم نفسيهما.',
    sectionTwoTitle: 'الترتيب مهم',
    sectionTwoBody:
        'عند كتابة عبارة التطابق يجب ترتيب الرؤوس المتناظرة بالترتيب نفسه حتى نعرف أي ضلع وزاوية يقابل الآخر.',
    exampleFormula: '△ABC ≅ △DEF',
    exampleBody:
        'يعني ذلك أن A تقابل D وB تقابل E وC تقابل F، وكذلك الأضلاع المتناظرة.',
    warning:
        'التشابه لا يعني التطابق؛ في التشابه قد يختلف الحجم، أما التطابق فالأطوال المتناظرة متساوية.',
    practiceQuestion: 'ما الذي يميز التطابق عن التشابه؟',
    practiceOptions: ['تساوي الحجم والشكل', 'اختلاف الزوايا', 'عدم وجود أضلاع متناظرة', 'كبر الشكل دائمًا'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: الأشكال المتطابقة لها الشكل والحجم نفسيهما.',
  ),
  'symmetry': LessonContent(
    conceptLabel: 'التماثل',
    conceptMain: 'نصفان متطابقان',
    conceptHint: 'خط أو مركز تماثل',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يكون للشكل تماثل خطي إذا أمكن طيه حول خط فينطبق أحد نصفيه على الآخر.',
    sectionTwoTitle: 'عدد محاور التماثل',
    sectionTwoBody:
        'يختلف عدد محاور التماثل باختلاف الشكل. فالمربع له أربعة محاور تماثل، والمستطيل غير المربع له محوران.',
    exampleFormula: 'المربع: 4 محاور تماثل',
    exampleBody:
        'محوران يمران بمنتصف الأضلاع المتقابلة ومحوران يمران بالقطرين.',
    warning:
        'ليس كل خط يمر بمركز الشكل محور تماثل؛ يجب أن يجعل النصفين متطابقين.',
    practiceQuestion: 'كم محور تماثل للمستطيل غير المربع؟',
    practiceOptions: ['1', '2', '3', '4'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: للمستطيل محور أفقي ومحور رأسي يمران بالمركز.',
  ),
  'reflection': LessonContent(
    conceptLabel: 'الانعكاس',
    conceptMain: 'صورة مرآة',
    conceptHint: 'المسافات عن خط الانعكاس متساوية',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الانعكاس تحويل هندسي ينتج صورة مرآة للشكل حول خط يسمى خط الانعكاس.',
    sectionTwoTitle: 'خاصية مهمة',
    sectionTwoBody:
        'كل نقطة وصورتها تقعان على بعدين متساويين من خط الانعكاس وعلى جانبيه.',
    exampleFormula: '(x,y) حول محور y → (-x,y)',
    exampleBody:
        'عند الانعكاس حول محور y تتغير إشارة الإحداثي السيني فقط.',
    warning:
        'حدد محور الانعكاس قبل تغيير الإحداثيات؛ القاعدة تختلف باختلاف المحور.',
    practiceQuestion: 'صورة النقطة (3,2) حول محور y هي؟',
    practiceOptions: ['(3,-2)', '(-3,2)', '(-3,-2)', '(2,3)'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: حول محور y يتغير x إلى -x وتبقى y كما هي.',
  ),
  'translation': LessonContent(
    conceptLabel: 'الانسحاب',
    conceptMain: 'تحريك دون تدوير',
    conceptHint: 'المسافة والاتجاه نفسيهما',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الانسحاب يحرك كل نقطة في الشكل المسافة نفسها وفي الاتجاه نفسه دون تغيير الشكل أو الحجم أو الاتجاه.',
    sectionTwoTitle: 'على المستوى الإحداثي',
    sectionTwoBody:
        'إذا تحرك الشكل a وحدات أفقيًا وb وحدات رأسيًا، نضيف a إلى x وb إلى y لكل نقطة.',
    exampleFormula: '(x,y) → (x+3,y-2)',
    exampleBody:
        'هذا انسحاب 3 وحدات يمينًا ووحدتين إلى أسفل.',
    warning:
        'لا تغيّر الإحداثيات بمقادير مختلفة لنقاط الشكل؛ جميع النقاط تتحرك بنفس المتجه.',
    practiceQuestion: 'صورة (2,5) بعد انسحاب 4 يمينًا و1 أسفل؟',
    practiceOptions: ['(6,4)', '(6,6)', '(-2,4)', '(3,9)'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: x=2+4=6 وy=5-1=4.',
  ),
  'rotation': LessonContent(
    conceptLabel: 'الدوران',
    conceptMain: 'حول مركز',
    conceptHint: 'بزاوية واتجاه محددين',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'الدوران يحرك الشكل حول نقطة ثابتة تسمى مركز الدوران بمقدار زاوية محددة ومع اتجاه عقارب الساعة أو عكسها.',
    sectionTwoTitle: 'ما الذي يبقى ثابتًا؟',
    sectionTwoBody:
        'الدوران يحافظ على الأطوال والزوايا، لذلك الصورة الناتجة متطابقة مع الشكل الأصلي.',
    exampleFormula: 'دوران 180° حول الأصل: (x,y) → (-x,-y)',
    exampleBody:
        'النقطة (2,-3) تصبح (-2,3) بعد دوران 180° حول نقطة الأصل.',
    warning:
        'اتجاه الدوران مهم في 90° و270°؛ تأكد هل المطلوب مع عقارب الساعة أم عكسها.',
    practiceQuestion: 'صورة (4,1) بعد دوران 180° حول الأصل؟',
    practiceOptions: ['(-4,-1)', '(4,-1)', '(-1,4)', '(1,-4)'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: في دوران 180° تتغير إشارتا الإحداثيين.',
  ),
};
