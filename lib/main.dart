import 'package:app/business/services/blogLocalService.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:app/framework/blogLocalNetworkServiceImpl.dart';
import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'framework/blogNetworkServiceImpl.dart';


var getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<BlogNetworkService>((){
    return BlogNetworkServiceImpl();
  });
  getIt.registerLazySingleton<BlogLocalService>((){
    return BlogLocalServiceImpl();
  });


}
void main(){setup();
runApp(ProviderScope(child: Appication()));
}
class Appication extends StatelessWidget {
  const Appication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Login(),
     home: ListarticlePage(),
    );
  }
}
