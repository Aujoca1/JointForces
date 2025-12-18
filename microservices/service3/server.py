from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
        elif self.path == '/health':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(b'{"status": "healthy", "service": "service3"}')
            return
        return SimpleHTTPRequestHandler.do_GET(self)

PORT = 3000
os.chdir('/app')
server = HTTPServer(('0.0.0.0', PORT), Handler)
print(f"Service 3 running on port {PORT}")
server.serve_forever()
