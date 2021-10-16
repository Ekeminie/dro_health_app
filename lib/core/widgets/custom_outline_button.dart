
import 'package:flutter/material.dart';

import '../pallet.dart';

class CustomOutlineButton extends StatelessWidget {
 
  final Widget? title;
  final VoidCallback? onTap;
  CustomOutlineButton(
      {Key? key, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                if(onTap!=null){
                  onTap!();
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                 color:Pallet.white,
                 border: Border.all(
                  color: Pallet.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Center(
                  child:title!
                ),
              ),
            );
  }
}

// ,