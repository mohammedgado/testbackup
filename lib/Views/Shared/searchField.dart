import 'package:flutter/material.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Views/searchResult.dart';

class SearchInput extends StatefulWidget {
  const SearchInput(
      {super.key,
      this.controller,
      this.enabled = true,
      this.focusNode,
      this.text});
  final TextEditingController? controller;
  final String? text;
  final bool enabled;
  final FocusNode? focusNode;
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  bool _hasText = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =
        widget.controller ?? TextEditingController();
    widget.text != null ? searchController.text = widget.text! : null;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey.withAlpha(120),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          focusNode: widget.focusNode,
          enabled: widget.enabled,
          onChanged: (text) {
            setState(() {
              _hasText = text.isNotEmpty;
            });
          },
          controller: searchController,
          // style: TextStyle(fontSize: 14),
          textInputAction: TextInputAction.search,
          onSubmitted: (search) {
            context.navigateTo(const SearchResultView());
          },
          decoration: InputDecoration(
            hintText: 'Looking for a job ?',
            hintStyle: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            // Add a clear button to the search bar
            suffixIcon: _hasText
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _hasText = false;
                      });
                      searchController.clear();
                    },
                  )
                : null,
            // Add a search icon or button to the search bar
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
