import React from 'react'
import NavLink from 'components/NavLink'

export default React.createClass({

  render: function () {
    return (
      <div className='main-nav__container'>
        <ul role='nav' className='main-nav__list'>
          <li className='main-nav__item'>
            <NavLink to='/' onlyActiveOnIndex>
              Home
            </NavLink>
          </li>
          <li className='main-nav__item'>
            <NavLink to='/about'>
              About
            </NavLink>
          </li>
          <li className='main-nav__item'>
            <NavLink to='/galleries'>
              Galleries
            </NavLink>
          </li>
        </ul>
      </div>
    )
  }
})
