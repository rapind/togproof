import React from 'react'
import MainNav from 'components/MainNav'

export default React.createClass({
  propTypes: {
    children: React.PropTypes.object
  },

  render: function () {
    return (
      <div>
        <MainNav />
        {this.props.children}
      </div>
    )
  }
})
