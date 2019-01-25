import 'package:flutter/material.dart';
import 'package:flutter_dog_model/dog_model.dart';
import 'package:flutter_dog_model/screen/dog_detail_page.dart';

class DogCard extends StatefulWidget {
  final Dog dog;
  DogCard(this.dog);

  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  _DogCardState(this.dog);

  @override
  Widget build(BuildContext context) {
    // InkWell is a special Material widget that makes its children tappable
    // and adds Material Design ink ripple when tapped.

    return InkWell(
      // onTap is a callback that will be triggered when tapped.
      onTap: showDogDetailPage,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            height: 115.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 50.0,
                  child: dogCard,
                ),
                Positioned(
                  top: 7.5,
                  child: dogImage,
                ),
              ],
            ),
          )),
    );
  }

  //state classes run this method when the state is created.
  // you should not do async work in initstate, so we'll defer it. to another method.
  void initState() {
    super.initState();
    renderDocPic();
  }

  //Url, we'd want the Dog class itself to get the image
  // but this is a simpler way to explain flutter basics.
  void renderDocPic() async {
    //this makes the services call
    await dog.getImageUrl();

    //setstate tells flutter to render anything that's been changed.
    //setstate cannot be async, so we use a variable that can be overwritten

    setState(() {
      renderUrl = dog.imageUrl;
    });
  }

  Widget get dogCard {
    // a new contianer
    // the height and width are arbitrary for styling.
    return Container(
        width: 290.0,
        height: 115.0,
        child: Card(
          color: Colors.blue,
          //wrap children in a padding widget in order to give padding.
          child: Padding(
            //the class that controls padding is called 'edgeInsets'
            // the edgeinsets.only contructor is used to set.
            // padding explicity to each side of the child.
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
            //column is another layout widget -- like stack -- that
            // takes a list of widgets as children, and lays the
            // widgets out from top to bottom.
            child: Column(
              // these aligment properties function exactly like
              // css flexbox properties.
              // the main axis of a columns is the vertical axis,
              // 'mainaxisaligment.spaceAround' is equivalent of
              // CSS's justify-content: space-around in a vertically
              //laid out flexbox.
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(widget.dog.name,
                    // themes are set in the materialApp widget at the root of your app.
                    // they have default values -- which we'e using because we didn't set our own.
                    // they're great for having consistent, app-wide styling that's easliy changed.
                    style: Theme.of(context).textTheme.headline),
                Text(widget.dog.location,
                    style: Theme.of(context).textTheme.subtitle),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(': ${widget.dog.rating}/10')
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  // This is the builder method that creates a new page.
  showDogDetailPage() {
    // Navigator.of(context) accesses the current app's navigator.
    // Navigators can 'push' new routes onto the stack,
    // as well as pop routes off the stack.
    //
    // This is the easiest way to build a new page on the fly
    // and pass that page some state from the current page.
    Navigator.of(context).push(MaterialPageRoute(
        //builder methods always take context!
        builder: (context) {
      return DogDetailPage(dog);
    }));
  }
}

String renderUrl;
Widget get dogImage {
  return Container(
// you can explicity set heights and widths on containers.
// otherwise they take up as much space as their childeren.

    width: 100.0,
    height: 100.0,
// decaration is a property that lets you tyle the container.
// it expects a boxdecoration.
    decoration: BoxDecoration(
      //BoxDecorations have many possible properties.
      //using boxshape with a background image is the
      // easiest way to make a circle cropped avatar style image.
      shape: BoxShape.circle,
      image: DecorationImage(
        // just like CSS's 'imagesize' property.
        fit: BoxFit.cover,
        //a networkimage widget is awidget that
        // takes a url to an image.
        // imageproviders (such as networkimage) are ideal
        //when your image needs to be loaded or can change.
        //use the null check to avoid an error.
        image: NetworkImage(renderUrl ?? ''),
      ),
    ),
  );
}
