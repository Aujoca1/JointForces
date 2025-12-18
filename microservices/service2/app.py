from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        'service': 'Microservice 2',
        'message': 'Hello from Service 2!',
        'timestamp': datetime.now().isoformat()
    })

@app.route('/health')
def health():
    return jsonify({'status': 'healthy', 'service': 'service2'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
