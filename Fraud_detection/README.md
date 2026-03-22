# 🔍 Financial Fraud Detection System

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square&logo=python)
![Streamlit](https://img.shields.io/badge/Streamlit-deployed-red?style=flat-square&logo=streamlit)
![scikit-learn](https://img.shields.io/badge/scikit--learn-Pipeline-orange?style=flat-square&logo=scikit-learn)
![Dataset](https://img.shields.io/badge/Dataset-German%20Credit%20Risk-yellow?style=flat-square)

A machine learning system for detecting fraudulent financial transactions using the **German Credit Risk Dataset**. The model is trained on credit applicant data and deployed as an interactive web application via **Streamlit**, enabling real-time fraud risk assessment.

---

## 📊 Model Performance

The trained pipeline achieves **94% overall accuracy** on the test set (1,908,786 samples).

| Class | Precision | Recall | F1-Score | Support |
|-------|-----------|--------|----------|---------|
| 0 (Legitimate) | 1.00 | 0.94 | 0.97 | 1,906,322 |
| 1 (Fraud) | 0.02 | 0.94 | 0.04 | 2,464 |
| **Macro Avg** | **0.51** | **0.94** | **0.51** | **1,908,786** |
| **Weighted Avg** | **1.00** | **0.94** | **0.97** | **1,908,786** |

> ⚠️ **Note on Class Imbalance:** The dataset is highly imbalanced (~0.13% fraud cases). While recall for fraud (class 1) is strong at **94%**, the low precision (0.02) indicates a high false-positive rate — a known trade-off in fraud detection where catching all fraud cases is prioritized over false alarms.

> **Confusion Matrix:**
> TP (Fraud Caught): 2,323 · TN (Legit Correct): ~1.8M · FP: 105,267 · FN: 141

---

## 📁 Project Structure

```
Fraud_detection/
│
├── app.py                              # Streamlit web application
├── fraud_detection.ipynb               # EDA, model training & evaluation notebook
├── fraud_detection_pipeline.pkl        # Serialized trained ML pipeline
├── README.md
└── .ipynb_checkpoints/                 # Jupyter auto-save checkpoints
    ├── app-checkpoint.py
    └── Untitled-checkpoint.ipynb
```

---

## 📦 Dataset

**Source:** [German Credit Risk — With Target on Kaggle](https://www.kaggle.com/datasets/kabure/german-credit-data-with-risk)

The dataset contains credit applicant records with demographic and financial attributes used to assess credit/fraud risk.

| Feature | Description |
|---------|-------------|
| `Age` | Age of the applicant |
| `Sex` | Gender of the applicant |
| `Job` | Job type (0–3, unskilled to highly skilled) |
| `Housing` | Housing status (own / free / rent) |
| `Saving accounts` | Savings account balance category |
| `Checking account` | Checking account balance category |
| `Credit amount` | Loan/credit amount requested (DM) |
| `Duration` | Duration of credit in months |
| `Purpose` | Purpose of the loan |
| `Risk` | Target label — `good` (legitimate) or `bad` (fraud/risk) |

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- pip

### Installation

1. **Clone the repository**
   ```bash
   https://github.com/KinSlay3rS/Machine-Learning-Projects.git
   cd Machine-Learning-Projects/Fraud_detection
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

4. **Download the dataset**
   Download from [Kaggle](https://www.kaggle.com/datasets/kabure/german-credit-data-with-risk) and place the file as:
   ```
   Fraud_detection/dataset/AIML_Dataset.csv
   ```

---

## 🖥️ Running the App

```bash
streamlit run app.py
```

The app will launch in your browser at `http://localhost:8501`.  
Enter applicant details (age, credit amount, duration, etc.) to get an instant fraud risk prediction with confidence score.

---

## 🔬 Notebook

The Jupyter notebook `fraud_detection.ipynb` covers the complete ML pipeline:

- Exploratory Data Analysis (EDA) — class distribution, feature correlations
- Data preprocessing — encoding, scaling, handling missing values
- Handling class imbalance — oversampling / class weighting strategies
- Model training, hyperparameter tuning, and cross-validation
- Evaluation — confusion matrix, classification report, ROC-AUC
- Exporting the full pipeline as `fraud_detection_pipeline.pkl`

To run the notebook:
```bash
jupyter notebook fraud_detection.ipynb
```

---

## 🧠 ML Pipeline Overview

```
Raw CSV → Preprocessing → Encoding → Scaling → Classifier → fraud_detection_pipeline.pkl
                                                                        ↓
                                                              Streamlit App (app.py)
```

- **Preprocessing:** Missing value imputation, categorical encoding
- **Scaling:** StandardScaler for numerical features
- **Classifier:** Trained estimator optimized for high fraud recall
- **Pipeline:** Full end-to-end `sklearn.Pipeline` serialized via `pickle`
- **Deployment:** `app.py` loads `fraud_detection_pipeline.pkl` for live inference

---

## 📋 Requirements

Get requirement.txt file from main repo(same for all ml projects)

---

## ⚠️ Imbalanced Data Notice

The dataset contains a significant class imbalance (~99.87% legitimate vs ~0.13% fraud). The model is tuned to **maximize recall for the fraud class** to minimize missed detections (false negatives), which is the primary concern in fraud detection systems. Techniques explored in the notebook include:

- `class_weight='balanced'` in the classifier
- SMOTE / RandomOverSampler from `imbalanced-learn`
- Threshold tuning on prediction probabilities

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

- [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)) — original German Credit dataset
- [Kaggle – kabure](https://www.kaggle.com/datasets/kabure/german-credit-data-with-risk) — dataset hosting
- [Streamlit](https://streamlit.io/) — web deployment framework
- [imbalanced-learn](https://imbalanced-learn.org/) — tools for handling class imbalance
