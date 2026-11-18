import os
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"ok")

    def log_message(self, *args):  # keep logs clean
        pass

HTTPServer(("0.0.0.0", int(os.getenv("PORT", "8080"))), Handler).serve_forever()