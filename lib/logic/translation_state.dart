abstract class TranslationState {}

class TranslationInitial extends TranslationState {}

class TranslationChangeLanguagFromState extends TranslationState {}

class TranslationChangeLanguagToState extends TranslationState {}

class TranslationUpdateWordCountState extends TranslationState {}

class SuccessCopyFromClipBoard extends TranslationState {}

class TranslateTextLoadingState extends TranslationState {}

class TranslateTextSuccessState extends TranslationState {}

class TranslateTextErrorState extends TranslationState {
  final String message;

  TranslateTextErrorState(this.message);
}
