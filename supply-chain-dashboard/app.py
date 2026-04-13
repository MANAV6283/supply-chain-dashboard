from flask import Flask, jsonify
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="supply_chain_db"
)

@app.route('/kpi')
def kpi():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT COUNT(*) AS total_orders FROM orders")
    total_orders = cursor.fetchone()

    cursor.execute("SELECT SUM(quantity) AS total_inventory FROM inventory")
    total_inventory = cursor.fetchone()

    return jsonify({
        "total_orders": total_orders["total_orders"],
        "total_inventory": total_inventory["total_inventory"]
    })

@app.route('/order_status')
def order_status():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT status, COUNT(*) AS total FROM orders GROUP BY status")
    return jsonify(cursor.fetchall())

@app.route('/transport_cost')
def transport_cost():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT transport_mode, AVG(cost) AS avg_cost FROM logistics GROUP BY transport_mode")
    return jsonify(cursor.fetchall())

@app.route('/delivery_time')
def delivery_time():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT transport_mode, AVG(delivery_time) AS avg_time FROM logistics GROUP BY transport_mode")
    return jsonify(cursor.fetchall())

app.run(debug=True)