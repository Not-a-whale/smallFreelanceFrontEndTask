function transliterate(char) {
    return '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.indexOf(char) % 10;
}

function getCheckDigit(vin) {
    var map = '0123456789X';
    var weights = '8765432X098765432';
    var sum = 0;
    for (var i = 0; i < 17; ++i)
        sum += transliterate(vin[i]) * map.indexOf(weights[i]);
    return map[sum % 11];
}

function validateVIN(vin) {
    if (vin.length !== 17) {
        return false;
    }
    return getCheckDigit(vin) === vin[8];
}

app.factory('validateVIN', validateVIN);