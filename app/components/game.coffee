{connect} =         require 'refnux'
{div, ol, li, a} =  require('react-elem').DOM
Board =             require './board'
timeTravel =        require '../actions/time-travel'
markSquare =        require '../actions/mark-square'

# Helper for checking if either 'X' or 'O' has three marks in a row
calculateWinner = (squares) ->
    lines = [
        [0, 1, 2]
        [3, 4, 5]
        [6, 7, 8]
        [0, 3, 6]
        [1, 4, 7]
        [2, 5, 8]
        [0, 4, 8]
        [2, 4, 6]
    ]

    for line in lines
        [ai, bi, ci] = line
        if squares[ai] and squares[ai] is squares[bi] and squares[ai] is squares[ci]
            return squares[ai]

    null

module.exports = connect (state, dispatch) ->
    {history, stepNumber, xIsNext} = state
    current = history[stepNumber]

    moves = history.map (step, move) ->
        desc = if move then "Move ##{move}" else 'Game start'
        li key: move, ->
            a href: '#', desc, onClick: () -> dispatch timeTravel(move)

    winner = calculateWinner(current.squares)
    status = null
    if winner
        status = "Winner: #{winner}"
    else
        status = "Next player: #{if xIsNext then 'X' else 'O'}"


    div class: 'game', ->
        div class: 'game-board', ->
            Board squares: current.squares, onClick: (i) -> dispatch markSquare(i, calculateWinner)
        div class: 'game-info', ->
            div status
            ol moves
