import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.enabled = true,
    this.focusNode,
    this.text,
    this.isBlue = false,
    this.isLocation = false,
    this.customIcon,
    this.onSubmitted,
  });
  final TextEditingController? controller;
  final String? text;
  final bool isLocation;
  final bool enabled;
  final FocusNode? focusNode;
  final bool isBlue;
  final IconData? customIcon;
  final Function(String)? onSubmitted;
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  bool _hasText = false;
  late TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller == null ? searchController.dispose() : null;
  }

  @override
  Widget build(BuildContext context) {
    widget.text != null ? searchController.text = widget.text! : null;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: widget.isBlue
              ? appDesign.colorAccent
              : Colors.grey.withAlpha(120),
        ),
      ),
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
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          hintText:
              widget.isLocation ? 'Enter location' : 'Looking for a job ?',
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
          prefixIcon: Icon(
            widget.isLocation ? Icons.location_pin : Icons.search,
            color: appDesign.colorAccent,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
