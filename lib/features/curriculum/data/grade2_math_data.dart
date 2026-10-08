import '../models/curriculum_models.dart';

const grade2MathChapters = <Chapter>[
  Chapter(
    id: 'rational-numbers',
    title: 'الأعداد النسبية',
    subtitle: 'ابدأ بالمفهوم الأساسي، ثم انتقل للتدريب والاختبار.',
    lessons: [
      Lesson(id: 'rational-numbers-intro', title: 'الأعداد النسبية', subtitle: 'فهم معنى العدد النسبي وتمثيله.'),
      Lesson(id: 'compare-rational', title: 'مقارنة الأعداد النسبية وترتيبها', subtitle: 'المقارنة والترتيب باستخدام خط الأعداد.'),
      Lesson(id: 'multiply-rational', title: 'ضرب الأعداد النسبية', subtitle: 'تحديد الإشارة وإجراء عملية الضرب.'),
      Lesson(id: 'divide-rational', title: 'قسمة الأعداد النسبية', subtitle: 'القسمة مع فهم الإشارات والمقلوب.'),
      Lesson(id: 'add-subtract-rational', title: 'جمع الأعداد النسبية وطرحها', subtitle: 'تدريب تدريجي على الجمع والطرح.'),
      Lesson(id: 'powers', title: 'القوى والأسس', subtitle: 'فهم الأساس والأس والتعبير بالقوى.'),
      Lesson(id: 'scientific-notation', title: 'الصيغة العلمية', subtitle: 'كتابة الأعداد الكبيرة والصغيرة بصورة مختصرة.'),
    ],
  ),
  Chapter(
    id: 'real-numbers-pythagorean',
    title: 'الأعداد الحقيقية ونظرية فيثاغورس',
    subtitle: 'من الجذور التربيعية إلى المسافة في المستوى الإحداثي.',
    lessons: [
      Lesson(id: 'square-roots', title: 'الجذور التربيعية', subtitle: 'فهم الجذر التربيعي وربطه بالمربعات الكاملة.'),
      Lesson(id: 'estimate-square-roots', title: 'تقدير الجذور التربيعية', subtitle: 'تقدير الجذور غير الكاملة وموقعها على خط الأعداد.'),
      Lesson(id: 'venn-strategy', title: 'استراتيجية حل المسألة: استعمال أشكال فن', subtitle: 'تنظيم العلاقات والمعلومات باستخدام أشكال فن.'),
      Lesson(id: 'real-numbers', title: 'الأعداد الحقيقية', subtitle: 'التمييز بين الأعداد النسبية وغير النسبية.'),
      Lesson(id: 'pythagorean-theorem', title: 'نظرية فيثاغورس', subtitle: 'العلاقة بين أضلاع المثلث القائم.'),
      Lesson(id: 'pythagorean-applications', title: 'تطبيقات على نظرية فيثاغورس', subtitle: 'استخدام النظرية لإيجاد أطوال ومسافات مجهولة.'),
      Lesson(id: 'irrational-representation', title: 'توسع: تمثيل الأعداد غير النسبية', subtitle: 'تمثيل جذور غير كاملة بدقة على خط الأعداد.'),
      Lesson(id: 'coordinate-distance', title: 'الأبعاد في المستوى الإحداثي', subtitle: 'إيجاد المسافة بين نقطتين باستخدام فيثاغورس.'),
    ],
  ),
  Chapter(
    id: 'proportions-similarity',
    title: 'التناسب والتشابه',
    subtitle: 'من العلاقات المتناسبة إلى القياس غير المباشر.',
    lessons: [
      Lesson(id: 'proportional-relationships', title: 'العلاقات المتناسبة وغير المتناسبة', subtitle: 'تمييز التناسب باستخدام النسب والجداول والتمثيل.'),
      Lesson(id: 'rate-of-change', title: 'معدل التغير', subtitle: 'قياس تغير كمية بالنسبة إلى كمية أخرى.'),
      Lesson(id: 'constant-rate', title: 'المعدل الثابت للتغير', subtitle: 'فهم المعدل الثابت وربطه بالخط المستقيم.'),
      Lesson(id: 'solve-proportions', title: 'حل التناسب', subtitle: 'إيجاد القيمة المجهولة بالضرب التبادلي.'),
      Lesson(id: 'drawing-strategy', title: 'استراتيجية حل المسألة: الرسم', subtitle: 'تحويل المسألة إلى نموذج بصري واضح.'),
      Lesson(id: 'similar-polygons', title: 'تشابه المضلعات', subtitle: 'الزوايا المتناظرة ونسب الأضلاع.'),
      Lesson(id: 'scale-up-down', title: 'التكبير والتصغير', subtitle: 'استخدام عامل المقياس مع الأشكال المتشابهة.'),
      Lesson(id: 'indirect-measurement', title: 'القياس غير المباشر', subtitle: 'إيجاد أطوال يصعب قياسها مباشرة باستخدام التشابه.'),
    ],
  ),
];
