{Component, createElement} =    require 'react'
{docapture} =                   require 'react-elem'
{div} =                         require('react-elem').DOM
Square =                        require './square'

class Board extends Component

    renderSquare: (i) =>
        {squares, onClick} = @props
        Square value: squares[i], onClick: => onClick i

    render: =>
        div =>
            div class: 'board-row', =>
                @renderSquare 0
                @renderSquare 1
                @renderSquare 2
            div class: 'board-row', =>
                 @renderSquare 3
                 @renderSquare 4
                 @renderSquare 5
            div class: 'board-row', =>
                 @renderSquare 6
                 @renderSquare 7
                 @renderSquare 8


module.exports = ({squares, onClick}) ->
    docapture createElement(Board, {squares, onClick})