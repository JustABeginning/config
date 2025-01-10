// ==UserScript==
// @name AutoScroll
// @namespace https://github.com/JustABeginning
// @description Auto Scroll Window
// @include http*://*
// @include file://*
// @require https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js
// @version 1.0
// @grant GM_registerMenuCommand
// @grant GM_setValue
// @grant GM_getValue
// ==/UserScript==
/* global $ */

GM_registerMenuCommand("AutoScroll", function () {
    /* Speed Parameters */
    const MIN_SPEED = 2000;
    const MAX_SPEED = 10;
    const SPEED_DEFAULT = "200";
    /* Pixel Parameters */
    const PIXEL_DEFAULT = "60";
    /* Command Parameters */
    const CANCEL_CMD = -1;
    var speedVal = Number(prompt(`Select SPEED (${MAX_SPEED} fast, ${MIN_SPEED} slow; ${CANCEL_CMD} to cancel)`, SPEED_DEFAULT));
    if (speedVal >= 0) {
        GM_setValue("allowRun", true);
        GM_setValue("speed", speedVal);
        var pixelVal = Number(prompt(`Select PIXEL (${CANCEL_CMD} to cancel)`, PIXEL_DEFAULT));
        if (pixelVal >= 0) {
            GM_setValue("pixel", pixelVal);
            GM_setValue("noClick", true);
            var scroll = function () {
                let runAllow = GM_getValue("allowRun", false);
                let statNoClick = GM_getValue("noClick", false);
                if (runAllow && statNoClick) {
                    let valPixel = GM_getValue("pixel", 0);
                    window.scrollBy(0, valPixel);
                }
                let valSpeed = GM_getValue("speed", MIN_SPEED);
                setTimeout(scroll, valSpeed);
            };
            $(document).ready(function () {
                $(document).click(function () {
                    let statNoClick = GM_getValue("noClick", false);
                    if (statNoClick) {
                        GM_setValue("noClick", false);
                    }
                    else {
                        GM_setValue("noClick", true);
                    }
                });
                let valSpeed = GM_getValue("speed", MIN_SPEED);
                setTimeout(scroll, valSpeed);
            });
        }
        else {
            GM_setValue("allowRun", false);
        }
    }
    else {
        GM_setValue("allowRun", false);
    }
});
