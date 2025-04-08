import 'package:app/business/services/blogNetworkService.dart';
import 'package:app/main.dart';
import 'package:app/pages/comment/commentState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Commentctrl extends StateNotifier<CommentState> {
  var blogNetwork = getIt.get<BlogNetworkService>();
  Commentctrl()
    : super(CommentState()) {
      
  }

  Future<void> chargerCommentaires(int articleId, String token) async {
    state = state.copyWith(isLoading: true, articleId: articleId);

    final commentaires = await blogNetwork.recupererCommentaires(
      articleId, token
    );
    state = state.copyWith(commentaires: commentaires, isLoading: false);
    void changerTexte(String value) {
      state = state.copyWith(texteNouveauCommentaire: value);
    }
  }
}

final commentProvider = StateNotifierProvider<Commentctrl, CommentState>((ref) {
  return Commentctrl();
});
