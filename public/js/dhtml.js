function GetParent(item, named) {
    var row = item;
    while (row.parentNode && row.nodeName != named) {
        var prnt = row.parentNode;
        row = prnt;
    }
    return (row);
}

function GetChildByName(node, name) {
    if (node.nodeName == '#text') return false;
    if (node.name == name) {
        return node;
    } else {
        let Chldrn = node.childNodes;
        if (Chldrn) {
            for (let i = 0; i < Chldrn.length; i++) {
                let result = GetChildByName(Chldrn[i], name);
                if (result) return result;
            }
        }
    }
    return false;
}

function GetChildByTag(node, name) {
    if (node.nodeName == '#text') return false;
    if (node.nodeName == name) {
        return node;
    } else {
        let Chldrn = node.childNodes;
        if (Chldrn) {
            for (let i = 0; i < Chldrn.length; i++) {
                let result = GetChildByTag(Chldrn[i], name);
                if (result) return result;
            }
        }
    }
    return false;
}

function randomString(length) {
    var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');
    var str = '';
    if (!length) length = Math.floor(Math.random() * chars.length);
    for (var i = 0; i < length; i++) str += chars[Math.floor(Math.random() * chars.length)];
    return str;
}

function CurrentDateAsText() {
    let d = new Date();
    let yr = d.getFullYear();
    let mn = d.getMonth();
    let dy = d.getDate();
    let stamp = null

    if (mn < 10) mn = '0' + mn;
    if (dy < 10) dy = '0' + dy;

    stamp = yr + '-' + mn + '-' + dy;

    return stamp;
}

function CurrentTimeAsText() {
    let d = new Date();
    let hh = d.getHours();
    let mm = d.getMinutes();
    let ss = d.getSeconds();
    let stamp = null

    if (hh < 10) hh = '0' + hh;
    if (mm < 10) mm = '0' + mm;
    if (ss < 10) ss = '0' + ss;

    stamp = hh + ':' + mm + ':' + ss;

    return stamp;
}

function CurrentTimeStampAsText() {
    return CurrentDateAsText() + ' ' + CurrentTimeAsText();
}

function CurrentTimeStampAsJsText() {
    return CurrentDateAsText() + 'T' + CurrentTimeAsText();
}

function ShowPg(node, trg) {
    if (node === undefined) return (false);
    var trgnode = document.getElementById(trg === undefined ? 'mainwindow' : trg);
    var urladdr = node instanceof HTMLElement ? node.getAttribute('uri') : node;

    if (urladdr) {
        console.log('Load page: ' + urladdr);
        $(trgnode).load(urladdr);
    }
}

function RefreshReport(child) {
    var trg = child;
    var reportid = null;
    var url = null;

    while (!(reportid = trg.getAttribute('report'))) {
        var prnt = trg.parentNode;
        trg = prnt;
        if (trg.nodeName == 'BODY') {
            console.log("Unable to find tag with \"report\" attribute\n");
            break;
        }
    }

    if (reportid) {
        if (trg = document.getElementById(reportid)) {
            var url = trg.getAttribute('url');
            var act = trg.getAttribute('form_action') || 'reload';
            var rgx = /\?/;
            var flg = rgx.test(url) ? '&' : '?';
            url += flg + 'form_action=' + encodeURIComponent(act);
            console.log('reload: ' + url + "\n");
            $(trg).load(url);
        } else {
            console.log("Unable to get target. getElementById(" + reportid + ")");
        }
    } else {
        console.log("Unable to get report id, \"" + reportid + "\"");
    }
}

function AddToURL(url, hash) { // hash is: var hash = [{"a": "1"}, {"b": "2"}, {"c": "3"}]
    if (!url) return (null);
    var rgx = /\?/;
    for (var i = 0; i < hash.length; i++) {
        for (var key in hash[i]) {
            if (hash[i].hasOwnProperty(key)) {
                var flg = rgx.test(url) ? '&' : '?';
                url += flg + key + '=' + encodeURIComponent(hash[i][key]);
            }
        }
    }
    return (url);
}

function SearchContent(node) {
    var frm = document.getElementById(node.getAttribute('form'));
    var uri = frm ? frm.getAttribute('url') : node.getAttribute('url');
    var act = frm ? frm.getAttribute('form_action') : node.getAttribute('form_action');
    var trg = document.getElementById(frm ? frm.getAttribute('search_target') : node.getAttribute('search_target'));
    var dat = frm ? '&' + $(frm).serialize() : null;

    var pgtgt = frm ? document.getElementById(frm.getAttribute('page_target')) : null;
    var pgact = frm ? frm.getAttribute('page_action') : null;
    var pgnum = node.getAttribute('page_number') ? node.getAttribute('page_number') : '';

    if (!uri || !trg) return (null);
    uri = AddToURL(uri, [{ "pge_nmb": pgnum }]);

    var url = uri;
    if (act) url = AddToURL(url, [{ "form_action": act }]);
    if (frm) {
        url += dat;
    } else {
        url = AddToURL(url, [{ "search": node.value }]);
    }
    $(trg).load(url);

    if (pgtgt && pgact) {
        var pgurl = uri;
        pgurl = AddToURL(pgurl, [{ "form_action": pgact }]);
        pgurl += dat;
        $(pgtgt).load(pgurl);
    }
}

