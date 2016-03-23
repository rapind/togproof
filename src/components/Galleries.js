import React from 'react'
import { Link } from 'react-router'
import Firebase from 'firebase'
import ReactFireMixin from 'reactfire'
import Masonry from 'react-masonry-component'
import Card from 'material-ui/lib/card/card'
import CardActions from 'material-ui/lib/card/card-actions'
import CardMedia from 'material-ui/lib/card/card-media'
import CardTitle from 'material-ui/lib/card/card-title'
import FlatButton from 'material-ui/lib/flat-button'

export default React.createClass({
  mixins: [ReactFireMixin],

  propTypes: {
    children: React.PropTypes.object
  },

  getInitialState () {
    return {
      galleries: []
    }
  },

  componentWillMount () {
    this.bindGalleries()
  },

  bindGalleries () {
    const ref = new Firebase('https://togproof.firebaseio.com/galleries')
    this.bindAsArray(ref, 'galleries')
  },

  render () {
    const { galleries } = this.state

    return (
      <div>
        <h2>Galleries</h2>
        <Masonry
          options={{
            itemSelector: '.GalleriesGridItem',
            percentPosition: true,
            gutter: 15
          }}
        >
          {galleries.map((gallery) => {
            return (
              <Card key={gallery['.key']} className='GalleriesGridItem'>
                <Link to={`/galleries/${gallery['.key']}`}>
                  <CardMedia>
                    <img src={gallery.cover_image_url} />
                  </CardMedia>
                </Link>
                <CardTitle title={gallery.title} subtitle='Card subtitle' />
                <CardActions>
                  <Link to={`/galleries/${gallery['.key']}`}>
                    <FlatButton label='View' />
                  </Link>
                  <Link to={`/galleries/${gallery['.key']}`}>
                    <FlatButton label='Edit' />
                  </Link>
                </CardActions>
              </Card>
            )
          })}
        </Masonry>
        {this.props.children}
      </div>
    )
  }
})
