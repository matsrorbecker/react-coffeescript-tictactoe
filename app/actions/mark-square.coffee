module.exports = (i, calculateWinner) -> (state) ->
    {history, stepNumber, xIsNext} = state
    history = history.slice(0, stepNumber + 1)
    current = history[history.length - 1]
    squares = current.squares.slice()
    return {} if calculateWinner(squares) or squares[i]

    squares[i] = if state.xIsNext then 'X' else 'O'
    
    {
        history: history.concat([ squares: squares ])
        stepNumber: history.length
        xIsNext: not state.xIsNext
    }
