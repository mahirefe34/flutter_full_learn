import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor,
      ),
      body: Center(
          child: TextButton(
        child: const Text('Show'),
        onPressed: () {
          showCustomSheet(context, const ListViewLearn());
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.red,
            //barrierColor: Colors.transparent, Açılır penceresinin arkası blurlu alanın rengi
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isScrollControlled: true, //Tam ekran açılır
            builder: (context) {
              return _minSizeBottomSheet(backgroundColor: _backgroundColor);
            },
          );
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class _minSizeBottomSheet extends StatefulWidget {
  const _minSizeBottomSheet({
    required Color backgroundColor,
  });

  @override
  State<_minSizeBottomSheet> createState() => _minSizeBottomSheetState();
}

class _minSizeBottomSheetState extends State<_minSizeBottomSheet> {
  // ignore: prefer_final_fields
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24,
                child: Stack(
                  children: [
                    Divider(
                      color: Theme.of(context).colorScheme.onBackground,
                      thickness: 4,
                      indent: MediaQuery.of(context).size.width * 0.45,
                      endIndent: MediaQuery.of(context).size.width * 0.45,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topCenter,
                        onPressed: () {
                          Navigator.of(context).pop<bool>(false);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
              const Text('data'),
              Image.network(
                'https://picsum.photos/200',
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.amber;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _fullScreenBottomSheet extends StatelessWidget {
  const _fullScreenBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.9, //isScrollControlled: true, ile birlikte kullanılır.
      child: Column(
        children: [
          const Text('data'),
          Image.network(
            'https://picsum.photos/200',
            height: 200,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

//!______________________________________________________________________________

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.red,
      //barrierColor: Colors.transparent, Açılır penceresinin arkası blurlu alanın rengi
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      //isScrollControlled: true, //Tam ekran açılır
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _BaseSheetHeader(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();
  final _gripHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.black26,
            thickness: 4,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.topCenter,
              onPressed: () {
                Navigator.of(context).pop<bool>(false);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
