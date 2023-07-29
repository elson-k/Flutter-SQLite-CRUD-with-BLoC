import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            autofocus: true,
            minLines: 1,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Enter title here",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8,),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {  },
              child: const Text("Save"),
            ),
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
