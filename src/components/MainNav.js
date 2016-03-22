import React from 'react'
import NavLink from 'components/NavLink'
import LeftNav from 'material-ui/lib/left-nav'
import MenuItem from 'material-ui/lib/menus/menu-item'
import AppBar from 'material-ui/lib/app-bar'

export default React.createClass({

  getInitialState () {
    return {
      open: false
    }
  },

  handleToggle () {
    this.setState({
      open: !this.state.open
    })
  },

  handleClose () {
    this.setState({
      open: false
    })
  },

  render () {
    const menuItems = [
      {
        title: 'Home',
        path: '/',
        default: true
      },
      {
        title: 'About',
        path: '/about'
      },
      {
        title: 'Galleries',
        path: '/galleries'
      }
    ]
    return (
      <div className='AppBarContainer'>
        <LeftNav
          className='LeftNav'
          docked={false}
          open={this.state.open}
          onRequestChange={open => this.setState({open})}
        >
          {menuItems.map((item) => {
            return (
              <MenuItem key={item.path} className='MenuItem' onTouchTap={this.handleClose}>
                <NavLink to={item.path} onlyActiveOnIndex={item.default}>
                {item.title}
                </NavLink>
              </MenuItem>
            )
          })}
        </LeftNav>
        <AppBar
          title='togProof'
          onLeftIconButtonTouchTap={this.handleToggle}
        />
      </div>
    )
  }
})
