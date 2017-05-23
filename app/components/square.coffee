{button} = require('react-elem').DOM

module.exports = ({value, onClick}) ->
    button class: 'square', value, onClick: () -> onClick()