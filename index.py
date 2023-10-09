from flask import Flask, request, jsonify
from bardapi import Bard
import os
from dotenv import load_dotenv

load_dotenv() # Carrega as variáveis de ambiente


app = Flask(__name__)
app.secret_key = 'conect-jobs'

@app.route('/testeVocacao', methods=['POST'])
def testeVocacao():
    try:
        conexaoComBanco = False
        connection = ''
        inst_cadastro = ''
        
        # conexao = conectaBanco()

        # if conexao[0] == 'Erro':
        #     # flash(f'Erro ao se conectar com o 213', 'error')
        #     return 'Erro ao conectar com o banco de dados'
        # else:
        #     connection = conexao[0]
        #     inst_cadastro = conexao[1]

        #     conexaoComBanco = True

        nome = request.json.get('nome')
        
        
        os.environ['_BARD_API_KEY'] = os.getenv('API_KEY_BARD')

        pergunta = f'Olá, sou uma criança de uma ong chamada Passos Mágicos, me chamdo {nome} e gostaria que você me ajudasse a pensar em que área posso me com base nas minhas informações. Eu gosto bastante de informática, tenho aptidão por isto. Gosto de matemática e gostaria de trabalhar na prefeitura.'

        bard_output = Bard().get_answer(pergunta)['content']

        # sql = 'INSERT INTO cj_teste_vocacional (id_teste, id_usuario, pergunta, resposta)'
        # sql += 'VALUES(seq_cj_id_teste.NEXTVAL, seq_cj_id_usuario.CURRVAL, :1, :2)'

        # inst_cadastro.execute(sql, (pergunta, bard_output))

    except Exception as erro:
        if conexaoComBanco:
            connection.rollback()

        return jsonify({'erro':str(erro)})
    else:
        if conexaoComBanco:
            connection.commit()

        return jsonify({"sucesso":bard_output})
    finally:
        if conexaoComBanco:
            connection.close()
            inst_cadastro.close()


if __name__ == '__main__':
    app.run(debug=True)
