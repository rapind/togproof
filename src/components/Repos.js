import React from 'react'
import NavLink from './NavLink'

export default React.createClass({
  propTypes: {
    children: React.PropTypes.object
  },

  render () {
    return (
      <div>
        <h2>Repos</h2>
        <ul>
          <li><NavLink to='/repo/rackt/react-router'>React Router</NavLink></li>
          <li><NavLink to='/repo/facebook/react'>React</NavLink></li>
        </ul>
        {this.props.children}
      </div>
    )
  }
})
