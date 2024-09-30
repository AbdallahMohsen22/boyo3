import 'package:flutter/material.dart';

class AuctionScreen extends StatefulWidget {
  const AuctionScreen({super.key});

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    fadingAnimation=Tween<double>( begin: 0.0,end: 1.0).animate(animationController!);
    animationController?.repeat(
        reverse: true
    );

  }
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  AnimationController? animationController;
  Animation? fadingAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/564x/ce/a6/57/cea6576e21c34d551ab735799ebbb0bc.jpg"
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Image.asset("assets/images/png_icons/auction.png",
                width: 150,
                height: 120,
                  color: Colors.red[900],
              ),

              Center(
                child: AnimatedBuilder(
                  animation:fadingAnimation!,
                    builder:(context,_)=> Opacity(
                  opacity: fadingAnimation!.value,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text("Comming Soon",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            shadows: [
                              Shadow(
                                color: Colors.red,      // Choose the color of the shadow
                                blurRadius: 5.0,          // Adjust the blur radius for the shadow effect
                                offset: Offset(3.0, 3.0), // Set the horizontal and vertical offset for the shadow
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),


                ))),
            ],


          ),
        ),
      ],
    );
  }
}
