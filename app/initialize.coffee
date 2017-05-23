require 'prop-types' # Avoid deprecation warning
{createElement} =           require 'react'
{render} =                  require 'react-dom'
{createStore, Provider} =   require 'refnux'

Game = require './components/game'

document.addEventListener 'DOMContentLoaded', () ->
    store = createStore require './model'
    render createElement(Provider, {store, app: Game}), document.querySelector('#app')