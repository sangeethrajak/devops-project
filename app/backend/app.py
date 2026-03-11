from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
 host="RDS-ENDPOINT",
 database="contacts",
 user="postgres",
 password="Password123"
)

@app.route('/submit', methods=['POST'])
def submit():

 data = request.json
 name = data["name"]
 phone = data["phone"]

 cur = conn.cursor()
 cur.execute("INSERT INTO contacts(name,phone) VALUES(%s,%s)",(name,phone))
 conn.commit()

 return jsonify({"message":"saved"})


@app.route("/")
def home():
 return "backend running"

app.run(host="0.0.0.0",port=5000)