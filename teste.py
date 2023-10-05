import requests
import json

# URL da sua rota Flask
url = 'http://localhost:5000/testeVocacao'  # Substitua pela URL correta

# Dados que você deseja enviar no formato JSON
dados = {'nome': 'Vinicius'}

# Converte os dados para formato JSON
dados_json = json.dumps(dados)

# Define o cabeçalho da requisição para indicar que estamos enviando JSON
headers = {'Content-Type': 'application/json'}

# Realiza a requisição POST
response = requests.post(url, data=dados_json, headers=headers)

# Verifica se a requisição foi bem-sucedida (código de status 200)
if response.status_code == 200:
    resposta_json = response.json()
    print('Resposta do servidor:')
    print(resposta_json)
else:
    print('A requisição falhou com o código de status:', response.status_code)
