from flask import Flask, Response, request  # Import Flask, Response, and request handling
import json  # Import JSON module for handling JSON data
from datetime import datetime  # Import datetime module to get current time

# Initialize Flask application
app = Flask(__name__)

# Define route for the root URL ('/')
@app.route("/")
def get_time():
    # Create a response dictionary containing IP address and current timestamp
    response_data = {
        "timestamp": datetime.utcnow().isoformat(),  # Get the current UTC timestamp in ISO format
        "ip": request.remote_addr,  # Get the visitor's IP address
    }
    
    # Convert dictionary to JSON with indentation for better readability
    # Return as HTTP Response with appropriate MIME type (application/json)
    return Response(json.dumps(response_data, indent=2), mimetype="application/json")

# Run the Flask application
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)  # Start server on port 5000, accessible externally
