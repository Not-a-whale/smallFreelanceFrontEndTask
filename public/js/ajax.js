// $Id: ajax.js,v 1.7 2016/11/11 00:22:13 cpeter Exp cpeter $
// http://blog.sscn.com/index.php/Webdev/DOM_XML_XSLT_JSON_CGI

function GetXmlHttpObject() {
    let xhr = false;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        if (window.ActiveXObject) {
            try {
                xhr = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    xhr = false;
                }
            }
        }
    }
    return xhr;
}

function dom_to_hash(node) {
    if (node === undefined) return (false);
    if (typeof(node) != 'object') return (false);
    if (node instanceof HTMLElement) {
        let attrs = [];
        let jsn = {
            nodeName: node.nodeName
        };
        if (jsn.nodeName == '#text') return (false);
        if (node.attributes && node.attributes.length > 0) {
            jsn.attr = [];
            for (let i = 0; i < node.attributes.length; i++) {
                let val = node.attributes[i].value;
                if (node.attributes[i].name == 'value' && node.value) val = node.value;
                jsn.attr.push({
                    name: node.attributes[i].name,
                    value: val
                });
            }

            if (node.type === "checkbox") {
                jsn.attr.push({
                    name: 'checked',
                    value: node.checked ? 1 : 0
                });
            }

            if (node.type === "radio") {
                jsn.attr.push({
                    name: 'checked',
                    value: node.checked ? 1 : 0
                });
            }

            if (node.nodeName == 'OPTION') {
                jsn.attr.push({
                    name: 'selected',
                    value: node.selected ? 1 : 0
                });
            }

            if (node.nodeName == 'TEXTAREA') {
                jsn.attr.push({
                    name: 'value',
                    value: node.value
                });
            }
        }

        if (node.childNodes && node.childNodes.length > 0) {
            jsn.children = [];
            for (let j = 0; j < node.childNodes.length; j++) {
                let child = dom_to_hash(node.childNodes[j]);
                if (child) jsn.children.push(child);
            }
        }
        return jsn;
    } else {
        return (node);
    }
}

function encode_json(node) {
    let hash = dom_to_hash(node);
    if (hash) {
        /*
        hash.essentials = {
            display : {
                fullWidth   : screen.width,
                fullHeight  : screen.height,
                availWidth  : screen.availWidth,
                availHeight : screen.availHeight,
                colorDepth  : screen.colorDepth,
                pixelDepth  : screen.pixelDepth
            },

            container : {
                innerWidth : window.innerWidth,
                innerHeight : window.innerHeight
            },

            node : {
                innerWidth : node.innerWidth,
                innerHeight : node.innerHeight
            }

            navigator : {
                cookie : navigator.cookieEnabled ? 1 : 0,
                java : navigator.javaEnabled() ? 1 : 0
            }
        };
        */
        return (JSON.stringify(hash));
    } else {
        return (false);
    }
}

//Parameters
//  url     - required
//  post    - optional (object or string, object will be serialized
//  bgrd    - background request? Default is true
//  type    - Send content-type, default is 'application/x-www-form-urlencoded'
//  method  - POST or GET. Default is GET unless 'post' has something.
//  target  - return results to target.
function SubmitAjaxRequest(args) {
    let send_data = null;
    let xhr = GetXmlHttpObject();
    if (!xhr) return (false);

    if (args === undefined || args === null) return (false);
    if (typeof(args) != 'object') return (false);
    if (args.url === undefined) return (false);
    if (args.bgrd === undefined) args.bgrd = true;
    if (args.post !== undefined) {
        if (typeof(args.post) == 'function') return (false);
        args.method = 'POST';
        send_data = args.post;
        if (typeof(args.post) == 'object') {
            send_data = encode_json(args.post);
            args.type = 'application/json';
        }
    }

    if (args.method === undefined) args.method = "GET";
    if (args.type === undefined) args.type = "application/x-www-form-urlencoded";

    xhr.open(args.method, args.url, args.bgrd);
    xhr.setRequestHeader("Content-Type", args.type);
    if (args.bgrd) {
        if (args.target === undefined) {
            xhr.onreadystatechange = function() {
                read_ajax_response(xhr, null)
            };
        } else {
            if (typeof(args.target) == 'function') {
                xhr.onreadystatechange = args.target;
            }
            if (typeof(args.target) == 'object') {
                xhr.onreadystatechange = function() {
                    read_ajax_response(xhr, args.target)
                };
            }
        }
        console.log(
            "Submitting background ajax request to: " + args.url + "\n" +
            "Content-type: " + args.type + "\n" +
            "Parameters: " + send_data + "\n"
        );
        xhr.send(send_data);
        return (xhr);
    } else {
        console.log(
            "Submitting real time ajax request to: " + args.url + "\n" +
            "Content-type: " + args.type + "\n" +
            "Parameters: " + send_data + "\n"
        );
        xhr.send(send_data);
        read_ajax_response(xhr, args.target);
    }
}

