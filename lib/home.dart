import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleprovider/models/post_model.dart';
import 'package:sampleprovider/providers/post_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  Widget _buildList(){
    PostProvider postProvider = Provider.of<PostProvider>(context);
    return ListView.separated(
      separatorBuilder: (_, index){
        return Divider();
      },
      itemCount: postProvider.posts.length,
      itemBuilder: (context, index){
        return _buildItem(postProvider.posts[index]);
      },

    );
  }

  Widget _buildItem(PostModel post){
    PostProvider postProvider = Provider.of<PostProvider>(context);
    return ListTile(
      onTap: (){
        postProvider.changeStatus(post);
      },
      title: Text("${post.title}"),
      subtitle: Text("${post.description}"),
      trailing: post.like ? Icon(Icons.thumb_up, color: Colors.blue,) : Icon(Icons.thumb_down),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Posts"),
        centerTitle: true,
        actions: <Widget>[
          Consumer<PostProvider>(
            builder: (BuildContext context, PostProvider provider, Widget child) {
              return Row(
                children: <Widget>[
                  Text("${provider.posts.where((post) => post.like).length}"),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.shopping_cart)
                  )
                ],
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.15,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                            controller:_titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Title",
                              alignLabelWithHint: true
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                            controller:_descriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Description",
                              alignLabelWithHint: true
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    postProvider.addPost(title: _titleController.text, description: _descriptionController.text);
                  },
                  child: Text("Adicionar"),
                  
                ),
                RaisedButton(
                  onPressed: (){
                    postProvider.removePost(title: _titleController.text);
                  },
                  child: Text("Remover"),
                  
                )
              ],
            ),
            Divider(),
            Expanded(
              child: Consumer<PostProvider>(
                builder: (context, postProvider, widget){
                  return _buildList();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  
}