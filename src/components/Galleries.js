import React from 'react'
import NavLink from './NavLink'

export default React.createClass({
  propTypes: {
    children: React.PropTypes.object
  },

  render () {
    return (
      <div>
        <h2>Galleries</h2>
        <ul>
          <li><NavLink to='/galleries/1'>One</NavLink></li>
          <li><NavLink to='/galleries/2'>Two</NavLink></li>
        </ul>
        {this.props.children}
      </div>
    )
  }
})
