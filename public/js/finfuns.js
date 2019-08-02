"use strict";
var acctypes;
var paraccs;

function ToggleParentAccounts(elem) {

    let mytype = elem.options[elem.selectedIndex].value;
    let opts = document.getElementById('ParentId').childNodes;

    opts.forEach(function (e) {
        if (e.tagName === 'OPTION') {
            if (e.hasAttribute('data-type')) {
                if (e.getAttribute('data-type') != mytype) {
                    e.setAttribute('disabled', '');
                } else {
                    e.removeAttribute('disabled');
                }
            }
        }
    });
}

function ToggleAccountTypes(elem) {

    let mytype = elem.options[elem.selectedIndex].getAttribute('data-type');
    let acctype = document.getElementById('AccountTypeId');
    let opts = acctype.childNodes;

    opts.forEach(function (e) {
        if (e.tagName === 'OPTION') {
            if (e.hasAttribute('data-type')) {
                if (e.getAttribute('data-type') == mytype || !mytype) {
                    e.removeAttribute('disabled');

                } else {
                    e.setAttribute('disabled', '');
                }
            }
        }
    });

    elem.childNodes.forEach(function (e) {
        if (e.tagName === 'OPTION' && e.hasAttribute('data-type')) {
            e.removeAttribute('disabled');
        }
    });

    if (mytype != null) {
        acctype.value = mytype;
    } else {
        document.getElementById("AccountTypeIdDefault").setAttribute('selected', '');
    }
}


function ToggleVisible(elem) {
    let stop = 0;
    let start = 0;
    $(elem).parent().children().each(function () {
        if (!start) {
            if (this === elem) {
                start = 1;
            }
        } else if (!stop) {
            if (this.dataset.me) {
                stop = 1;
            } else {
                $(this).slideToggle();
            }
        }
    });
}

/*
    Counts the number of characters inside of the elem and displays in the counter
    elem    - input field to count characters of
    counter - where to display the total characters
*/
function countchars(elem, counter) {

    if (counter === undefined || counter == null) {
        counter = $(elem.parentNode).find('#counter');
    }
    let len = elem.value.length;
    let maxlen = elem.getAttribute('maxlength');
    if (len > maxlen) {
        elem.value = elem.value.substring(0, maxlen);
    } else {
        counter.text(len + '/' + maxlen);
    }
}

/*
    Scrictly for adding new items for accounting
    displayes the new fields based on item type
    elem    - the selector used to get the new fields to display
*/
function DisplayItemTypeDetails(elem){
    console.log("this is the select elem");
    console.log(elem);
    //find parent form of this element
    let form = $(elem).closest("form");
    let formid = form.attr("id");
    document.getElementById(formid).normalize();
    console.log("removing the thing");
    console.log(form.find("#item_details"));
    form.find("#item_details").remove();
    console.log("this is the form");
    console.log(form);
    let name = $(elem).children("option:selected").text();
    //clean out the name because newline and spaces... -_-
    name = name.replace(/^\s+|\s+$/g,'');
    console.log("this is the name cleaned");
    console.log(name);
    let beforenodeid = "action_buttons";
    let template = undefined;

    let newurl = form.attr('url');
    console.log("This is the old url: " + newurl);
    switch(name){

        case "Reimbursement":
        case "Service":
            console.log("called the service template");
            template = "service_type";
            //append the proper request
            newurl += "?rq=default";
        break;
        case "Discount":
            console.log("called the discount template");
            template = "discount_type";
        break;
        case "Scheduled Deduction":
        case "Other Charge":
            console.log("called the other charge template");
            template = "charge_type";
        break;
        case "Payment":
            console.log("called the payment template");
            template = "payment_type";
        break;
        default:
            console.log("No matches");
    }
    form.attr('url', newurl);

    if (template != undefined){
        console.log(typeof(template) + " " + template);
        console.log("This is the template that is being loaded");
        console.log(template);
        console.log(AddFromTemplate(formid, template, beforenodeid));
    }
}

/*
    Toggles hidden and disabled attributes in elements
    ids     -> the id of the elements to toggle
*/

