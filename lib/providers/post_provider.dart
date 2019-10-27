import 'package:flutter/material.dart';
import 'package:sampleprovider/models/post_model.dart';

class PostProvider extends ChangeNotifier{

  List<PostModel> posts = [
    PostModel(title: "Coringa estreou!", description:"Coringa obteve muitos fãs e estourou a bilheteria superando The Avengers EndGame"),
    PostModel(title: "River esmaga Flamengo no jogo de volta", 
    description:"River Plate consquita mais uma Copa Libertadores"),
    PostModel(title: "Bloc x Provider", description:"A disputa está acirrada e a comunidade Flutterando está doida"),
    PostModel(title: "Asriel não sabe Provider", description:"Reza a lenda que Asriel não manja de Provider, por favor mantenha o segredo"),
    PostModel(title: "Frifri é a nova sensação", description:"Unifei relata que seu docente Frinhani é adorado pelos alunos"),
  ];

  addPost({String title, String description}){
    posts.add(PostModel(title: title, description: description));
    _notify();
  }

  removePost({String title}){
    posts.removeWhere((post) => post.title == title);
    _notify();
  }

  changeStatus(PostModel post){
    post.like = !post.like;
    _notify();
  }

  _notify(){
     notifyListeners();
  }

}