import React from 'react'
import NavLink from 'components/NavLink'

const App = React.createClass({
  propTypes: {
    children: React.PropTypes.object
  },

  render: function () {
    return (
      <div>
        <h1>Hey Now</h1>
        <ul role='nav'>
          <li><NavLink to='/' onlyActiveOnIndex>Home</NavLink></li>
          <li><NavLink to='/about'>About</NavLink></li>
          <li><NavLink to='/repos'>Repos</NavLink></li>
        </ul>

        {this.props.children}
      </div>
    )
  }
})

export default App
