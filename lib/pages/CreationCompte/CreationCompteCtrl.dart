

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/models/CreationCompte.dart';
import '../../business/services/blogLocalService.dart';
import '../../business/services/blogNetworkService.dart';
import '../../main.dart';
import 'CreationCompteState.dart';




class CreationCompteCtrl extends StateNotifier<CreationCompteState> {
  var blogServiceNetwork = getIt.get<BlogNetworkService>();
  var blogLocalService = getIt.get<BlogLocalService>();

  CreationCompteCtrl() : super(CreationCompteState()) {
    //Init
  }

  bool valider(CreationCompte data) {
    if (data.password != data.password_confirmation) {
      state = state.copyWith(
        errorMsg: "le mot de passe ne correspond pas",
        isLoading: false,
      );
      return false;
    }
    return true;
  }

  Future<bool> soumettreFormulaire(CreationCompte data) async {
    state = state.copyWith(isLoading: true, );
    if (!valider(data)) return false;

    try {
      await blogServiceNetwork.creerCompte(data);
      state = state.copyWith(isLoading: false, isSuccess: true);
      return true;
    } catch (e) {
      state = state.copyWith(errorMsg: e.toString(), isLoading: false);
    }
    return false;
  }
}

final CreerCompteCtrlProvider =
StateNotifierProvider<CreationCompteCtrl, CreationCompteState>((ref) {
  return CreationCompteCtrl();
});
