import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Havai Fişek Kullanıcıları")),
      body: StreamBuilder<QuerySnapshot>(
        // Veritabanındaki 'users' koleksiyonunu canlı dinliyoruz
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          // Hata var mı kontrolü
          if (snapshot.hasError) {
            return Center(
              child: Text("Bir şeyler ters gitti: ${snapshot.error}"),
            );
          }

          // Veri henüz yükleniyorsa (Loading)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Gelen döküman listesini alıyoruz
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              // Resmindeki 'isim', 'soyad' ve 'mail' alanlarına erişiyoruz
              final data = docs[index].data() as Map<String, dynamic>;

              return ListTile(
                leading: CircleAvatar(
                  child: Text(data['isim'][0]),
                ), // İsmin ilk harfi
                title: Text("${data['isim']} ${data['soyad']}"),
                subtitle: Text(data['mail']),
              );
            },
          );
        },
      ),
    );
  }
}
