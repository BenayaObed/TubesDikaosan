## Installation
- Required Java version 17 : https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.9+9.1/OpenJDK17U-jdk_x64_windows_hotspot_17.0.9_9.msi

- Setup Env JAVA_HOME (sesuaikan path JDK versi 17):
![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/dbe81973-00eb-4c76-877d-aedf1efbddb6)
- Buat database terlebih dahulu dengan nama ecommerce / sesuaikan dengan `Application.properties`:
  ![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/879f2613-95f4-4971-b1e6-299eabf76a83)

  Buat Database dengan nama ecommerce:
  ![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/41a9a728-081a-4cc5-a46b-27b090b19bff)

- Jika ingin import database bisa dilakukan di MySQL, contoh import ecommerce.sql:
  ![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/771a3c05-deaf-46a0-9df1-129186c8b502)

- Jalankan project dengan menggunakan prompt `./mvn spring-boot:run`:
  ![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/0b188e64-d58b-468a-b4cf-9c89c54c8a3a)

- Proses installasi depedency jika menjalankan prompt tersebut jika berhasil bisa akses `localhost:8080`:
  ![image](https://github.com/velmanharefa/TubesDikaosan/assets/78690451/368233c1-2f38-436e-a590-e6c47f2c576d)




## INIT DATA JIKA TIDAK MELAKUKAN IMPORT DATABSE:
List users dan Roles di migrate secara default ketika project dijalankan(`./mvn spring-boot:run`) dan ketika table tidak ada data:

#### Default Users:
| Email  | Password | ROLE|
| ------------- | ------------- |-------------|
| `test@admin.com`  | admin  | ADMIN |

#### Default Roles:
| ID ROLE  | NAME ROLE |
| ------------- | ------------- |
| 1 | CUSTOMER |
| 2 | ADMIN |
