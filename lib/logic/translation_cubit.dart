import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator_app/data/models/country_data_model.dart';
import 'package:translator_app/logic/translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());

  CountryDataModel? selectedCountryFrom;
  CountryDataModel? selectedCountryTo;

  void updateCountryFrom(CountryDataModel newCountry) {
    selectedCountryFrom = newCountry;
    emit(TranslationChangeLanguagFromState());
  }

  void updateCountryTo(CountryDataModel newCountry) {
    selectedCountryTo = newCountry;
    emit(TranslationChangeLanguagToState());
  }
}
