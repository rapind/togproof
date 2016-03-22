var Firebase = require('./node_modules/firebase/lib/firebase-node')

function saveGalleries (ref, galleries) {
  if (galleries.length === 0) process.exit()

  console.log('Saveing:', galleries[0].title)
  ref.push({
    title: galleries[0].title,
    cover_image_url: galleries[0].cover_image_url
  }).then(function () {
    saveGalleries(ref, galleries.slice(1))
  })
}

var baseRef = new Firebase('https://togproof.firebaseio.com')
baseRef.set({
  galleries: []
}, function (error) {
  if (error) {
    console.error('Seeding failed')
    process.exit()
  } else {
    var ref = baseRef.child('galleries')

    galleries = [
      {
        title: 'First',
        cover_image_url: 'http://www.weddingcardmessage.com/wp-content/uploads/2014/11/general-wedding-card-messages.jpg'
      }, {
        title: 'Second',
        cover_image_url: 'https://upload.wikimedia.org/wikipedia/commons/a/ab/Wedding_photo.jpg'
      }, {
        title: 'Third',
        cover_image_url: 'http://www.oncewed.com/wp-content/uploads/2013/02/whimsical-vintage-wedding-at-butterfly-lane-estate-1.jpeg'
      }, {
        title: 'Fourth',
        cover_image_url: 'http://eventsbywhim.ca/blog/wp-content/uploads/2015/07/Bride_and_Groom.jpg'
      }, {
        title: 'Fifth',
        cover_image_url: 'http://noseroom.com/thomasculture/wp-content/uploads/2013/10/wedding-cake.jpg'
      }, {
        title: 'Sixth',
        cover_image_url: 'http://www.taitphoto.com/wedding-photography/wedding-photography.jpg'
      }
    ]
    saveGalleries(ref, galleries)
  }
})

