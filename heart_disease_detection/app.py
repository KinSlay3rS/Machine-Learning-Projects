import pandas as pd
import joblib
import streamlit as st
import random

model = joblib.load("model.pkl")


st.set_page_config(page_title="Heart Health Inference",layout='centered')
st.title("Heart Disease Detection App")

st.markdown("Enter Medical details")

with st.form("input_form"):
    col1, col2 = st.columns(2)
    with col1:
        age     = st.number_input("Age",min_value=0,value=30,max_value=100)
        sex     = st.selectbox("Gender" ,['Male','Female'])
        dataset = random.choice(['Cleveland', 'Hungary', 'Switzerland', 'VA Long Beach'])
        cp      = st.selectbox("Chest Pain",['typical angina', 'atypical angina', 'non-anginal', 'asymptomatic'])
        trestbps= st.number_input("Resting Blood Pressure",min_value = 30, value = 110,max_value=200)
        chol    = st.number_input("serum cholesterol in mg/dl",min_value = 0.0, max_value = 700.0, value=140.0)
        fbs     = st.selectbox("fasting blood sugar > 120 mg/dl",['Yes','No'])
        
    with col2:    
        restecg = st.selectbox("rest ECG results",['normal', 'stt abnormality', 'lv hypertrophy'])
        thalch  = st.number_input("Maximum Heart rate achieved",min_value=60,value=140, max_value=210)
        exang   = st.selectbox("exercise-induced angina",['Yes','No'])
        oldpeak = st.number_input("ST depression induced by exercise relative to rest",min_value=-3,value=0, max_value=7)
        slope   = st.selectbox("slope of the peak exercise ST segment",['downsloping', 'flat', 'upsloping'])
        ca      = st.selectbox("number of major vessels colored by fluoroscopy",[0,1,2,3])
        thal    = st.selectbox("thal",['normal', 'fixed defect', 'reversible defect'])

    submitted = st.form_submit_button("Infer Heart Health")

if submitted:
    input_df = pd.DataFrame([{
        "age":      age,
        "sex":      sex,
        "dataset": dataset,
        "cp":       cp,
        "trestbps": float(trestbps),
        "chol":     float(chol),
        "fbs":      1 if fbs == "Yes" else 0,
        "restecg":  restecg,
        "thalch":   float(thalch),
        "exang":    1 if exang == "Yes" else 0,
        "oldpeak":  float(oldpeak),
        "slope":    slope,
        "ca":       float(ca),
        "thal":     thal,
    }])

    prediction = model.predict(input_df)[0]
    proba      = model.predict_proba(input_df)[0][1]

    if prediction == 0:
        st.markdown(f"""
        <div class="result-normal">
            <div class="result-icon">💚</div>
            <h2>Heart Appears Normal</h2>
            <p>No significant signs of heart disease detected based on the provided data.</p>
            <div class="prob-bar-bg">
                <div style="width:{proba*100:.1f}%;height:8px;background:linear-gradient(90deg,#22c55e,#16a34a);border-radius:999px;transition:width 0.8s ease;"></div>
            </div>
            <p style="margin-top:0.5rem;color:#555;font-size:0.8rem">Disease probability: <strong style="color:#4ade80">{proba*100:.1f}%</strong></p>
        </div>
        """, unsafe_allow_html=True)
    else:
        st.markdown(f"""
        <div class="result-disease">
            <div class="result-icon">❤️‍🩹</div>
            <h2>Heart Disease Detected</h2>
            <p>Clinical indicators suggest a likelihood of heart disease. Please consult a cardiologist.</p>
            <div class="prob-bar-bg">
                <div style="width:{proba*100:.1f}%;height:8px;background:linear-gradient(90deg,#ef4444,#b91c1c);border-radius:999px;transition:width 0.8s ease;"></div>
            </div>
            <p style="margin-top:0.5rem;color:#555;font-size:0.8rem">Disease probability: <strong style="color:#ff6b6b">{proba*100:.1f}%</strong></p>
        </div>
        """, unsafe_allow_html=True)