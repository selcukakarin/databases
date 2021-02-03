## MongoDb kurulum
### Local kurulum
> https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/ adresinden ubuntu makinenize community version'u kurabilirsiniz. 
> Yukarıdaki linkten ayrıca bazı mongodb komutlarına da ulaşabilirsiniz.

### 1
Start MongoDB.
You can start the mongod process by issuing the following command:
```
sudo systemctl start mongod
```
### 2
Verify that MongoDB has started successfully.
sudo systemctl status mongod
### 3
Stop MongoDB.
As needed, you can stop the mongod process by issuing the following command:

sudo systemctl stop mongod

### Local kurulumu tamamlandıktan sonra atlastan alınan komut ile cloud'da oluşturulan mongodb'ye bağlandık.

> Db listesi
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show dbs
admin  0.000GB
local  3.909GB
```
#### yeni bir db oluşturma
```
mongo "mongodb+srv://selcukakarin000000000000/mongoSelcuk"  --username selcuk  = atlas'dan gelen db connection string'in test db'sini mongoSelcuj olarak değiştirdik.
# mongoSelcuk = yeni db adı
```
#### hangi db'de olduğunu görmek için
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db;
mongoSelcuk
```
#### local db'sine geçmek için
```MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> use local;
switched to db local
```
#### db'deki collection'ları gözlemlemek için
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show collections;
clustermanager
oplog.rs
replset.election
replset.minvalid
replset.oplogTruncateAfterPoint
startup_log
```
#### use komutuyla db oluşturma
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> use mongoSelcuk2
switched to db mongoSelcuk2
```
#### db'ye collection oluşturma
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.createCollection("courses");
{
        "ok" : 1,
        "$clusterTime" : {
                "clusterTime" : Timestamp(1587408215, 2),
                "signature" : {
                        "hash" : BinData(0,"EH02JFxjOqBX8Ji7toX5EVa9cWs="),
                        "keyId" : NumberLong("6817487986502926339")
                }
        },
        "operationTime" : Timestamp(1587408215, 1)
}

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show dbs;
admin        0.000GB
local        3.909GB
mongoSelcuk  0.000GB
```
#### collection'ları görmek için
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show collections
courses
```
#### collection silme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.courses.drop();
true

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show collections;
```
#### db silme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db
mongoSelcuk

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.dropDatabase();
{
        "dropped" : "mongoSelcuk",
        "ok" : 1,
        "$clusterTime" : {
                "clusterTime" : Timestamp(1587408349, 7),
                "signature" : {
                        "hash" : BinData(0,"Ta4OTueMpYBca+nuZZmVNJetNhs="),
                        "keyId" : NumberLong("6817487986502926339")
                }
        },
        "operationTime" : Timestamp(1587408349, 7)
}

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show dbs;
admin  0.000GB
local  3.909GB
```
#### collection oluşturma 2
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.insertOne(
    {   "name": "Selçuk Akarın",   "students": 10000,   "rating": 4.5,   "courses": ["Python", "Java", "JavaScript"],   "status": "A" }
    );
{
        "acknowledged" : true,
        "insertedId" : ObjectId("5e9deedd58083ac2aab6fe2e")
}

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> show collections;
instructors
```
#### Verileri gözlemlemek için
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find()
{ "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"), "name" : "Selçuk Akarın", "students" : 10000, "rating" : 4.5, "courses" : [ "Python", "Java", "JavaScript" ], "status" : "A" }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty();
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
```
#### çoklu veri ekleme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.insertMany(
    [
  
        {
            "name": "Mert Toker",
            "students": 10.0,
            "rating": 4.5,
            "courses": ["Python", "Java", "C#"],
            "status": "A"
        },
        {
            "name": "Can Kemer",
            "students": 15.0,
            "rating": 4.2,
            "courses": ["Python", "Java", "JavaScript", "C++"],
            "status": "A"
        },
        {
            "name": "Turgay Altın",
            "students": 20.0,
            "rating": 4.6,
            "courses": ["Python", "JavaScript", "Kotlin"],
            "status": "B"
        }
    ]
);
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("5e9defb358083ac2aab6fe2f"),
                ObjectId("5e9defb358083ac2aab6fe30"),
                ObjectId("5e9defb358083ac2aab6fe31")
        ]
}

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty()  # or db.instructors.find({}).pretty()
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "students" : 15,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### kayıt sayacı
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty().count()
4
```
#### tek kayıt çekmek için
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.findOne()
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
```
#### belli alanları çekmek
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{name:1,rating:1}).pretty();
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "rating" : 4.5
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "rating" : 4.5
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "rating" : 4.2
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "rating" : 4.6
}
```
#### exclude courses
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{courses:0}).pretty();
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "students" : 15,
        "rating" : 4.2,
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "status" : "B"
}
```
#### filter
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({status : "B"}).pretty()
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### courses içerisinde Kotlin bulunanlar
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({courses : "Kotlin"}).pretty();
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### ikili filtreleme - double filter
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({status : "B",courses : "Python"}).pretty();
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### gt and gte
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({rating : {$gt : 4.5}}).pretty();
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({rating : {$gte : 4.5}}).pretty();
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### db'deki bir değeri güncellemek
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.updateOne({name:"Selçuk Akarın"},{$set : {rating:2.2}})
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty()
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 2.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "students" : 15,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### birden çok kaydı güncelleme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.updateMany({},{$set : {students : 3000}})
{ "acknowledged" : true, "matchedCount" : 4, "modifiedCount" : 4 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty()
{
        "_id" : ObjectId("5e9deedd58083ac2aab6fe2e"),
        "name" : "Selçuk Akarın",
        "students" : 3000,
        "rating" : 2.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 3000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "students" : 3000,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 3000,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### status'ü A olanların öğrenci sayılarını güncelleme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.updateMany({status : "A"},{$set : {students : 15000}});
{ "acknowledged" : true, "matchedCount" : 3, "modifiedCount" : 3 }
```
#### bir kaydı silme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.deleteOne({name: "Selçuk Akarın"});
{ "acknowledged" : true, "deletedCount" : 1 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty();
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe2f"),
        "name" : "Mert Toker",
        "students" : 15000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe30"),
        "name" : "Can Kemer",
        "students" : 15000,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 3000,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### Birden çok kaydı silme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.deleteMany({status : "A"});
{ "acknowledged" : true, "deletedCount" : 2 }
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty();
{
        "_id" : ObjectId("5e9defb358083ac2aab6fe31"),
        "name" : "Turgay Altın",
        "students" : 3000,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### tüm kayıtları silme
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.deleteMany({});
{ "acknowledged" : true, "deletedCount" : 1 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().pretty();
```
#### skip - verilen değer kaç ise o kadar değer atlar
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().skip(1).pretty()
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe33"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe34"),
        "name" : "Can Kemer",
        "students" : 15,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe35"),
        "name" : "Turgay Altın",
        "students" : 20,
        "rating" : 4.6,
        "courses" : [
                "Python",
                "JavaScript",
                "Kotlin"
        ],
        "status" : "B"
}
```
#### limit - ilk 2 kayıt
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().limit(2).pretty()
{
        "_id" : ObjectId("5e9df4da58083ac2aab6fe32"),
        "name" : "Selçuk Akarın",
        "students" : 10000,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "JavaScript"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe33"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
```
#### skip and limit
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find().skip(1).limit(2).pretty()
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe33"),
        "name" : "Mert Toker",
        "students" : 10,
        "rating" : 4.5,
        "courses" : [
                "Python",
                "Java",
                "C#"
        ],
        "status" : "A"
}
{
        "_id" : ObjectId("5e9df4e358083ac2aab6fe34"),
        "name" : "Can Kemer",
        "students" : 15,
        "rating" : 4.2,
        "courses" : [
                "Python",
                "Java",
                "JavaScript",
                "C++"
        ],
        "status" : "A"
}
```
#### sort - sıralama işlemleri
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{rating:1}).pretty()
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "rating" : 4.2 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "rating" : 4.6 }
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{rating:1}).sort({rating:1}).pretty()
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "rating" : 4.2 }
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "rating" : 4.6 }
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{rating:1}).sort({rating:-1}).pretty()
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "rating" : 4.6 }
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "rating" : 4.5 }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "rating" : 4.2 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{name:1}).pretty()
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "name" : "Selçuk Akarın" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "name" : "Mert Toker" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "name" : "Can Kemer" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "name" : "Turgay Altın" }
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{name:1}).sort({name:1}).pretty()
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "name" : "Can Kemer" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "name" : "Mert Toker" }
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "name" : "Selçuk Akarın" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "name" : "Turgay Altın" }
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.instructors.find({},{name:1}).sort({name:-1}).pretty()
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe35"), "name" : "Turgay Altın" }
{ "_id" : ObjectId("5e9df4da58083ac2aab6fe32"), "name" : "Selçuk Akarın" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe33"), "name" : "Mert Toker" }
{ "_id" : ObjectId("5e9df4e358083ac2aab6fe34"), "name" : "Can Kemer" }
```
#### yeni verisetimiz
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.products.find().pretty()
{
        "_id" : ObjectId("5e9df67758083ac2aab6fe36"),
        "name" : "Laptop",
        "category" : "Electronic",
        "price" : 5000,
        "quantity" : 10
}
{
        "_id" : ObjectId("5e9df67758083ac2aab6fe37"),
        "name" : "Iphone",
        "category" : "Electronic",
        "price" : 4000,
        "quantity" : 5
}
{
        "_id" : ObjectId("5e9df67758083ac2aab6fe38"),
        "name" : "The Tale Of Two Cities",
        "category" : "Book",
        "price" : 20,
        "quantity" : 100
}
{
        "_id" : ObjectId("5e9df67758083ac2aab6fe39"),
        "name" : "The Lord Of The Rings",
        "category" : "Book",
        "price" : 20,
        "quantity" : 1000
}
{
        "_id" : ObjectId("5e9df67758083ac2aab6fe3a"),
        "name" : "Bed",
        "category" : "House",
        "price" : 2000,
        "quantity" : 20
}
```
#### aggregate group sum
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.products.aggregate([{$group:{_id:"$category",num_products:{$sum:1}}}]);
{ "_id" : "Electronic", "num_products" : 2 }
{ "_id" : "Book", "num_products" : 2 }
{ "_id" : "House", "num_products" : 1 }
```
#### aggregate group avg
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.products.aggregate([{$group:{_id:"$category",average_price:{$avg:"$price"}}}]);
{ "_id" : "Book", "average_price" : 20 }
{ "_id" : "House", "average_price" : 2000 }
{ "_id" : "Electronic", "average_price" : 4500 }
```
#### aggregate group max-min
```
MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.products.aggregate([{$group:{_id:"$category",max_price:{$max:"$price"}}}]);
{ "_id" : "Book", "max_price" : 20 }
{ "_id" : "House", "max_price" : 2000 }
{ "_id" : "Electronic", "max_price" : 5000 }

