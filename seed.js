var Firebase = require('./node_modules/firebase/lib/firebase-node')

var ref = new Firebase('https://togproof.firebaseio.com')
ref.set({
  galleries: []
}, function (error) {
  if (error) {
    console.error('Seeding failed')
    process.exit()
  } else {
    var galleriesRef = ref.child('galleries')
    galleriesRef.push({
      title: 'First'
    }).then(function () {
      return galleriesRef.push({
        title: 'Second'
      })
    }).then(function () {
      return galleriesRef.push({
        title: 'Third'
      })
    }).then(function () {
      console.log('Seeding succeeded')
      process.exit()
    })
  }
})
