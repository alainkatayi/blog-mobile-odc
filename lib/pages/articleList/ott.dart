import 'package:flutter/cupertino.dart';

import '../home.dart';
import 'listArticle.dart';

class Tout extends StatelessWidget {
  const Tout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Homes(),
           Expanded(child:  ListarticlePage())
          ],
        )

    );
  }
}
