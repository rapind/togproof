import './styles/index'

import React from 'react'
import ReactDOM from 'react-dom'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import injectTapEventPlugin from 'react-tap-event-plugin'
injectTapEventPlugin()

import App from './App'
import Home from './components/Home'
import About from './components/About'
import Galleries from './components/Galleries'
import Gallery from './components/Gallery'

ReactDOM.render((
  <Router history={browserHistory}>
    <Route path='/' component={App}>
      <IndexRoute component={Home} />
      <Route path='/galleries' component={Galleries} />
      <Route path='/galleries/:id' component={Gallery}/>
      <Route path='/about' component={About}/>
    </Route>
  </Router>
), document.getElementById('app'))