// xhr      - AJAX response object
// target   - target object or html element where
//            to place received response.
function read_ajax_response(xhr, target) {
    if (xhr && xhr.readyState == 4) {
        let content_type = null; // content type must be processed by RegEx for browsers occasionally add charset to it
        if (xhr.status == 200 || xhr.status == 304) { // make sure to process both returned and cached data
            content_type = xhr.getResponseHeader("Content-Type"); // ... what else can we use in the header :)
            let re = /^(application|text)\/.*xml/; // process response with RegEx according to
            let response = re.test(content_type) ? xhr.responseXML : xhr.responseText; // XML or nonXML types

            re = /^application\/form-response-json/; // if type is application/form-response-json
            if (re.test(content_type)) { // and returned JSON object has 'returnid' and
                let json = eval('(' + response + ')'); // 'data' elements, then search for DOM with
                if (json.returnid && json.data) { // id of returnid, and assume it is some form
                    let targetnode = document.getElementById(json.returnid); // element. Store data as value of such element
                    if (targetnode) targetnode.value = json.data; // if such DOM exists
                }
            } else {
                if (typeof(target) == 'object' && target !== null) { // if target exists and it is an HTML element
                    if (target instanceof HTMLElement) { // then fill target with HTML content
                        target.innerHTML = response;
                    } else { // if target is not an HTML element then construct
                        target.response = {}; // return subobject within return target of:
                        target.response.type = content_type; // target.response = { type: content_type, data: rsp }
                        re = /^application\/(javascript|json)/; // and if content type is some JSON/JavaScript then
                        if (re.test(content_type)) { // attempt to eval it,
                            target.response.data = eval('(' + response + ')');
                        } else { // and if not, then return AS IS
                            target.response.data = response; // and don't worry about processing it right
                        } // after receiving
                    }
                }
            }
        } else {
            console.log("Received error from AJAX request\n" + xhr.responseText);
            alert("Error!\n" + xhr.responseText );
        }
    }
}

// arguments:
//  xmlurl  - url for XML content
//  xslurl  - url for XSL content
//  target  - dom object or id of dom object
//  post    - data to post
function XmlXsltContent(args) {
    if (args === undefined || args === null) return (false);
    if (typeof(args) != 'object') return (false);
    if (args.xmlurl === undefined || args.xmlurl === null) return (false);
    if (args.xslurl === undefined || args.xslurl === null) return (false);
    if (args.target === undefined || args.target === null) return (false);

    let trgdom = null;
    let xmldat = {};
    let xsldat = {};

    if (typeof(args.target) == 'string') {
        trgdom = document.getElementById(args.target);
    } else if ((typeof(args.target) == 'object') && (args.target instanceof HTMLElement)) {
        trgdom = args.target;
    }
    if (trgdom === undefined || trgdom === null) return (false); // return if target dom object is undefined
    if (!(trgdom instanceof HTMLElement)) {
        alert("Waring : " + args.target);
        return false;
    }

    let re = new RegExp("\.x[sm]l$"); // POST is not allowed for text files
    let xmlpost = re.test(args.xmlurl) ? undefined : args.post; // remove post for plain files
    let xslpost = re.test(args.xslurl) ? undefined : args.post;
    SubmitAjaxRequest({
        bgrd: false,
        target: xmldat,
        url: args.xmlurl,
        post: args.post
    });
    SubmitAjaxRequest({
        bgrd: false,
        target: xsldat,
        url: args.xslurl,
        post: xslpost
    });

    if (window.ActiveXObject) {
        trgdom.innerHTML = xmldat.response.data.transformNode(xsldat.response.data);
        return (true);
    } else if (document.implementation && document.implementation.createDocument) {
        let xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsldat.response.data);
        let resultDocument = xsltProcessor.transformToFragment(xmldat.response.data, document);
        if (resultDocument === null) return (false);
        trgdom.innerHTML = null;
        trgdom.appendChild(resultDocument);
        return (true);
    }
    return (false);
}

// Arguments:
//  url:    required url
//  target: required target dom object or id
//  post:   optional JSON or DOM object to post to URL
function PostForXslt(args) {
    let json = {};

    if (args === undefined || args === null) return (false);
    if (typeof(args) != 'object') return (false);

    if (args.target === undefined || args.target === null) return (false);
    if (args.url === undefined || args.url === null) return (false);

    SubmitAjaxRequest({
        bgrd: false,
        target: json,
        url: args.url,
        post: args.post
    });
    XmlXsltContent({
        xmlurl: json.response.data.xmlurl,
        xslurl: json.response.data.xslurl,
        target: args.target,
        post: args.post
    });
}
