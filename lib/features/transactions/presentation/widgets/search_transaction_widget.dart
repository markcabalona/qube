import 'package:flutter/material.dart';
import 'package:qube/core/utils/debounce.dart';

class SearchTransactionWidget extends StatelessWidget {
  const SearchTransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final debounce = Debounce();
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
