import 'package:app/pages/articleList/listArticle.dart';
import 'package:app/pages/comment/commentCard.dart';
import 'package:app/pages/comment/commentCtrl.dart';
import 'package:app/pages/login/loginControl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentPage extends ConsumerStatefulWidget {
  int articleId;

  CommentPage({required this.articleId});

  @override
  ConsumerState<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(commentProvider.notifier);
      var stateLogin = ref.watch(loginControlPorvider);
      ctrl.chargerCommentaires(widget.articleId, stateLogin.user?.token ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(commentProvider);
    var stateLogin = ref.watch(loginControlPorvider);
    var loginState = ref.watch(loginControlPorvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Commentaire(s)",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          color: Colors.white,
          iconSize: 20,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ListarticlePage()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.commentaires?.length ?? 0,
              itemBuilder: (context, i) {
                var commentaire = state.commentaires?[i];
                print("hello");
                if (commentaire == null) return Container();
                return CommentCard(commentaire: commentaire,);
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ajouter un commentaire",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
