import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable/expandable.dart';
import 'package:example_api/models/product_response_model.dart';

class DetailProductPage extends StatelessWidget {
  Data? producto;

  DetailProductPage({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(producto?.nombre ?? ''),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75),
                child: Image.network(
                  producto?.imagen ?? '',
                  height: 230,
                ),
              ),
              SizedBox(
                height: 23,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.network(
                  producto?.imagen ?? '',
                  height: 90,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                producto?.nombre ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              Icon(Icons.favorite_border, color: Colors.grey)
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 55),
                          child: Text(producto?.descripcion ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 17,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$' + (producto?.precio ?? '0') + ' COP',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '\$' +
                              (int.parse(producto?.precio ?? '0') -
                                      (int.parse(producto?.precio ?? '0')) *
                                          (int.parse(
                                                  producto?.valorPromo ?? '0') /
                                              100))
                                  .toString() +
                              ' COP',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 23,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Text(
                                '0',
                                style: GoogleFonts.sourceSansPro(fontSize: 23),
                              ),
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.grey,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 85),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Añadir al carrito',
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ExpandablePanel(
                    collapsed: ExpandableButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Descripción',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                          )
                        ],
                      ),
                    ),
                    expanded: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Descripción',
                              style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          producto?.descripcion ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.sourceSansPro(fontSize: 17),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
