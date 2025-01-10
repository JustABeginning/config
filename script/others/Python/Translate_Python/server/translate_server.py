from flask import Flask, request
from googletrans import Translator


def translateG(txt):
    result = txt
    translator = Translator()
    targetLang = 'en'
    translate_obj = translator.translate(str(txt), targetLang)
    if translate_obj is not None:
        result = translate_obj.text
    return str(result)


app = Flask(__name__)


@app.route('/<mapping_name>', methods=['POST'])
def handle_translateG():
    result = str()
    try:
        content = request.json
        if content is not None:
            txt = content['text']
            if txt is not None:
                result = translateG(txt)

        return result
    except BaseException:
        return result


if __name__ == '__main__':
    run_host = "<IP_Address>"
    run_port = 3001
    app.run(host=run_host, port=run_port, debug=True)
