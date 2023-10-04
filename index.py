from flask import Flask

app = Flask(__name__)
app.secret_key = 'conect-jobs'

@app.route('/testeVocacao', methods=['POST'])
def testeVocacao():

    return 'Análise'

if __name__ == '__main__':
    app.run(debug=True)