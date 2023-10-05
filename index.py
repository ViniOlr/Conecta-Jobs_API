from flask import Flask
from flask import Flask, request, jsonify
from bardapi import Bard
from key import  API_KEY_BARD
import os

app = Flask(__name__)
app.secret_key = 'conect-jobs'

@app.route('/testeVocacao', methods=['POST'])
def testeVocacao():
    try:
        data = request.json
        nome = data.get('nome')
        
        os.environ['_BARD_API_KEY']=API_KEY_BARD

        pergunta = f'Olá, sou uma criança de uma ong chamada Passos Mágicos, me chamdo {nome} e gostaria que você me ajudasse a pensar em que área posso me com base nas minhas informações. Eu gosto bastante de informática, tenho aptidão por isto. Gosto de matemática e gostaria de trabalhar na prefeitura.'

        bard_output = Bard().get_answer(pergunta)['content']

        return jsonify({"sucesso":bard_output})
    except Exception as erro:

        return jsonify({'erro':erro})


if __name__ == '__main__':
    app.run(debug=True)