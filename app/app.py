from flask import Flask, Response, request
import json
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def get_time():
    response_data = {
        "ip": request.remote_addr,
        "timestamp": datetime.utcnow().isoformat()
    }
    return Response(json.dumps(response_data, indent=2), mimetype="application/json")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)
