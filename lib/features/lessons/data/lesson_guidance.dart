import 'grade2_math_lesson_content.dart';

class LessonGuidance {
  const LessonGuidance({
    required this.intro,
    required this.whyItMatters,
    required this.steps,
    required this.secondExampleFormula,
    required this.secondExampleBody,
    required this.summaryPoints,
  });

  final String intro;
  final String whyItMatters;
  final List<String> steps;
  final String secondExampleFormula;
  final String secondExampleBody;
  final List<String> summaryPoints;
}

LessonContent applyLessonGuidance(
  LessonContent base,
  LessonGuidance guidance,
) {
  if (base.hasExtendedExplanation) return base;

  return LessonContent(
    conceptLabel: base.conceptLabel,
    conceptMain: base.conceptMain,
    conceptHint: base.conceptHint,
    sectionOneTitle: base.sectionOneTitle,
    sectionOneBody: base.sectionOneBody,
    sectionTwoTitle: base.sectionTwoTitle,
    sectionTwoBody: base.sectionTwoBody,
    exampleFormula: base.exampleFormula,
    exampleBody: base.exampleBody,
    warning: base.warning,
    practiceQuestion: base.practiceQuestion,
    practiceOptions: base.practiceOptions,
    practiceCorrectIndex: base.practiceCorrectIndex,
    practiceFeedback: base.practiceFeedback,
    intro: guidance.intro,
    whyItMatters: guidance.whyItMatters,
    steps: guidance.steps,
    secondExampleFormula: guidance.secondExampleFormula,
    secondExampleBody: guidance.secondExampleBody,
    summaryPoints: guidance.summaryPoints,
  );
}
