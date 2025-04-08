import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 2),

              )
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.person,size: 40,color: Colors.grey,),
              const SizedBox(width: 10,),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Auteur du commentaire",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("Text du commentaireText taireText du commentaireText du commentaireText du commentaireText du commentaireText du commentaireText du commentaireText du t du commentaireText du commentaire")
                  ],
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ],
    );
  }
}


