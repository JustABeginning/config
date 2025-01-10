/** Functions */

/** Translate */

const {translate} = require('bing-translate-api');

const targetLang = 'en';

const useTranslateB = async function (text) {
    let ret = text;
    await translate(text, null, targetLang).then(res => {
        ret = res.translation;
    }).catch(err => {});
    return ret;
};

/** Server */

const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const jsonParser = bodyParser.json();

const app = express();
app.use(morgan('combined'));

/* Listen */
const port = 3000;
app.listen(port, () => {
    console.log(`\n\tServer Running on PORT: ${port} . . .\n`);
});

/* POST Handler */
app.post('/<mapping_name>', jsonParser, async function (req, res) {
    let val = new String();
    try {
        const data = req.body;
        val = await useTranslateB(data.text);
    } catch (err) {}
    res.status(201).send(val);
});
