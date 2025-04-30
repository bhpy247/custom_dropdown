import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final Widget Function(T)? itemBuilder;
  final Widget? hint;
  final Widget? icon;
  final double elevation;
  final TextStyle? style;
  final Color? dropdownColor;
  final InputDecoration? decoration;
  final bool isExpanded;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.onChanged,
    this.itemBuilder,
    this.hint,
    this.icon,
    this.elevation = 8,
    this.style,
    this.dropdownColor,
    this.decoration,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: _selectedItem,
      items: widget.items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: widget.itemBuilder != null
              ? widget.itemBuilder!(item)
              : Text(item.toString()),
        );
      }).toList(),
      onChanged: (T? value) {
        setState(() => _selectedItem = value);
        widget.onChanged?.call(value);
      },
      hint: widget.hint,
      icon: widget.icon ?? const Icon(Icons.arrow_drop_down),
      elevation: widget.elevation.toInt(),
      style: widget.style,
      dropdownColor: widget.dropdownColor,
      decoration: widget.decoration ??
          const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
      isExpanded: widget.isExpanded,
    );
  }
}