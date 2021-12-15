import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Searcher extends StatelessWidget {

  TextEditingController controller;
  Function(String) onSubmitted;
  Function(String) onSuggestionSelected;
  List<String> Function(String) onSuggestionCallback;


  Searcher({required this.controller, required this.onSubmitted, required this.onSuggestionSelected, required this.onSuggestionCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            hintText: 'Buscador',
            suffixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(6),
             borderSide: BorderSide(
               color: Colors.white
             )
            )
          ),
            onSubmitted: onSubmitted
        ),
        itemBuilder: (context, String suggestion){
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion){
          onSuggestionSelected(suggestion);
        },
        suggestionsCallback: (String pattern) async{
          return onSuggestionCallback(pattern);
      }
      ),
    );
  }
}
