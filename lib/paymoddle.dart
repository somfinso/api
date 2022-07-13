class user {
  String? id;
  String? name;
  String? amountpaid;
  String? cid;
  String? paytype;
  String? status;
  String? jv;

  user(
      {this.id,
        this.name,
        this.amountpaid,
        this.cid,
        this.paytype,
        this.status,
        this.jv});

  user.fromJson(json) {
    id = json['id'];
    name = json['name'];
    amountpaid = json['amountpaid'];
    cid = json['cid'];
    paytype = json['paytype'];
    status = json['status'];
    jv = json['jv'];
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['amountpaid'] = this.amountpaid;
//     data['cid'] = this.cid;
//     data['paytype'] = this.paytype;
//     data['status'] = this.status;
//     data['jv'] = this.jv;
//     return data;
//   }
}