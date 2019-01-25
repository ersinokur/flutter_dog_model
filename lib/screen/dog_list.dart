import 'package:flutter/material.dart';
import 'package:flutter_dog_model/dog_model.dart';
import 'package:flutter_dog_model/screen/dog_card.dart';

class DogList extends StatelessWidget {
  //builder methods rely on a set of data, such as a list.
  final List<Dog> dogs;
  DogList(this.dogs);

// first, make your build method like normal.
// instead of returning widgets, return a method that returns widgets.
// don't forget to pass in the context!

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {

    return ListView.builder(
      //must have an item count  equal to the number of items!
      itemCount: dogs.length,
      // a callback that will return a widget.
      itemBuilder: (context,int){
        // in our case, a doggcard for each dogs.
        return DogCard(dogs[int]);
      },
    );
  }
}
