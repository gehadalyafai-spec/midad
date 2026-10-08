import 'grade2_math_lesson_content.dart';

const percentLessonContent = <String, LessonContent>{
  'mental-percent': LessonContent(
    conceptLabel: 'النسبة المئوية',
    conceptMain: 'جزء من 100',
    conceptHint: '25% = 25/100 = 1/4',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'النسبة المئوية تعبر عن جزء من كل مئة. ويمكن إيجاد كثير من النسب ذهنيًا باستخدام كسور معروفة مثل 50%=1/2 و25%=1/4 و10%=1/10.',
    sectionTwoTitle: 'كيف أحسب ذهنيًا؟',
    sectionTwoBody:
        'جزّئ النسبة إلى أجزاء سهلة. مثلًا 15% من عدد = 10% منه + 5% منه، و5% تساوي نصف 10%.',
    exampleFormula: '25% من 80 = 20',
    exampleBody:
        'لأن 25%=1/4، وربع 80 يساوي 20.',
    warning:
        'لا تضرب العدد في 25 مباشرة؛ 25% تعني 0.25 أو 25/100.',
    practiceQuestion: 'ما 10% من 250؟',
    practiceOptions: ['15', '20', '25', '50'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 10% تعني عُشر العدد، وعُشر 250 يساوي 25.',
  ),
  'percent-estimation': LessonContent(
    conceptLabel: 'التقدير',
    conceptMain: 'قرّب ثم احسب',
    conceptHint: 'إجابة سريعة ومعقولة',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'يمكن تقدير النسب المئوية بتقريب النسبة أو العدد إلى قيم سهلة، للحصول على إجابة قريبة بسرعة.',
    sectionTwoTitle: 'متى أستخدمه؟',
    sectionTwoBody:
        'استخدم التقدير عندما يكفي جواب تقريبي أو عندما تريد التحقق بسرعة من أن الناتج الدقيق منطقي.',
    exampleFormula: '19% من 49 ≈ 20% من 50 = 10',
    exampleBody:
        'قرّبنا 19% إلى 20% و49 إلى 50، فحصلنا على تقدير قريب وسهل.',
    warning:
        'التقدير ليس الناتج الدقيق؛ لا تستبدله بالجواب النهائي إذا كانت المسألة تطلب قيمة دقيقة.',
    practiceQuestion: 'قدّر 31% من 198.',
    practiceOptions: ['حوالي 20', 'حوالي 40', 'حوالي 60', 'حوالي 100'],
    practiceCorrectIndex: 2,
    practiceFeedback:
        'صحيح: 31%≈30% و198≈200، و30% من 200 تساوي 60.',
  ),
  'reasonableness-strategy': LessonContent(
    conceptLabel: 'التحقق',
    conceptMain: 'هل الجواب منطقي؟',
    conceptHint: 'قارن بتقدير سريع',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'التحقق من معقولية الإجابة يعني مقارنة الناتج بتقدير أو حقيقة معروفة للتأكد من أنه يقع في نطاق منطقي.',
    sectionTwoTitle: 'كيف أتحقق؟',
    sectionTwoBody:
        'قدّر النسبة ذهنيًا قبل الحساب أو بعده. فإذا كان الناتج بعيدًا جدًا عن التقدير فهناك غالبًا خطأ في العملية أو موضع الفاصلة.',
    exampleFormula: '48% من 100 ≈ 50',
    exampleBody:
        'إذا ظهر الناتج 480 فنعرف فورًا أنه غير معقول، لأن 48% من 100 يجب أن يكون أقل من 100 وقريبًا من 50.',
    warning:
        'المعقولية لا تثبت أن الجواب دقيق 100%، لكنها تكشف كثيرًا من الأخطاء الكبيرة بسرعة.',
    practiceQuestion: 'أي ناتج أكثر معقولية لـ49% من 60؟',
    practiceOptions: ['3', '29', '90', '294'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 49% قريب من النصف، ونصف 60 يساوي 30، لذا 29 معقول.',
  ),
  'percent-equation': LessonContent(
    conceptLabel: 'المعادلة المئوية',
    conceptMain: 'الجزء = النسبة × الكل',
    conceptHint: 'p = r × b',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'المعادلة المئوية تربط الجزء والنسبة والكل: الجزء = النسبة العشرية × الكل.',
    sectionTwoTitle: 'كيف أستخدمها؟',
    sectionTwoBody:
        'حوّل النسبة المئوية إلى عدد عشري ثم عوّض في المعادلة. وإذا كان المجهول هو الكل أو النسبة، حل المعادلة الناتجة.',
    exampleFormula: 'x = 0.30 × 90 = 27',
    exampleBody:
        'لإيجاد 30% من 90 نحول 30% إلى 0.30 ثم نضربها في 90.',
    warning:
        'حوّل النسبة المئوية إلى عدد عشري قبل الضرب، مثل 8%=0.08.',
    practiceQuestion: 'ما 40% من 75؟',
    practiceOptions: ['25', '30', '35', '40'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: 0.40×75=30.',
  ),
  'percent-change': LessonContent(
    conceptLabel: 'التغير المئوي',
    conceptMain: 'التغير ÷ الأصل × 100%',
    conceptHint: 'زيادة أو نقصان',
    sectionOneTitle: 'الفكرة الأساسية',
    sectionOneBody:
        'التغير المئوي يقارن مقدار الزيادة أو النقصان بالقيمة الأصلية. نوجد الفرق ثم نقسمه على القيمة الأصلية ونحوّله إلى نسبة مئوية.',
    sectionTwoTitle: 'زيادة أم نقصان؟',
    sectionTwoBody:
        'إذا كانت القيمة الجديدة أكبر من الأصلية فهو زيادة مئوية، وإذا كانت أصغر فهو نقصان مئوي.',
    exampleFormula: '50 → 60 : التغير 10 ، 10/50 = 20%',
    exampleBody:
        'زاد العدد 10 من أصل 50، أي 10÷50=0.2=20%.',
    warning:
        'المقام هو القيمة الأصلية، وليس الجديدة؛ استخدام الجديدة يعطي نسبة مختلفة.',
    practiceQuestion: 'انخفض سعر من 80 إلى 60. ما نسبة النقصان؟',
    practiceOptions: ['20%', '25%', '30%', '40%'],
    practiceCorrectIndex: 1,
    practiceFeedback:
        'صحيح: النقصان 20، و20/80=0.25=25%.',
  ),
};
