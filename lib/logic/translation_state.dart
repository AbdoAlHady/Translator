abstract class TranslationState {}

class TranslationInitial extends TranslationState {}

class TranslationChangeLanguagFromState extends TranslationState {}

class TranslationChangeLanguagToState extends TranslationState {}

class TranslationUpdateWordCountState extends TranslationState {}

class SuccessCopyFromClipBoard extends TranslationState {}
