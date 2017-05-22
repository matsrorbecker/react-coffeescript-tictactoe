{createElement} =   require 'react'
{render} =          require 'react-dom'

Game = require './components/game'

document.addEventListener 'DOMContentLoaded', () ->
    render createElement(Game), document.querySelector('#app')