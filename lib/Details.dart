import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
 final String count;
 final String des;
 final String amnt;
 final String Rating;
 final String image;

 DetailsPage(this.count,this.des,this.Rating,this.amnt,this.image);


  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  void initState() {

    super.initState();
   // print(widget.prodId);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Description"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(children:[
              Container(height: 200,width: 500,child: Image.network(widget.image),
        ),
            Positioned(child: Column(
              children: [
                Icon(Icons.production_quantity_limits),
                Text("Stock ${widget.count} pcs")
              ],
            ),)]
      ),
            Divider(),
            Text("Description :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            Text(widget.des,textAlign: TextAlign.justify,),
            Divider(),
            Row(
              children: [
                Icon(Icons.star),

                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Text(" ${widget.Rating}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Price: \$${widget.amnt}",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
               
              ],
            ),

          ],
        ),
      ),

    );
  }
}
