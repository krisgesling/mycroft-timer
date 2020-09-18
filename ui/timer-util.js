function formatTime(secs){
    var hours = Math.floor((secs % (60 * 60 * 24)) / (60 * 60))
    var minutes = Math.floor((secs % (60 * 60)) / 60)
    var seconds = ("0" + Math.floor(secs % 60)).slice(-2)
    var timeArray = []
    if (hours != 0){
        // Hours will be displayed, ensure minutes is two digits
        minutes = ("0" + minutes).slice(-2)
        timeArray.push(hours)
    }
    timeArray.push(minutes, seconds)
    return timeArray.join(":")
}

function countdown(secs){
    secs -= 1
    timeRemaining = secs
    return formatTime(secs)
}
