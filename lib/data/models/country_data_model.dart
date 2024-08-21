import 'package:translator_app/core/utils/app_images.dart';

class CountryDataModel {
  final String name;
  final String flag;

  CountryDataModel({required this.name, required this.flag});
}

List<CountryDataModel> countries = [
  CountryDataModel(name: 'USA', flag: AppImages.imagesUsa),
  CountryDataModel(name: 'Russin', flag: AppImages.imagesRussia),
  CountryDataModel(name: 'China', flag: AppImages.imagesChina),
  CountryDataModel(name: 'Italy', flag: AppImages.imagesItaly),
  CountryDataModel(name: 'Germany', flag: AppImages.imagesGermany),
  CountryDataModel(name: 'England', flag: AppImages.imagesBritain),
  CountryDataModel(name: 'Spain', flag: AppImages.imagesSpain),
  CountryDataModel(name: 'Saudi', flag: AppImages.imagesArabic),
];
