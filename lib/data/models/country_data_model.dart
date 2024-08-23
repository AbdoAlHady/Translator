import 'package:translator_app/core/utils/app_images.dart';

class CountryDataModel {
  final String name;
  final String flag;
  final String languageCode;

  CountryDataModel(
      {required this.name, required this.flag, required this.languageCode});
}

List<CountryDataModel> countries = [
  CountryDataModel(
    name: 'USA',
    flag: AppImages.imagesUsa,
    languageCode: 'en-US',
  ),
  CountryDataModel(
      name: 'Russin', flag: AppImages.imagesRussia, languageCode: 'cv-RU'),
  CountryDataModel(
      name: 'China', flag: AppImages.imagesChina, languageCode: 'zh-CN'),
  CountryDataModel(
      name: 'Italy', flag: AppImages.imagesItaly, languageCode: 'it-IT'),
  CountryDataModel(
      name: 'Germany', flag: AppImages.imagesGermany, languageCode: 'de-DE'),
  CountryDataModel(
      name: 'England', flag: AppImages.imagesBritain, languageCode: 'en-GB'),
  CountryDataModel(
      name: 'Spain', flag: AppImages.imagesSpain, languageCode: 'es-ES'),
  CountryDataModel(
      name: 'Saudi', flag: AppImages.imagesArabic, languageCode: 'ar-SA'),
];
