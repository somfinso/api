class Book {
  final int id;
  final String title;
  final String author;
  final String urlImage;

  const Book({
    required this.id,
    required this.author,
    required this.title,
    required this.urlImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) =>
      Book(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'author': author,
        'urlImage': urlImage,
      };

}

class Pay {
  final String id, name, amountpaid, cid, paytype, status;

  Pay(
      {required this.id, required this.name, required this.amountpaid, required this.cid, required this.paytype, required this.status});

  factory Pay.fromJson(Map<String, dynamic> json)=>
      Pay(id: json['id'],
          name: json['name'],
          amountpaid: json['amountpaid'],
          cid: json['cid'],
          paytype: json['paytype'],
          status: json['status']
      );
  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'amountpaid':amountpaid,
    'cid':cid,
    'paytype':paytype,
    'status':status

  };
}