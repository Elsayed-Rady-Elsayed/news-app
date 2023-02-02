// Container(
// height: 300,
// // width: MediaQuery.of(context).size.width,
// color: Colors.transparent,
// child: FutureBuilder(
// future: Api.getarticals(),
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// return ListView.builder(
// itemCount:  snapshot.data.length,
// itemBuilder: (BuildContext context, int index) {
// return
// CarouselSlider(
// items: [
// Container(
// child: Stack(
// children: [
// Card(
// child:Column(
// children: [
// Image(image: NetworkImage("${snapshot.data[index].urlToImage}"),fit: BoxFit.fill,height: 292,)
//
// ],
// ) ,
// ),
// Padding(
// padding: const EdgeInsets.only(top: 250),
// child: Column(
//
// children: [
// Center(
// child: Text("${snapshot.data[index].title}",textAlign: TextAlign.center,style: TextStyle(color: background,fontSize: 8,fontWeight: FontWeight.bold),))
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// options: CarouselOptions(
// height: 300,
// aspectRatio: 2,
// viewportFraction: 0.9,
// initialPage: 0,
// enableInfiniteScroll: true,
// reverse: false,
// autoPlay: true,
// autoPlayInterval: Duration(seconds: 10),
// scrollDirection: Axis.horizontal,
// )
// );
// },);
//
// },),
// ),