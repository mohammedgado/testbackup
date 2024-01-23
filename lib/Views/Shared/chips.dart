import 'package:flutter/material.dart';
import '../../Helper/Constants.dart';

class TextChip extends StatefulWidget {
  const TextChip({super.key, required this.text, this.isType2 = false});
  final String text;
  final bool isType2;
  @override
  State<TextChip> createState() => _TextChipState();
}

class _TextChipState extends State<TextChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: widget.isType2 ? () {} : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color:
                  widget.isType2 ? Colors.transparent : appDesign.colorPrimary,
              borderRadius: widget.isType2
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(15),
              border: Border.all(color: appDesign.colorPrimary, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  widget.text,
                  style: widget.isType2
                      ? TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        )
                      : TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                ),
                widget.isType2
                    ? Transform.translate(
                        offset: Offset(2, -2),
                        child: Transform.rotate(
                            angle: -1.5,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 13,
                            )),
                      )
                    : SizedBox(),
              ],
            )),
      ),
    );
  }
}
