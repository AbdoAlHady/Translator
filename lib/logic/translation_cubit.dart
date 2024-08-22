import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:translator_app/core/helper/env_variables.dart';
import 'package:translator_app/data/models/country_data_model.dart';
import 'package:translator_app/logic/translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());

  CountryDataModel? selectedCountryFrom;
  CountryDataModel? selectedCountryTo;
  TextEditingController translateFromController = TextEditingController();

  int wordLimit = 50;
  int wordCount = 0;
  Timer? debounce;

  String translatedText = '';
  FlutterTts flutterTts = FlutterTts();

  Future<void> handleVolumSpeak({bool isFrom = true}) async {
    final text = isFrom ? translateFromController.text : translatedText;
    await flutterTts.setLanguage(isFrom
        ? selectedCountryFrom!.languageCode
        : selectedCountryTo!.languageCode);
    await flutterTts.speak(text);
  }

  int countWord(String text) {
    if (text.isEmpty) return 0;
    final words = text.trim().split(RegExp(r'\s+'));
    return words.length;
  }

  void updateCount() {
    String text = translateFromController.text;
    wordCount = countWord(text);
    if (wordCount > wordLimit) {
      translateFromController.value = translateFromController.value.copyWith(
        text: truncateTextToWordLimit(text),
        selection: TextSelection.fromPosition(
            TextPosition(offset: translateFromController.text.length)),
      );
      wordCount = wordLimit;
    }
    emit(TranslationUpdateWordCountState());
  }

  void translateFromControllerListener() {
    translateFromController.addListener(() {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 100), () {
        if (translateFromController.text.isNotEmpty) {
          updateCount();
        } else {
          translateFromController.clear();
          wordCount = 0;
          emit(TranslationUpdateWordCountState());
        }
      });
    });
  }

  String truncateTextToWordLimit(String text) {
    final words = text.trim().split(RegExp(r'\s+'));
    if (words.length > wordLimit) {
      return words.take(wordLimit).join(' ');
    }
    return text;
  }

  void updateCountryFrom(CountryDataModel newCountry) {
    selectedCountryFrom = newCountry;
    emit(TranslationChangeLanguagFromState());
  }

  void updateCountryTo(CountryDataModel newCountry) {
    selectedCountryTo = newCountry;
    emit(TranslationChangeLanguagToState());
  }

  Future<void> copyFromClipBoard() async {
    if (translatedText.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: translatedText));
    emit(SuccessCopyFromClipBoard());
  }

  Future<void> translateText() async {
    if (selectedCountryFrom != null &&
        selectedCountryTo != null &&
        translateFromController.text.isNotEmpty) {
      final apiKey = EnvVariables().apiKey;
      if (apiKey.isEmpty) {
        debugPrint('API key is empty');
        return;
      }
      final inputText = translateFromController.text;
      final fromLang = selectedCountryFrom?.languageCode;
      final toLang = selectedCountryTo?.languageCode;
      emit(TranslateTextLoadingState());
      try {
        final model = GenerativeModel(
          apiKey: apiKey,
          model: 'gemini-1.5-flash',
        );
        final content = [
          Content.text('Translate only $inputText from $fromLang to $toLang')
        ];
        final response = await model.generateContent(content);
        translatedText = response.text!;
        emit(TranslateTextSuccessState());
        debugPrint(response.text);
      } catch (e) {
        debugPrint(e.toString());
        emit(TranslateTextErrorState(
            'Faild to translate text, please try agin.!'));
      }
    }
  }
}
