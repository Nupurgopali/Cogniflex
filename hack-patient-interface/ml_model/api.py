from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse
app = Flask(__name__)

@app.route("/", methods=['GET'])
def home():
    return "Welcome to SoulFit"
@app.route('/predict', methods=['POST'])
def predict():
    lr = joblib.load("model_final3.sav")
    if lr:
        try:
            json = request.get_json()  
            lon=list(json['0'])
            #lat=json['lat']
            inp=np.array([lon])
            prediction = lr.predict(inp)
            if prediction[0]==0:
                output='Not-familiar'
            else:
                output='familiar'
            print("here:",prediction[0])
            return jsonify({'prediction': output})
        except:
            return jsonify({'trace': traceback.format_exc()})
    else:
        return ('No model')
    

if __name__ == '__main__':
    app.run(debug=True)