function SortBy(node) {
    var name = node.getAttribute('name');
    if (name) {
        var row = node.parentNode;
        if (!row.SortNames) row.SortNames = new Array();

        if (node.dataset.sortdir) {
            if (node.dataset.sortdir == 'DESC') {
                if (node.classList.contains('sortasc')) node.classList.remove('sortasc');
                if (node.classList.contains('sortdesc')) node.classList.remove('sortdesc');
                node.classList.add('unsorted');

                node.removeAttribute('data-sortdir');
                row.SortNames = row.SortNames.filter(value => value !== name);
            } else {
                if (node.classList.contains('sortasc')) node.classList.remove('sortasc');
                node.dataset.sortdir = 'DESC';
                node.classList.add('sortdesc');
            }
        } else {
            if (node.classList.contains('unsorted')) node.classList.remove('unsorted');
            node.dataset.sortdir = 'ASC';
            node.classList.add('sortasc');
            row.SortNames.push(name);
        }

        var SORTED = [];
        row.SortNames.forEach(
            function (nodename) {
                var chld = row.querySelector("div[name='" + nodename + "']");
                var elmt = {};
                elmt[nodename] = chld.dataset.sortdir;
                SORTED.push(elmt);;
            }
        )
        document.getElementById('sort_order_by').value = JSON.stringify(SORTED);
        SearchContent(node);
    }
}


function PassValueTo(from, to_id) {
    var dst = document.getElementById(to_id);
    if (dst) dst.value = from.value;
}

function ShowConstraintForm(node) {
    var re = /\w+/;
    if (re.test(node.value)) return; // do not pop-up if not empty

    var req = node.getAttribute('rq'); // request to use
    var rep = node.getAttribute('report'); // report to call
    var cnst = node.getAttribute('constraint'); // constraint reference
    var inp = node.getAttribute('id'); // input field id
    var box = document.createElement("div"); // dialog DIV box
    var bid = 'D' + randomString(7); // dialog ID
    var url = '/templates/dialog/rules.json?rq=blankform&report=' + rep + '&dialog_form=' + bid + '&return_data_to=' + inp + '&constraint=' + cnst;

    box.setAttribute('title', rep);
    box.setAttribute('retrun_for', inp);
    box.setAttribute('id', bid);

    $(box).load(url);

    document.body.appendChild(box);
    $(box).dialog({
        autoOpen: false,
        modal: true,
        position: {
            my: "center center-15%"
        },
        beforeClose: function (event, ui) {
            $(box).dialog("destroy");
            document.body.removeChild(box);
        }
    });
    $(box).dialog("open");
}

function ShowDialogDocument(node) {
    var bid = 'D' + randomString(7); // dialog ID
    var title = node.getAttribute('dialogtitle');
    var box = document.createElement("div"); // dialog DIV box
    var d_width = node.getAttribute('dialogwidth') || 'auto';
    var d_height = node.getAttribute('dialogheight') || 'auto';
    var d_stick = node.getAttribute('dialogpos') || node;
    var url = node.getAttribute('uri');
    var re = /\?/;
    var argtag = re.test(url) ? '&' : '?';
    url = url + argtag + 'dialog_form=' + bid;

    if (node.getAttribute('id') && node.getAttribute('id').match(/\S+/)) url = url + '&return_data_to=' + node.getAttribute('id');

    box.setAttribute('title', title);
    box.setAttribute('id', bid);

    /*
    $(box).load(url, function() {
            document.body.appendChild(box);
            $(box).dialog({
                autoOpen: false,
                modal: true,
                height: d_height,
                width: d_width,
                beforeClose: function(event, ui) {
                    $(box).dialog("destroy");
                    document.body.removeChild(box);
                }
            });
            $(box).dialog("open");
        }
    );
    */
    $(box).load(url);

    document.body.appendChild(box);
    $(box).dialog({
        autoOpen: false,
        modal: true,
        height: d_height,
        width: d_width,
        position: {
            my: "center-30% center-30%",
            at: "center-30% center-30%"
        },
        beforeClose: function (event, ui) {
            $(box).dialog("destroy");
            document.body.removeChild(box);
        }
    });
    $(box).dialog("open");

}

