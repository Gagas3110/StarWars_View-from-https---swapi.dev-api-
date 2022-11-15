//import 'dart:ui';

import 'package:Star_Wars/model/keyval.dart';
import 'package:Star_Wars/theme/colors.dart';
import 'package:flutter/material.dart';


// ignore: import_of_legacy_library_into_null_safe
import 'package:searchable_dropdown/searchable_dropdown.dart';

class CustomDropDown extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final String varSelected;
  final void Function(String?)? onChange;
  final List<KeyVal> _list;
  final String hint;
  final bool isExpanded;

  const CustomDropDown(
    this.varSelected,
    this._list,
    this.hint,
    this.isExpanded, {
    this.margin,
    this.onChange,
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: TrustPostWhite,
        shape: RoundedRectangleBorder(
          side: isFocus
              ? BorderSide(color: TrustPostBlack, width: 1.8)
              : BorderSide(color: TrustPostUnselect),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            iconEnabledColor: TrustPostBlack,
            focusColor: TrustPostBlack,
            iconDisabledColor: TrustPostUnselect,
            style: TextStyle(color: TrustPostBlack, fontSize: 14),
            hint: Text(widget.hint),
            value: widget.varSelected,
            isExpanded: widget.isExpanded,
            items: widget._list.map((e) {
              return DropdownMenuItem(
                child: Text(e.label!),
                value: e.value,
              );
            }).toList(),
            onChanged: widget.onChange!),
      ),
    );
  }
}

class CustomDropDownBold extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final String? varSelected;
  final String? Function(String?)? onChange, validator;
  final List<KeyVal>? _list;
  final String? hint;
  final bool? isExpanded;
  final bool? readOnly;
  final bool? enabled;
  final bool? isDense;
  final FocusNode? focusNode;

  const CustomDropDownBold(
    this.varSelected,
    this._list,
    this.hint,
    this.isExpanded, {
    this.isDense,
    this.margin,
    this.onChange,
    this.validator,
    this.readOnly,
    this.enabled,
    this.focusNode,
  });

  @override
  _CustomDropDownBoldState createState() => _CustomDropDownBoldState();
}

class _CustomDropDownBoldState extends State<CustomDropDownBold> {
  bool isFocus = false;
  bool readOnly = false;
  bool isDense = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          focusNode: widget.focusNode,
          iconEnabledColor: TrustPostBlack,
          iconDisabledColor: TrustPostUnselect,
          style: TextStyle(color: TrustPostBlack, fontSize: 14),
          validator: widget.validator,
          value: widget.varSelected,
          isExpanded: widget.isExpanded ?? true,
          items: widget._list != null
              ? widget._list!.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.label!),
                    value: e.value,
                  );
                }).toList()
              : [],
          onChanged: widget.onChange,
          decoration: InputDecoration(
            isDense: widget.isDense ?? true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabled: widget.enabled ?? true,
            labelText: widget.hint,
            labelStyle: TextStyle(
                fontSize: 14,
                // ignore: unnecessary_null_comparison
                color: (readOnly == null)
                    ? TrustPostUnselect
                    : (!readOnly ? TrustPostMainText : TrustPostUnselect)),
            filled: true,
            fillColor: TrustPostFillField,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black38)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: TrustPostLightGrey300, width: 0.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: TrustPostBlack, width: 0.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: TrustPostDanger, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: TrustPostDanger, width: 0.5)),
          ),
        ),
      ),
    );
  }
}

class SearchAbleDropDown extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final String varSelected;
  final Function(String)? onChange;
  final List<KeyVal> _list;
  final String hint;
  final bool isExpanded;

  const SearchAbleDropDown(
    this.varSelected,
    this._list,
    this.hint,
    this.isExpanded, {
    this.margin,
    this.onChange,
  });

  @override
  _SearchAbleDropDownState createState() => _SearchAbleDropDownState();
}

class _SearchAbleDropDownState extends State<SearchAbleDropDown> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: DropdownButtonHideUnderline(
        child: SearchableDropdown.single(
            iconEnabledColor: TrustPostBlack,
            iconDisabledColor: TrustPostUnselect,
            style: TextStyle(color: TrustPostBlack, fontSize: 14),
            hint: Text(widget.hint),
            value: widget.varSelected,
            isExpanded: widget.isExpanded,
            dialogBox: false,
            menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
            items: widget._list.map((e) {
              return DropdownMenuItem(
                child: Text(e.label!),
                value: e.value,
              );
            }).toList(),
            onChanged: widget.onChange!),
      ),
    );
  }
}

class SearchDropProduct extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final String varSelected;
  final Function(String)? onChange;
  final List<KeyVal> _list;
  final String hint;
  final bool isExpanded;

  const SearchDropProduct(
    this.varSelected,
    this._list,
    this.hint,
    this.isExpanded, {
    this.margin,
    this.onChange,
  });

  @override
  _SearchDropProductState createState() => _SearchDropProductState();
}

class _SearchDropProductState extends State<SearchDropProduct> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: ShapeDecoration(
        color: TrustPostWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TrustPostWhite),
          borderRadius: BorderRadius.all(Radius.circular(48)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: SearchableDropdown.single(
            isCaseSensitiveSearch: false,
            iconEnabledColor: TrustPostBlack,
            iconDisabledColor: TrustPostUnselect,
            style: TextStyle(color: TrustPostBlack, fontSize: 14),
            hint: Text(widget.hint),
            value: widget.varSelected,
            isExpanded: widget.isExpanded,
            dialogBox: false,
            menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
            items: widget._list.map((e) {
              return DropdownMenuItem(
                child: Text(e.label!),
                value: e.value,
              );
            }).toList(),
            onChanged: widget.onChange!),
      ),
    );
  }
}
