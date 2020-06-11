import 'package:abstraction_unit/services.dart/api_test.dart';
import 'package:abstraction_unit/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_cook_book/app/locator.dart';
import 'package:recipe_cook_book/core/services/api.dart';

void main () {
  
  group('Api Test | ', () {
    
    setUpAll((){
      setupLocator();
    });

    test('Constructing Service should find correct dependencies', (){
      var api = Api();
      expect (api != null, true); 

    });
    test('Given recipeId 1, should call the localStorageService with 1', ()async{
       var localStorageService = LocalStorageService();
              locator.registerLazySingleton(localStorageService);
       
              var api = Api();
              await api.getAllRecipes();
           });
       
         });
       }
       
      