module.exports = (step) -> (state) ->
    {
        stepNumber: step
        xIsNext: if step % 2 then false else true        
    }
