import React from 'react'
import Firebase from 'firebase'
import ReactFireMixin from 'reactfire'

export default React.createClass({
  mixins: [ReactFireMixin],

  propTypes: {
    params: React.PropTypes.object
  },

  getInitialState: function () {
    return {
      gallery: {}
    }
  },

  componentWillMount: function () {
    const ref = new Firebase(`https://togproof.firebaseio.com/galleries/${this.props.params.id}`)
    this.bindAsObject(ref, 'gallery')
  },

  render () {
    const { gallery } = this.state
    return (
      <div>
        <h2>Gallery: {gallery.title}</h2>
      </div>
    )
  }
})
