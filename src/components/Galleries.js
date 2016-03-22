import React from 'react'
import Firebase from 'firebase'
import ReactFireMixin from 'reactfire'
import GridList from 'material-ui/lib/grid-list/grid-list'
import GridTile from 'material-ui/lib/grid-list/grid-tile'
import NavLink from './NavLink'

const styles = {
  gridList: {
  },
  gridTile: {
  }
}

export default React.createClass({
  mixins: [ReactFireMixin],

  propTypes: {
    children: React.PropTypes.object
  },

  getInitialState () {
    return {
      galleries: [],
      cols: this.getCols()
    }
  },

  componentWillMount () {
    this.bindGalleries()
  },

  bindGalleries () {
    const ref = new Firebase('https://togproof.firebaseio.com/galleries')
    this.bindAsArray(ref, 'galleries')
  },

  getCols () {
    return Math.floor(window.innerWidth / 200)
  },

  handleWindowResize (e) {
    this.setState({
      cols: this.getCols()
    })
  },

  componentDidMount () {
    window.addEventListener('resize', this.handleWindowResize)
  },

  render () {
    const { galleries, cols } = this.state

    return (
      <div>
        <h2>Galleries</h2>
        <GridList
          cellHeight={200}
          cols={cols}
          style={styles.gridList}
        >
          {galleries.map((gallery) => {
            return (
              <NavLink
                key={gallery['.key']}
                to={`/galleries/${gallery['.key']}`}
              >
                <GridTile
                  title={gallery.title}
                  subtitle='Subtitle goes here'
                  style={styles.gridTile}
                >
                  <img src={gallery.cover_image_url} />
                </GridTile>
              </NavLink>
            )
          })}
        </GridList>
        {this.props.children}
      </div>
    )
  }
})
