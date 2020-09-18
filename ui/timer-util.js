function formatTime(secs){
    var hours = Math.floor((time_rem % (60 * 60 * 24)) / (60 * 60))
    var minutes = Math.floor((time_rem % (60 * 60)) / 60))
    var seconds = ("0" + Math.floor(time_rem % 60)).slice(-2)
    formattedTime = [minutes, seconds].join(":")
    return formattedTime
}

function countdown(secs){
    secs -= 1
    return formatTime(secs)
}
