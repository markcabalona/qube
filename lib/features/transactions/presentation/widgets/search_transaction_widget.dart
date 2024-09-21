import 'package:flutter/material.dart';
import 'package:qube/core/utils/debounce.dart';

class SearchTransactionWidget extends StatefulWidget {
  const SearchTransactionWidget({
    super.key,
  });

  @override
  State<SearchTransactionWidget> createState() =>
      _SearchTransactionWidgetState();
}

class _SearchTransactionWidgetState extends State<SearchTransactionWidget> {
  final debounce = Debounce();
  @override
  void dispose() {
    debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        debounce.run(() {
          // TODO: implement search here
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        hintText: 'Location or Transaction Number',
        contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
