part of './part_of_learn.dart';

class _PartofAppBar extends StatelessWidget with PreferredSizeWidget {
  const _PartofAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('MBE'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.abc),
        ),
      ],
    );
  }
}
