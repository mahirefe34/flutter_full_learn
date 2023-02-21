import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service_advance.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, required this.postId});
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  bool _isLoading = false;

  late final IPostService _postService;
  List<CommentModel>? _commentItems;

  @override
  void initState() {
    super.initState();
    _postService = PostServiceAdvance();
    fetchItemsWithPostId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithPostId(int postId) async {
    _changeLoading();
    _commentItems =
        await _postService.fetchRelationedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(_commentItems?[index].id.toString() ?? ''),
              title: Text(_commentItems?[index].email ?? ''),
              //subtitle: Text(_commentItems?[index].body ?? ''),
              //trailing: Text(_commentItems?[index].name ?? ''),
            ),
          );
        },
      ),
    );
  }
}
