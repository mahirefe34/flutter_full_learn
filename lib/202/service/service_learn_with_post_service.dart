import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service_advance.dart';

class ServiceLearnWithServiceView extends StatefulWidget {
  const ServiceLearnWithServiceView({super.key});

  @override
  State<ServiceLearnWithServiceView> createState() =>
      _ServiceLearnWithServiceViewState();
}

class _ServiceLearnWithServiceViewState
    extends State<ServiceLearnWithServiceView> {
  List<PostModel>? _items;
  List<CommentModel>? _commentItems;
  bool _isLoading = false;

  //Test edilebilir kod başladı.
  late final IPostService _postService;
  @override
  void initState() {
    super.initState();
    _postService = PostServiceAdvance();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    // _items = await _postService.fetchPostItemsAdvance();
    _commentItems = await _postService.fetchRelationedCommentsWithPostId(1);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink(),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (context, index) {
          //return _PostCard(model: _items?[index]);
          return _CommentCard(model: _commentItems?[index]);
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({Key? key, required PostModel? model})
      : _model = model,
        super(key: key);
  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Text(_model?.id.toString() ?? 'data'),
        title: Text(_model?.title.toString() ?? 'data'),
        subtitle: Text(_model?.body.toString() ?? 'data'),
        trailing: Text(_model?.userId.toString() ?? 'data'),
      ),
    );
  }
}

class _CommentCard extends StatelessWidget {
  const _CommentCard({Key? key, required CommentModel? model})
      : _model = model,
        super(key: key);
  final CommentModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Text(_model?.id.toString() ?? 'data'),
        title: Text(_model?.email.toString() ?? 'data'),
        subtitle: Text(_model?.body.toString() ?? 'data'),
      ),
    );
  }
}
