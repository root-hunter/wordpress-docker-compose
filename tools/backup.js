const fs = require("fs")
const admin = require("firebase-admin")
const serviceAccount = require("./firebaseConf.json")

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: "bucket.appspot.com"
});

const bckBucket = admin.storage().bucket('backup')

const command = process.argv[2];
const filePath = process.argv[3];

const fileData = fs.readFileSync(filePath);

let file = null

if(command === "database"){
  file = bckBucket.file(`database/web/${filePath.split("/").at(-1)}`)
}else if(command === "wordpress"){
  file = bckBucket.file(`wordpress/web/${filePath.split("/").at(-1)}`)
}

if(file !== null){
  file.save(fileData, {
    gzip: true,
  }).catch(e => {
        console.log(e)
  })  
}
