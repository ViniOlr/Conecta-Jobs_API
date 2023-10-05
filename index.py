from flask import Flask, request, jsonify, flash
from bardapi import Bard
from key import  API_KEY_BARD
import os
import oracledb

app = Flask(__name__)
app.secret_key = 'conect-jobs'

def conectaBanco():
    try:
        # Crie uma conexão
        conn = oracledb.connect(user="rm93613", password="150503", dsn="oracle.fiap.com.br:1521/orcl")

        # Cria as instruções para cada módulo
        inst_cadastro = conn.cursor()
        inst_consulta = conn.cursor()
        inst_alteracao = conn.cursor()
        inst_exclusao = conn.cursor()

        return[conn, inst_cadastro, inst_consulta, inst_alteracao, inst_exclusao]
    except Exception as erro:
        return['Erro', str(erro)]
    
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

        data = request.json
        nome = data.get('nome')
        
        os.environ['_BARD_API_KEY']=API_KEY_BARD

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