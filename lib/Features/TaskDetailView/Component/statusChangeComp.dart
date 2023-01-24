// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final statusValueProvider = StateProvider<String>((ref) {
  return "";
});

class StatusChangeWidget extends ConsumerStatefulWidget {
  StatusChangeWidget({
    super.key,
    required this.selectedStatus,
  });
  String selectedStatus;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StatusChangeWidgetState();
}

class _StatusChangeWidgetState extends ConsumerState<StatusChangeWidget> {
  List<String> tags = [
    "Todo",
    "In Progress",
    "Complete",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButton(
        isExpanded: true,
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        dropdownColor: Theme.of(context).backgroundColor,
        value: widget.selectedStatus,
        onChanged: ((value) {
          widget.selectedStatus = value!;
          setState(() {
            ref.watch(statusValueProvider.notifier).state = value;
          });
        }),
        onTap: () => setState(() {}),
        items: tags.map((String tag) {
          return DropdownMenuItem(
            value: tag,
            child: Row(
              children: <Widget>[
                Text(
                  tag,
                  style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
