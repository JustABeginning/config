// ==UserScript==
// @name Google Translate
// @description Google Translate WebPage
// @include http*://*
// @include file://*
// @require https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js
// @version 1.0
// @grant GM_registerMenuCommand
// ==/UserScript==
/* global $ */

GM_registerMenuCommand("Google Translate", function () {
    let status = document.getElementById("google_translate_element");
    if (status == null) {
        let ans = confirm("Click OK to Translate");
        if (ans) {
            $(document).ready(function () {
                $("head").append(
                    "<script type=\"text/javascript\">\n" +
                    "function googleTranslateElementInit() {\n" +
                    "new google.translate.TranslateElement(\n" +
                    "{\n" +
                    "pageLanguage: 'el',\n" +
                    "includedLanguages: 'en,el',\n" +
                    "layout: google.translate.TranslateElement.InlineLayout.SIMPLE\n" +
                    "},\n" +
                    "'google_translate_element'\n" +
                    ");\n" +
                    "}\n" +
                    "</script>\n"
                );
                $("head").append(
                    "<script type=\"text/javascript\"\n" +
                    "src=\"https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit\"></script>\n"
                );
                let prependItem = "<div id=\"google_translate_element\" style=\"position: fixed; z-index: 500\"></div>\n";
                $("body").prepend(prependItem);
            });
        }
        else {
            alert("Translation Aborted !");
        }
    }
    else {
        alert("Translation Already Present !");
    }
});