function ErrorDialog(message) {
    var box = document.createElement("div"); // dialog DIV box
    box.setAttribute('title', "Error!");
    box.innerHTML = '<pre>' + message + '</pre><b>Send this to error message to ' +
        '<a href="mailto:cpeter@uskoinc.com">cpeter@uskoinc.com</a></b>';

    document.body.appendChild(box);
    $(box).dialog({
        autoOpen: false,
        modal: true,
        height: 'auto',
        width: 'auto',
        beforeClose: function (event, ui) {
            $(box).dialog("destroy");
            document.body.removeChild(box);
        }
    });
    $(box).dialog("open");
}

function PostFormData(node, action, reloadurl, target) {
    var formdom = node;
    if (formdom === undefined || formdom === null){
        console.log("Form dom undef or null")
        return (false);
    }
    if (formdom.nodeName != 'FORM') {
        formdom = GetParent(node, 'FORM');
        if (!formdom) {
            alert("Unable to post form. Please report\nthis error to site administrator");
            return (false);
        }
    }

    var elements = formdom.elements;
    for (var i = 0, element; element = elements[i++];) {
        var results = element.checkValidity();
        if (results == false) {
            var msg = element.getAttribute('placeholder');
            if (msg == null) msg = element.getAttribute('title');
            element.value = '';
            alert(element.validationMessage + ' "' + msg + '"');
            element.focus();
            return (false);
        }
    }

    var postdata = new FormData(formdom);
    var url = formdom.getAttribute('url');
    if (!url) {
        alert("Form URL is missing. Please report\nthis error to site administrator");
        return (false);
    }

    var rgx = /\?/;
    var flg = rgx.test(url) ? '&' : '?';
    url += flg + 'form_action=' + encodeURIComponent(action);
    console.log('Update: ' + url);
    var xhr = GetXmlHttpObject();
    xhr.open('POST', url, true);
    xhr.onreadystatechange = function () {
        if (xhr && xhr.readyState == 4) {
            console.log('Response (status): ' + xhr.status);
            if (xhr.status == 200 || xhr.status == 304) {
                let content_type = xhr.getResponseHeader("Content-Type");
                let response = xhr.responseText;
                let re = /^application\/json/;
                console.log('Response (type): ' + content_type);
                console.log('Response (data): ' + xhr.responseText);
                if (re.test(content_type)) {
                    let data = eval('(' + response + ')');
                    if (data.dialog_form_id) {
                        var box = document.getElementById(data.dialog_form_id);
                        $(box).dialog("destroy");
                        document.body.removeChild(box);
                    }
                }
                ShowPg(reloadurl, target);
            } else {
                ErrorDialog('<h1>Response Status: ' + xhr.status + "</h1>\n" + xhr.responseText);
            }
        }
    };
    xhr.send(postdata);
    return xhr;
}

function PostFormRecord(node, action) {
    var formdom = node;
    if (formdom.nodeName != 'FORM') {
        formdom = GetParent(node, 'FORM');
        if (!formdom) {
            alert("Unable to post form. Please report\nthis error to site administrator");
            return (false);
        }
    }

    var postdata = $(formdom).serialize();
    var url = formdom.getAttribute('url');
    if (!url) {
        alert("Form URL is missing. Please report\nthis error to site administrator");
        return (false);
    }

    var rgx = /\?/;
    var flg = rgx.test(url) ? '&' : '?';
    url += flg + 'form_action=' + encodeURIComponent(action);

    console.log('Update: ' + url);
    console.log('Update: ' + postdata + "\n");

    $.ajax({
        type: "POST",
        url: url,
        data: postdata,
        success: function (data) {
            if (data.error_message) {
                ErrorDialog(data.error_message);
            } else {
                if (data.return_data_to) {
                    var field = document.getElementById(data.return_data_to);
                    if (field) field.value = data.last_insert_id;
                }
            }

            if (data.dialog_form_id) {
                var box = document.getElementById(data.dialog_form_id);
                $(box).dialog("destroy");
                document.body.removeChild(box);
            }
        },
        dataType: "json"
    });
    return formdom;
}

function InsertRecord(node) {
    return (PostFormRecord(node, 'insert row'));
}

function UpdateRecord(node) {
    return (PostFormRecord(node, 'update row'));
}

function DeleteRecord(node) {
    return (PostFormRecord(node, 'delete row'));
}

function SubmitOnEnter(event, node) {
    var key = event.which || event.keyCode;
    if (key == 13) {
        if (node.form.getAttribute('target')) {
            node.form.submit()
        } else {
            InsertRecord(node);
        }
        node.form.reset();
    };
}

function UpdateOnEnter(event, node) {
    var key = event.which || event.keyCode;
    if (key == 13) UpdateRecord(node);
}

function CheckRowDelete(event, node) {
    if (event.shiftKey) { // ctrlKey is another poosibility
        var form = DeleteRecord(node)
        if (form) {
            var prnt = form.parentNode;
            form.style.display = "none";
            prnt.removeChild(form);
        }
    }
}
