import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Comma on num{

  String get withComma{
    NumberFormat numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }

}


extension PaddingSizedBox on num{

    SizedBox get hieght{
    return SizedBox(height : this.toDouble());
    }

    SizedBox get width{
    return SizedBox(width : this.toDouble());
    }

}