function toggle_elems(ids, onoff){
    let elems = ids.map(x => $('#' + x));
    let value = !elems[0].prop('hidden');
    console.log(value);
    if (onoff != undefined){
        value = onoff;
    }
    console.log(value);

    elems.forEach(elem => {
        elem.prop('hidden', value);
        elem.prop('disabled', value);

        let checkbox = elem.find("input[type='checkbox']");
        if (checkbox.prop('checked')){
            checkbox.prop('checked', false).trigger('onchange');
        }
        elem.children().prop('hidden', value);
        elem.children().prop('disabled', value);
    });
}


function invoice_subtotal(elem) {

    //specific function for calculating invoice subtotals for each item
    let sibs = $(elem.parentNode.parentNode).children();
    let quantity = sibs.find('#inv_quantity').val();
    if (quantity === undefined){
        quantity = 1;
    }
    let price = sibs.find('#inv_price').val();
    if (price === undefined){
        price = 0;
    }
    sibs.find('#inv_sum').val(price * quantity);
}

function invoice_item_values(elem){
    let sibs = $(elem.parentNode.parentNode).children();
    let selected = sibs.find('#inv_item_info').find(':selected');
    let quant = sibs.find('#inv_quantity')
    quant.val('1');
    let price = sibs.find('#inv_price')
    price.val(selected.data("price"));
    sibs.find('#inv_sum').val(quant.val() * price.val());
}

function toggle_elems_wrapper(elem, id, ids){
    if ($(elem).find('input:checked').prop('id') == id){
        console.log($(elem).find('input:checked').prop('id'));
        toggle_elems(ids, false);
    } else {
        toggle_elems(ids, true);
    }
}


function toJSON(node) {
    node = node || this;
    let obj = undefined;

    switch (node.nodeName){
        case 'INPUT':
        case 'SELECT':
        case 'TEXTAREA':
            if (node.hasAttribute('name')){
                let name = node.getAttribute('name');
                obj = {};
                obj[name] = node.value;
            }
            return obj;
        break;
        default:
        break;
    }


    let children = node.children;
    for (let i = 0; i < children.length; i++){
        let child = children.item(i);
        let childobj = toJSON(child);
        if (childobj != undefined){
            if (obj === undefined){
                obj = childobj;
            } else {
                //merge objects together
                Object.keys(childobj).forEach((v) => {
                    if (v in obj){
                        if (Array.isArray(obj[v])){
                            obj[v] = obj[v].concat(childobj[v]);
                        } else {
                            obj[v] = [obj[v]].concat(childobj[v]);
                        }
                    } else {
                        obj[v] = childobj[v];
                    }
                });
            }
        }
    }

    if (node.nodeName === 'FIELDSET'){
        let fset = undefined;
        if (node.hasAttribute('name')){
            fset = {};
            fset[node.getAttribute('name')] = obj;
        }
        return fset;

    } else if (node.nodeName === 'FORM') {

        console.log(JSON.stringify(obj));
        return false;
    }
    return obj;
}


// function toJSON(node) {
//     node = node || this;
//     var obj = {
//       nodeType: node.nodeType
//     };
//     if (node.tagName) {
//       obj.tagName = node.tagName.toLowerCase();
//     } else
//     if (node.nodeName) {
//       obj.nodeName = node.nodeName;
//     }
//     if (node.nodeValue) {
//       obj.nodeValue = node.nodeValue;
//     }
//     var attrs = node.attributes;
//     if (attrs) {
//       var length = attrs.length;
//       var arr = obj.attributes = new Array(length);
//       for (var i = 0; i < length; i++) {
//         attr = attrs[i];
//         arr[i] = [attr.nodeName, attr.nodeValue];
//       }
//     }
//     var childNodes = node.childNodes;
//     if (childNodes) {
//       length = childNodes.length;
//       arr = obj.childNodes = new Array(length);
//       for (i = 0; i < length; i++) {
//         arr[i] = toJSON(childNodes[i]);
//       }
//     }
//     return obj;
//   }