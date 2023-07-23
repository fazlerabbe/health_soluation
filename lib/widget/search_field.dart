import 'package:flutter/material.dart';
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.searchController,required this.labelText
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController searchController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        cursorColor: Color(0xff7581a1),
        style: TextStyle(color: Color(0xff7581a1)),
        controller: searchController,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(Icons.search_rounded,color: Color(0xff7581a1),),
            labelStyle: TextStyle(color: Color(0xff7581a1)),
            labelText: labelText,
            fillColor: Colors.white,

            filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.white)
          )
        ),
      ),
    );
  }
}