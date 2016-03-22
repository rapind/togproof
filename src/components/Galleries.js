import React from 'react'
import Firebase from 'firebase'
import ReactFireMixin from 'reactfire'
import NavLink from './NavLink'

export default React.createClass({
  mixins: [ReactFireMixin],

  propTypes: {
    children: React.PropTypes.object
  },

  getInitialState: function () {
    return {
      galleries: []
    }
  },

  componentWillMount: function () {
    const ref = new Firebase('https://togproof.firebaseio.com/galleries')
    this.bindAsArray(ref, 'galleries')
  },

  render () {
    // console.log(this.state.galleries)
    return (
      <div>
        <h2>Galleries</h2>
        <ul>
          {this.state.galleries.map((gallery) => {
            return (
              <li key={gallery['.key']}>
                <NavLink to={`/galleries/${gallery['.key']}`}>{gallery.title}</NavLink>
              </li>
            )
          })}
        </ul>
        {this.props.children}
      </div>
    )
  }
})
