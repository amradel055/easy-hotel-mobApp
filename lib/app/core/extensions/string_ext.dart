extension Slash on String {

  String get removeLastSlash{
    String value = this;
    if(this[length-1] == '/'){
      value = replaceRange(length-1, length, '');
      value = value.removeLastSlash;
    }
    return value;
  }
}

extension TimeFromDate on String {
  String get timeStringFromDateString{
    String value = this;
    String time = '' ;
    if(length != 0){
      List<String> list = value.split("T");
      if(list.isNotEmpty) {
        List<String> timeList = list[1].split('.');
        if(timeList.isNotEmpty){
        time = timeList[0];
       List times = time.split(":");
       if(times.isNotEmpty && times.length > 1){
         time = times[0] + ":" + times[1] ;
       }

        }
      }
    }
    return time;
  }
}

