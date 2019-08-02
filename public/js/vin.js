function transliterate (c) {
    return '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.indexOf(c) % 10;
}

function get_check_digit (vin) {
    var map = '0123456789X';
    var weights = '8765432X098765432';
    var sum = 0;
    for (var i = 0; i < 17; ++i)
        sum += transliterate(vin[i]) * map.indexOf(weights[i]);
    return map[sum % 11];
}

function validate_vin (vin) {
    if( vin.length !== 17) {
        alert('VIN must have 17 letters and numbers!');
        return false;
    }
    return get_check_digit(vin) === vin[8];
}

function check_vin(node) {
    node.value = node.value.replace(/\s+/g,'');
    if( node.value.match(/usko/i) ) {
        node.value='USKO' + randomString(13);
        node.value=node.value.toUpperCase();
        return true;
    }

    if( validate_vin(node.value) ) return true;
    alert( 'VIN is entered incorrectly!');
    return false;
}
