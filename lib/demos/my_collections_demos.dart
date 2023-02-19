import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(children: [
          Image.asset(_model.imagePath, fit: BoxFit.fill),
          Padding(
            padding: PaddingUtility().paddingTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_model.title),
                Text('${_model.price} ETH'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstrant Art 1',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstrant Art 2',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstrant Art 3',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstrant Art 4',
          price: 3.4),
    ];
  }
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class ProjectImages {
  static const imageCollection = 'assets/jpg/image_collection.jpg';
}

/* class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required List<CollectionModel> items,
  }) : _items = items;

  final List<CollectionModel> _items;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 40),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Image.asset(_items[index].imagePath, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_items[index].title),
                Text('${_items[index].price} ETH'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
} */

