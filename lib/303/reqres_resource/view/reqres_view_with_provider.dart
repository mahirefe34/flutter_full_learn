import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/view_model/reqres_provider.dart';
import 'package:flutter_full_learn/product/extensions/string_extention.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

import '../../../product/global/theme_notifier.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';

class ReqresViewWithProvider extends StatefulWidget {
  const ReqresViewWithProvider({super.key});
  @override
  State<ReqresViewWithProvider> createState() => _ReqresViewWithProviderState();
}

class _ReqresViewWithProviderState extends State<ReqresViewWithProvider>
    with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading
                ? const CircularProgressIndicator()
                : null,
            actions: [
              IconButton(
                onPressed: () {
                  context
                      .read<ReqresProvider>()
                      .saveToLocale(context.read<ResourceContext>());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                      return const ImageLearn202();
                    },
                  ));
                },
                icon: const Icon(Icons.ac_unit_outlined),
              )
            ],
          ),
          body: Column(
            children: [
              Selector<ReqresProvider, bool>(
                builder: (context, value, child) {
                  return value ? const Placeholder() : const Text('data');
                },
                selector: (context, provider) {
                  return provider.isLoading;
                },
              ),
              Expanded(
                child: _resourcesListView(
                    context, context.watch<ReqresProvider>().resources),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
        );
      },
    );
  }

  ListView _resourcesListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          //color: Color(resources[index].colorValue), Model içerisinde yapılışı
          color: Color(
              items[index].color.colorValue), //String extension ile yazılışı
          child: Text(items[index].name ?? ''),
        );
      },
    );
  }
}
