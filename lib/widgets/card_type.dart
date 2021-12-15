import 'package:flutter/material.dart';
import 'package:example_api/models/product_response_model.dart';
import 'package:example_api/pages/detail_product_page.dart';

class CardType extends StatelessWidget {
  Data? product;
  CardType({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailProductPage(
                        producto: product,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product?.imagen ?? '',
                      height: 150,
                    ),
                  ),
                  Positioned(
                    left: -4,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                        child: Text(
                          (product?.valorPromo ?? '') + ' %',
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                product?.nombre ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 3),
              Text(
                '\$ ' + (product?.precio ?? '') + ' COP',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Text(
                '\$ ' +
                    (int.parse(product?.precio ?? '0') -
                            (int.parse(product?.precio ?? '0') *
                                (int.parse(product?.valorPromo ?? '0') / 100)))
                        .toString() +
                    ' COP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey),
                  Icon(Icons.shopping_basket_outlined, color: Colors.grey),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
