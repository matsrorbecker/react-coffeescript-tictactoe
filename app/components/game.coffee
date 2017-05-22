{Component, createElement} =    require 'react'
{docapture} =                   require 'react-elem'
{div, ol, li, a} =              require('react-elem').DOM
Board =                         require './board'

class Game extends Component

    constructor: ->
        super()

        @state =
            history: [ squares: Array(9).fill(null) ]
            stepNumber: 0
            xIsNext: true


    handleClick: (i) =>
        {history, stepNumber, xIsNext} = @state
        history = history.slice(0, stepNumber + 1)
        current = history[history.length - 1]
        squares = current.squares.slice()
        return if @calculateWinner(squares) or squares[i]

        squares[i] = if @state.xIsNext then 'X' else 'O'
        @setState
            history: history.concat([ squares: squares ])
            stepNumber: history.length
            xIsNext: not @state.xIsNext

    calculateWinner: (squares) ->
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

    jumpTo: (step) =>
        @setState
            stepNumber: step
            xIsNext: if step % 2 then false else true

    render: =>
        {history, stepNumber, xIsNext} = @state
        current = history[stepNumber]
        winner = @calculateWinner(current.squares)

        moves = history.map (step, move) =>
            desc = if move then "Move ##{move}" else 'Game start'
            li key: move, => 
                a href: '#', desc, onClick: () => @jumpTo(move)

        status = null
        if winner
            status = "Winner: #{winner}"
        else
            status = "Next player: #{if xIsNext then 'X' else 'O'}"


        div class: 'game', =>
            div class: 'game-board', =>
                Board squares: current.squares, onClick: (i) => @handleClick i
            div class: 'game-info', ->
                div status
                ol moves


module.exports = ->
    docapture createElement(Game)