MongoDB Enterprise SelcukAkarin-shard-0:PRIMARY> db.products.aggregate([{$group:{_id:"$category",min_price:{$min:"$price"}}}]);
{ "_id" : "Electronic", "min_price" : 4000 }
{ "_id" : "Book", "min_price" : 20 }
{ "_id" : "House", "min_price" : 2000 }
```
![mongo-1](https://github.com/selcukakarin/mongoDb/blob/master/pics/m1.png)
![mongo-2](https://github.com/selcukakarin/mongoDb/blob/master/pics/m2.png)
![mongo-3](https://github.com/selcukakarin/mongoDb/blob/master/pics/m3.png)
![mongo-4](https://github.com/selcukakarin/mongoDb/blob/master/pics/m4.png)
![mongo-5](https://github.com/selcukakarin/mongoDb/blob/master/pics/m5.png)
![mongo-6](https://github.com/selcukakarin/mongoDb/blob/master/pics/m6.png)
![mongo-7](https://github.com/selcukakarin/mongoDb/blob/master/pics/m7.png)
![mongo-8](https://github.com/selcukakarin/mongoDb/blob/master/pics/m8.png)
![mongo-9](https://github.com/selcukakarin/mongoDb/blob/master/pics/m9.png)
![mongo-10](https://github.com/selcukakarin/mongoDb/blob/master/pics/m10.png)


