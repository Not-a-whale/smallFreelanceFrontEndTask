function ReformatSSN(node)
{
    node.value = node.value.replace(/\D/g,'');
    node.value = node.value.replace(/^(\d{9}).*/g,'$1');
    node.value = node.value.replace(/^(\d{3})/,'$1-');
    node.value = node.value.replace(/^(\d{3})-(\d{2})/,'$1-$2-');
}

function ReformatEIN(node)
{
    node.value = node.value.replace(/\D/g,'');
    node.value = node.value.replace(/^(\d{9}).*/g,'$1');
    node.value = node.value.replace(/^(\d{2})/,'$1-');
}

function ApplyTaxFormat(typenodeid,taxnodeid)
{
    var node = document.getElementById(taxnodeid);
    var type = document.getElementById(typenodeid).value;
    var regx = /^(EIN|SSN)$/i;
    if( ! regx.test(type) ) return null;
    regx = /^EIN$/i;
    if( regx.test(type) ) {
        ReformatEIN(node);
    } else {
        ReformatSSN(node);
    }
}

function ReformatPhoneNumber(node)
{
    var number = node.value.replace(/\D/g,'');
    var result = number;

    if( number.match(/^\d{3,}/) ) {
        result = number.replace(/^(\d{3})(\d+)/,'$1-$2');
    }
    if( number.match(/^\d{7}$/) ) {
        result = number.replace(/^(\d{3})(\d{4})$/, '$1-$2');
    }
    if( number.match(/^\d{10}$/) ) {
        result = number.replace(/^(\d{3})(\d{3})(\d{4})/,'$1-$2-$3 ');
    }
    if( number.match(/^\d{10}\d+$/) ) {
        result = number.replace(/^(\d{3})(\d{3})(\d{4})(\d+)/,'$1-$2-$3 $4');
    }
    node.value = result;
}

function ReformatZipCode(node)
{
    node.value = node.value.replace(/\D/g,'');
    node.value = node.value.replace(/^(\d{5}).*/g,'$1');
}

function FindChildByName(node,name) {
    for( var i = 0; i < node.childNodes.length; i++) {
        var chld = node.childNodes[i];
        if( chld.nodeName == "#text" ) continue;
        if( chld.getAttribute("name") == name ) return chld;
    }
    return null;
}

//beforenode allows you to add the new node before the specified node
//either node itself or id of the node
function AddFromTemplate(destid,templateid,beforenode=undefined)
{
    var src = null;
    var dst = null;

    if( typeof(destid) == 'object' ) {
        dst = destid;
    } else {
        dst = document.getElementById(destid);
    }

    if( templateid === 'object' ) {
        src = templateid;
    } else {
        src = document.getElementById(templateid);
    }

    var clone = document.importNode(src.content, true);
    var chld = undefined;
    if (beforenode === undefined){
        chld = dst.appendChild(clone);
    } else {
        //normalize the node to before
        if (typeof(beforenode) != 'object'){
            beforenode = document.getElementById(beforenode);
        }
        console.log("appending before this node: ");
        console.log(beforenode);
        dst.insertBefore(clone, beforenode);
    }
    return(chld);
}

function add_drop_down(node)
{
	let uri = node.getAttribute("uri-conn");
    var constraint = node.getAttribute("constraint");
    if( constraint ) {
        var url = "/templates/ajaxwork/constraint.json?report=" + constraint;
		if (uri)
			url = uri;
        node.removeAttribute("constraint");
        $(node).autocomplete(
                                {
                                   "list" : {
                                      "match" : {
                                         "enabled" : true
                                      }
                                   },
                                   "source" : url
                                }
                            );
    }
}

function multi_update_dropdown(node) {
    let group = node.getAttribute("actgnme");
    let url = node.getAttribute("actgurl");
    let prefix = node.getAttribute("actgpfx");
    let elements = document.getElementsByClassName(group);
    let formData = new FormData();
    formData.append('actgpfx',prefix);
    formData.append('actgnme',group);
    for (let i = 0, element; element = elements[i++];) { formData.append(element.name, element.value); }
    let xhr = GetXmlHttpObject();
    xhr.open('post', url, true);
    xhr.onreadystatechange = function() {
        if( xhr && xhr.readyState == 4) {
            console.log('Response (status): ' + xhr.status);
            if (xhr.status == 200 || xhr.status == 304) {
                let content_type = xhr.getResponseHeader("Content-Type");
                let response = xhr.responseText;
                let re = /^application\/(javascript|json)/;
                console.log('Response (type): ' + content_type);
                console.log('Response (data): ' + xhr.responseText);
                if (re.test(content_type)) {
                }
            } else {
                ErrorDialog('<h1>Response Status: ' + xhr.status + "</h1>\n" + xhr.responseText);
            }
        }
    };
    xhr.send(formData);
}
