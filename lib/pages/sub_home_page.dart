import 'package:example_api/utils/preference.dart';
import 'package:example_api/widgets/card_type.dart';
import 'package:example_api/widgets/searcher.dart';
import 'package:flutter/material.dart';
import 'package:example_api/models/product_response_model.dart';
import 'package:example_api/providers/product_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHomePage extends StatefulWidget {
  @override
  State<SubHomePage> createState() => _SubHomePageState();
}

class _SubHomePageState extends State<SubHomePage> {
  ProductService productProvider = ProductService();

  var stringSearch = '';
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/woodmans-market-logo.png'),
          SizedBox(height: 30),
          Searcher(
            controller: textController,
            onSubmitted: (String input) {
              stringSearch = input;
              List<String> finalSetStorage = Preference().searchStorage;
              finalSetStorage.add(input);
              Preference().searchStorage = finalSetStorage;
              setState(() {});
            },
            onSuggestionSelected: (String suggestion) {
              stringSearch = suggestion;
              textController.text = suggestion;
              setState(() {});
            },
            onSuggestionCallback: (String suggestion) {
              return Preference()
                  .searchStorage
                  .where((element) => element
                      .toLowerCase()
                      .startsWith(suggestion.toLowerCase()))
                  .toList();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Todos los productos',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<ProductResponseModel>(
            future: productProvider.getProducts(input: stringSearch),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.data?.isNotEmpty == true) {
                  return GridView.builder(
                    itemBuilder: (context, index) {
                      return CardType(product: snapshot.data?.data?[index]);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 320),
                    itemCount: snapshot.data?.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                  );
                } else {
                  return Center(
                    child: Image.asset(
                      'assets/no-results.png',
                      height: 200,
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Image.asset(
                    'assets/error.png',
                    height: 200,
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
