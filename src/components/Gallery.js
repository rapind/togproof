import React from 'react'

export default React.createClass({
  propTypes: {
    params: React.PropTypes.object
  },

  render () {
    return (
      <div>
        <h2>Gallery {this.props.params.id}</h2>
      </div>
    )
  }
})
