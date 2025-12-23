import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged; // 🔮 API ready

  const SearchBarWidget({super.key, this.hint = "Search...", this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged, // 🔮 will be connected to API/filter later
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14), // 🔧 search bar roundness
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
