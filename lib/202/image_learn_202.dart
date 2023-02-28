import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            context.read<ResourceContext>().model?.data?.length.toString() ??
                ''),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
      ),
      body: //Image.asset(ImagePaths.image_collection.jpgPath()),
          ImagePaths.image_collection.jpgToWidget(),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  image_collection
}

extension ImagePathsExtansion on ImagePaths {
  String jpgPath() {
    return 'assets/jpg/$name.jpg';
  }

  Widget jpgToWidget() {
    return Image.asset(jpgPath());
  }
}
