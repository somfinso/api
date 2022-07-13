

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