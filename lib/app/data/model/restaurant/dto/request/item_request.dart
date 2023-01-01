

class ItemRequest {
  final int id ;
  final int index ;

  ItemRequest({required this.id, required this.index});

  Map<String , dynamic> toJson()=> {
    "id" : id ,
    "index" : index
  };
}