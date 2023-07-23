// ==UserScript==
// @name AutoScroll
// @namespace https://github.com/JustABeginning
// @description Auto Scroll Window
// @include http*://*
// @include file://*
// @require https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js
// @version 1.0
// @grant GM_registerMenuCommand
// ==/UserScript==
/* global $ */

GM_registerMenuCommand("AutoScroll", function () {
    var speed = Number(prompt("Select SPEED (10 fast, 2000 slow; -1 to cancel)", "200"));
    if (speed >= 0) {
        var pixel = Number(prompt("Select PIXEL (-1 to cancel)", "60"));
        if (pixel >= 0) {
            var no_click = true;
            var scroll = function () {
                if (no_click) {
                    window.scrollBy(0, pixel);
                }
                setTimeout(scroll, speed);
            };
            $(document).ready(function () {
                $(document).click(function () {
                    if (no_click) {
                        no_click = false;
                    }
                    else {
                        no_click = true;
                    }
                });
                setTimeout(scroll, speed);
            });
        }
    }
});
