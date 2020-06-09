# BaseMVC
Base Project for Web Application (Use Entity Framework)

Sebuah Base project untuk membuat Web Application tanpa harus membuat ulang di Visual Studio
Project ini sudah Termasuk contoh kode untuk membuat CRUD sederhana menggunakan LINQ

Cara pemakaian :

1. Download Source Code dan Ekstrak data
2. Jalankan Script DB di folder DB, untuk membuat database dan Tablenya (Recommend : menggunakan SQL Server 2017)
3. Install Visual Studio (Recommend : VS 2019)
4. Buka Folder BaseMVCNoEntity Lalu jalankan BaseMVCNoEntity.sln
5. Jalankan Project

Troubleshoot : 
Jika Project Gagal di jalankan, harap membuat ulang database di dalam BaseMVC.DataAccess
dengan Entities yang sama yaitu MyProfileEntities

Cara Create database Entity : https://www.c-sharpcorner.com/UploadFile/4923b7/creating-a-edmx-file-using-entity-data-model/

Requirement Project

.Net Framework 4.6.1
SQL Server 12++
Visual Studio 2017++

Kelengkapan Project sudah meliputi :

1.Bootstrap 3.1
2.JQuery 3.4.1
3.JQuery Validate
4.Linq
5.EntityFramework 6.x

Hal yang tidak termasuk dalam project :

WebAPI (API controller bisa gunakan, namun WebApiConfig belum berubah)
Flow Data Project : UI -> Controller/ApiController -> (Penghubungnya menggunakan Model) -> Data Access (DAL) -> DB
