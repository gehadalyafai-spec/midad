import 'grade2_math_lesson_content.dart';

const proportionsLessonContent = <String, LessonContent>{
  'proportional-relationships': LessonContent(
    conceptLabel: 'العلاقة المتناسبة',
    conceptMain: 'y / x = ثابت',
    conceptHint: 'نسبة ثابتة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'تكون العلاقة متناسبة عندما تكون النسبة بين الكميتين ثابتة لكل القيم المقابلة. ويمكن تمثيلها بالعلاقة y = kx حيث k ثابت التناسب.',
    sectionTwoTitle: 'كيف أميزها؟',
    sectionTwoBody:
        'احسب y/x لكل زوج من القيم. إذا حصلت على القيمة نفسها كل مرة فالعلاقة متناسبة، وإذا تغيرت النسبة فهي غير متناسبة.',
    exampleFormula: '2/1 = 4/2 = 6/3 = 2',
    exampleBody:
        'النسبة ثابتة وتساوي 2، لذلك العلاقة بين x وy في هذه الأزواج علاقة متناسبة.',
    warning:
        'مرور الرسم بنقطة الأصل مهم في العلاقة المتناسبة الخطية؛ إذا لم يمر بها فالعلاقة ليست تناسبًا مباشرًا.',
    practiceQuestion: 'أي جدول يمثل علاقة متناسبة بثابت تناسب 3؟',
    practiceOptions: ['1→3 ، 2→6', '1→3 ، 2→7', '2→3 ، 4→8', '1→4 ، 2→6'],
    practiceCorrectIndex: 0,
    practiceFeedback:
        'صحيح: 3/1=3 و6/2=3، لذلك ثابت التناسب يساوي 3.',
  ),
  'rate-of-change': LessonContent(
    conceptLabel: 'معدل التغير',
    conceptMain: 'Δy / Δx',
    conceptHint: 'التغير الرأسي ÷ الأفقي',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'معدل التغير يقيس مقدار تغير كمية مقارنةً بتغير كمية أخرى. نحسبه بقسمة الفرق في قيم y على الفرق في قيم x.',
    sectionTwoTitle: 'كيف أفسره؟',
    sectionTwoBody:
        'إذا كان معدل التغير موجبًا فالقيمة تزداد، وإذا كان سالبًا فهي تنقص. ويجب الانتباه إلى وحدات القياس في التفسير.',
    exampleFormula: '(20 - 10) / (4 - 2) = 5',
    exampleBody:
        'زادت y بمقدار 10 عندما زادت x بمقدار 2، لذلك معدل التغير يساوي 5 وحدات لكل وحدة.',
    warning:
        'احسب الفروق بالترتيب نفسه في البسط والمقام حتى لا تنعكس الإشارة خطأ.',
    practiceQuestion: 'إذا تغيرت y من 6 إلى 18 عندما تغيرت x من 2 إلى 5، فما معدل التغير؟',
    practiceOptions: ['3', '4', '6', '12'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: (18-6)/(5-2)=12/3=4.',
  ),
  'constant-rate': LessonContent(
    conceptLabel: 'المعدل الثابت',
    conceptMain: 'نفس الميل دائمًا',
    conceptHint: 'تغير منتظم',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يكون معدل التغير ثابتًا عندما نحصل على القيمة نفسها بين أي نقطتين على العلاقة الخطية.',
    sectionTwoTitle: 'كيف أتعرف عليه؟',
    sectionTwoBody:
        'في الجدول تكون فروق y متناسبة مع فروق x، وفي الرسم تظهر النقاط على خط مستقيم ذي ميل ثابت.',
    exampleFormula: 'كل +2 في x يقابله +6 في y',
    exampleBody:
        'معدل التغير = 6/2 = 3 في كل مرة، لذلك المعدل ثابت.',
    warning:
        'ثبات الزيادة في y وحدها لا يكفي إذا كانت الزيادة في x غير ثابتة؛ احسب النسبة بين التغيرين.',
    practiceQuestion: 'إذا زادت x بمقدار 4 وزادت y بمقدار 12 كل مرة، فما المعدل الثابت؟',
    practiceOptions: ['2', '3', '4', '8'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 12/4=3.',
  ),
  'solve-proportions': LessonContent(
    conceptLabel: 'التناسب',
    conceptMain: 'a/b = c/d',
    conceptHint: 'الضرب التبادلي',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'التناسب معادلة تبين تساوي نسبتين. ويمكن حل التناسب بالضرب التبادلي ثم حل المعادلة الناتجة.',
    sectionTwoTitle: 'طريقة الضرب التبادلي',
    sectionTwoBody:
        'في a/b = c/d نضرب a×d وb×c ثم نساوي الناتجين. بعد ذلك نحل لإيجاد القيمة المجهولة.',
    exampleFormula: '3/4 = x/20 → 60 = 4x → x = 15',
    exampleBody:
        'ضربنا 3×20 و4×x، ثم قسمنا 60 على 4 فحصلنا على 15.',
    warning:
        'تأكد أن الكميات المتناظرة في النسبتين مرتبة بالطريقة نفسها قبل الضرب التبادلي.',
    practiceQuestion: 'حل التناسب 2/5 = x/20.',
    practiceOptions: ['4', '8', '10', '12'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 2×20=5x، أي 40=5x، ومنه x=8.',
  ),
  'drawing-strategy': LessonContent(
    conceptLabel: 'استراتيجية الرسم',
    conceptMain: 'حوّل الكلام إلى صورة',
    conceptHint: 'ارسم ما تعرفه أولًا',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يساعد الرسم على تحويل المسألة اللفظية إلى نموذج بصري يوضح العلاقات بين الأطوال أو النسب أو المواقع.',
    sectionTwoTitle: 'خطوات مفيدة',
    sectionTwoBody:
        'حدد المعطيات، ارسم شكلًا مبسطًا، ضع القيم المعروفة على الرسم، ثم حدد المجهول وابحث عن العلاقة الرياضية المناسبة.',
    exampleFormula: 'المخطط ليس شرطًا أن يكون بمقياس رسم',
    exampleBody:
        'المهم أن يوضح العلاقات الصحيحة بين المعطيات حتى لو لم تكن الأطوال المرسومة مطابقة للقيم الحقيقية.',
    warning:
        'لا تستنتج قيمة من شكل الرسم وحده إذا لم تُعطَ في المسألة؛ الرسم أداة تنظيم وليس دليل قياس.',
    practiceQuestion: 'ما أول خطوة مناسبة عند استخدام استراتيجية الرسم؟',
    practiceOptions: ['تخمين الجواب', 'تحديد المعطيات', 'حذف الأرقام', 'ضرب كل القيم'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: نبدأ بتحديد المعطيات ثم نمثلها بصريًا.',
  ),
  'similar-polygons': LessonContent(
    conceptLabel: 'التشابه',
    conceptMain: 'زوايا متطابقة',
    conceptHint: 'وأضلاع متناظرة متناسبة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يكون مضلعان متشابهين عندما تكون الزوايا المتناظرة متطابقة وأطوال الأضلاع المتناظرة متناسبة.',
    sectionTwoTitle: 'عامل التشابه',
    sectionTwoBody:
        'عامل التشابه هو النسبة بين طولي ضلعين متناظرين، ويجب أن تكون هذه النسبة نفسها لبقية الأضلاع المتناظرة.',
    exampleFormula: '3/6 = 4/8 = 1/2',
    exampleBody:
        'إذا تطابقت الزوايا وكانت نسب الأضلاع المتناظرة 1/2، فالمضلعان متشابهان بعامل تشابه 1/2.',
    warning:
        'التشابه لا يعني تساوي الأطوال؛ التساوي الكامل في الشكل والحجم يسمى تطابقًا.',
    practiceQuestion: 'مثلث أضلاعه 3،4،5 وآخر 6،8،10. ما العلاقة؟',
    practiceOptions: ['متطابقان', 'متشابهان بعامل 2', 'غير متشابهين', 'لا يمكن المقارنة'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: كل ضلع في الثاني يساوي ضعفي الضلع المناظر في الأول.',
  ),
  'scale-up-down': LessonContent(
    conceptLabel: 'التحويل بالحجم',
    conceptMain: 'عامل مقياس',
    conceptHint: '>1 تكبير ، <1 تصغير',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'التكبير والتصغير يحافظان على شكل الصورة ونسبها، بينما تتغير الأطوال وفق عامل المقياس.',
    sectionTwoTitle: 'كيف أستخدم عامل المقياس؟',
    sectionTwoBody:
        'اضرب كل طول في عامل المقياس. إذا كان العامل أكبر من 1 يحدث تكبير، وإذا كان بين 0 و1 يحدث تصغير.',
    exampleFormula: 'طول 5 × عامل 1.5 = 7.5',
    exampleBody:
        'كل الأبعاد تضرب بالعامل نفسه حتى يبقى الشكل مشابهًا للأصل.',
    warning:
        'استخدام عوامل مختلفة للأبعاد المختلفة يشوه الشكل ولا يمثل تكبيرًا أو تصغيرًا متشابهًا.',
    practiceQuestion: 'مستطيل طوله 8 صُغّر بعامل 1/2. ما الطول الجديد؟',
    practiceOptions: ['2', '4', '8', '16'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 8×1/2=4.',
  ),
  'indirect-measurement': LessonContent(
    conceptLabel: 'القياس غير المباشر',
    conceptMain: 'استخدم التشابه',
    conceptHint: 'عندما يصعب القياس مباشرة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يمكن إيجاد طول أو ارتفاع يصعب قياسه مباشرة باستخدام مثلثات متشابهة ونسب الأضلاع المتناظرة.',
    sectionTwoTitle: 'الفكرة العملية',
    sectionTwoBody:
        'نقيس طولًا معلومًا وظله أو نموذجًا مشابهًا، ثم نكوّن تناسبًا بين الأطوال المتناظرة لإيجاد القيمة المجهولة.',
    exampleFormula: '1.5/2 = h/8 → h = 6',
    exampleBody:
        'إذا كان جسم طوله 1.5 م وظله 2 م، وكان ظل شجرة 8 م في الظروف نفسها، فإن ارتفاع الشجرة 6 م.',
    warning:
        'يجب أن تكون المثلثات متشابهة وأن تقارن أضلاعًا متناظرة حتى يكون التناسب صحيحًا.',
    practiceQuestion: 'عمود 2 م ظله 3 م، وشجرة ظلها 12 م. ما ارتفاع الشجرة؟',
    practiceOptions: ['6', '8', '10', '18'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 2/3 = h/12، ومنه 3h=24، إذن h=8 م.',
  ),
};
