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
      title: 'First',
      cover_image_url: 'http://www.weddingcardmessage.com/wp-content/uploads/2014/11/general-wedding-card-messages.jpg'
    }).then(function () {
      return galleriesRef.push({
        title: 'Second',
        cover_image_url: 'https://upload.wikimedia.org/wikipedia/commons/a/ab/Wedding_photo.jpg'
      })
    }).then(function () {
      return galleriesRef.push({
        title: 'Third',
        cover_image_url: 'http://eventsbywhim.ca/blog/wp-content/uploads/2015/07/Bride_and_Groom.jpg'
      })
    }).then(function () {
      console.log('Seeding succeeded')
      process.exit()
    })
  }
})
