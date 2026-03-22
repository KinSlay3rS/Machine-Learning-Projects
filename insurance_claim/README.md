# 🏥 Insurance Claim Prediction System

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square&logo=python)
![Streamlit](https://img.shields.io/badge/Streamlit-deployed-red?style=flat-square&logo=streamlit)
![XGBoost](https://img.shields.io/badge/XGBoost-Best%20Model-brightgreen?style=flat-square)
![scikit-learn](https://img.shields.io/badge/scikit--learn-Pipeline-orange?style=flat-square&logo=scikit-learn)

A machine learning regression system that predicts **insurance claim amounts** for policyholders based on demographic and health attributes. Five models were benchmarked, with **XGBoost** achieving the best performance (R² = 0.80). The system is deployed as an interactive web app via **Streamlit**.

---

## 📊 Model Comparison & Performance

Five regression models were trained and evaluated. **XGBoost** was selected as the best model based on R² score.

| Model | R² Score | MAE | RMSE |
|-------|----------|-----|------|
| 🥇 **XGBoost Model** | **0.8037** | **4,057.80** | **5,452.56** |
| 🥈 Random Forest Model | 0.8016 | 4,105.63 | 5,482.27 |
| 🥉 Polynomial Regression (deg=2) | 0.7762 | 4,292.81 | 5,822.03 |
| Linear Regression Model | 0.7194 | 4,787.72 | 6,518.71 |
| Support Vector Model | 0.5305 | 5,652.07 | 8,432.49 |

> **Best Model: XGBoost** — selected automatically via `results_df['R2'].max()` in the notebook. The fitted model is serialized and loaded by the Streamlit app for inference.

---

## 📁 Project Structure

```
insurance_claim/
│
├── app.py                                      # Streamlit web application
├── insurance_claim.ipynb                       # EDA, model training & evaluation notebook
│
├── data_set/
│   └── insurance/
│       └── insurance.csv                       # Insurance dataset
│
├── label_encoder_gender.pkl                    # Fitted LabelEncoder for gender
├── label_encoder_smoker.pkl                    # Fitted LabelEncoder for smoker status
├── label_encoder_diabetic.pkl                  # Fitted LabelEncoder for diabetic status
├── scaler.pkl                                  # Fitted feature scaler
│
└── .ipynb_checkpoints/                         # Jupyter auto-save checkpoints
    ├── insurance_claim-checkpoint.ipynb
    └── app-checkpoint.py
```

---

## 📦 Dataset

**Source:** [InsuranceData — Onurbltc on GitHub](https://github.com/Onurbltc/InsuranceData)

The dataset contains policyholder records with health and lifestyle features used to predict annual insurance claim amounts.

| Feature | Type | Description |
|---------|------|-------------|
| `age` | Numerical | Age of the policyholder |
| `gender` | Categorical | Gender (male / female) |
| `bmi` | Numerical | Body Mass Index |
| `bloodpressure` | Numerical | Blood pressure level |
| `diabetic` | Categorical | Diabetic status (Yes / No) |
| `children` | Numerical | Number of dependents |
| `smoker` | Categorical | Smoker status (Yes / No) |
| `region` | Categorical | Residential region |
| `claim` | Numerical | 🎯 Target — insurance claim amount (USD) |

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- pip

### Installation

1. **Clone the repository**
   ```bash
   https://github.com/KinSlay3rS/Machine-Learning-Projects/tree/main/insurance_claim
   cd insurance_claim
   ```

2. **Create a virtual environment (recommended)**
   ```bash
   python -m venv venv
   source venv/bin/activate        # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Get the dataset**
   The dataset is available at [github.com/Onurbltc/InsuranceData](https://github.com/Onurbltc/InsuranceData).
   Place it at:
   ```
   insurance_claim/data_set/insurance/insurance.csv
   ```

---

## 🖥️ Running the App

```bash
streamlit run app.py
```

The app will launch in your browser at `http://localhost:8501`.
Input policyholder details — age, BMI, smoker status, etc. — to receive an **estimated insurance claim amount** instantly.

---

## 🔬 Notebook

The Jupyter notebook `insurance_claim.ipynb` walks through the complete pipeline:

- **EDA** — distributions, correlation heatmaps, outlier analysis
- **Preprocessing** — label encoding for categorical features, feature scaling
- **Model Training** — Linear Regression, Polynomial Regression, SVR, Random Forest, XGBoost
- **Evaluation** — R², MAE, RMSE comparison across all models
- **Best Model Selection** — automated via `results_df['R2'].max()`
- **Export** — saving encoders (`label_encoder_*.pkl`), scaler (`scaler.pkl`), and best model

To run the notebook:
```bash
jupyter notebook insurance_claim.ipynb
```

---

## 🧠 ML Pipeline Overview

```
insurance.csv
      │
      ▼
Preprocessing (Label Encoding + Scaling)
      │
      ├── label_encoder_gender.pkl
      ├── label_encoder_smoker.pkl
      ├── label_encoder_diabetic.pkl
      └── scaler.pkl
      │
      ▼
Model Training & Comparison
(Linear Reg → Polynomial Reg → SVR → Random Forest → XGBoost)
      │
      ▼
Best Model: XGBoost (R² = 0.8037)
      │
      ▼
Streamlit App (app.py) → Real-time Claim Prediction
```

- **Encoding:** Separate `LabelEncoder` instances per categorical column, each serialized individually
- **Scaling:** Numerical features normalized via fitted `StandardScaler`
- **Inference:** `app.py` loads all `.pkl` artifacts and transforms inputs before prediction

---

## 📋 Requirements

Get `requirement.txt` file from main repo(same for all ml projects)
---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request.

1. Fork the project
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add your feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 🙏 Acknowledgements

- [Onurbltc](https://github.com/Onurbltc/InsuranceData) — dataset source
- [XGBoost](https://xgboost.readthedocs.io/) — gradient boosting framework
- [Streamlit](https://streamlit.io/) — web deployment framework
- [scikit-learn](https://scikit-learn.org/) — ML utilities and baseline models
