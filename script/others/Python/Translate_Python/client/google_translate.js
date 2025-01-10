// ==UserScript==
// @name Google Translate Alternate
// @description Google Translate WebPage
// @include http*://*
// @include file://*
// @connect *
// @version 1.0
// @grant GM_registerMenuCommand
// @grant GM_xmlhttpRequest
// ==/UserScript==
/* global $ */

const execFunc = async function (txtArr, addr) {
    let c = 0;
    for (var i = 0; i < txtArr.length; i++) {
        const txtData = txtArr[i].innerHTML.toString();
        const jsonObj = {text: txtData};
        const jsonData = JSON.stringify(jsonObj);
        let reqPromise = new Promise(async function (resolve) {
            await GM_xmlhttpRequest({
                method: 'POST',
                url: addr + '/<mapping_name>',
                headers: {"Content-Type": "application/json"},
                data: jsonData,
                onload: function (response) {
                    c++;
                    var respText = response.responseText;
                    if (respText === undefined)
                        resolve(txtData);
                    else
                        resolve(respText);
                },
                onerror: function () {
                    c++;
                    resolve(txtData);
                },
                ontimeout: function () {
                    c++;
                    resolve(txtData);
                }
            });
        });
        let resp = await reqPromise;
        txtArr[i].innerHTML = resp;
        console.log(`\n${c}) ${resp}`);
    }
    console.log("\n");
    return c;
};

const mainFunc = async function (addr) {
    if (addr.length > 0) {
        let txtArr1 = document.querySelectorAll("<query_selector(s)>");
        let txtArr2 = document.querySelectorAll("<query_selector(s)>");
        const txtArr = (txtArr1 == null || txtArr1.length == 0) ? txtArr2 : txtArr1;
        alert(`No. of TRANSLATE Node(s) = ${txtArr.length}`);
        let c = await execFunc(txtArr, addr);
        if (c == txtArr.length)
            alert(`Translation Completed SUCCESSFULLY (${c}) !`);
        else
            alert(`Translation UNSUCCESSFUL (${c}) < ${txtArr.length} !`);
    }
};

GM_registerMenuCommand("Google Translate Alternate", async function () {
    let addr = prompt("Enter Server Address", "");
    if (addr != null && addr.length > 0) {
        await mainFunc(addr);
    }
});
