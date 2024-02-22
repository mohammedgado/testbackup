import 'package:flutter/material.dart';
import '../../../../core/widgets/shimmerLoading.dart';

class JobCardShimmer extends StatelessWidget {
  const JobCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoader(height: 20,width: 200,),
          SizedBox(height: 15,),
          ShimmerLoader(height: 20,width: 100,),
          SizedBox(height: 10,),
          Row(

            children: [
              ShimmerLoader(height: 20,width: 50,rounded: true,),
              SizedBox(width: 5,),
              ShimmerLoader(height: 20,width: 50,rounded: true,),
              SizedBox(width: 5,),
              ShimmerLoader(height: 20,width: 50,rounded: true,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoader(height: 15,width: 230,),
              ShimmerLoader(height: 15,width: 100,),

            ],
          ),


        ],
      ),
    );
  }
}
