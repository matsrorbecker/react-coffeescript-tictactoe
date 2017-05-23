{div} =     require('react-elem').DOM
Square =    require './square'

module.exports = ({squares, onClick}) ->
    
    renderSquare = (i) ->
        Square value: squares[i], onClick: -> onClick i

    div ->
        div class: 'board-row', ->
            renderSquare 0
            renderSquare 1
            renderSquare 2
        div class: 'board-row', ->
            renderSquare 3
            renderSquare 4
            renderSquare 5
        div class: 'board-row', ->
            renderSquare 6
            renderSquare 7
            renderSquare 8
