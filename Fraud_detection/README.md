# Fraud Detection Prediction System

## Overview

This project is an end-to-end machine learning pipeline for detecting fraudulent financial transactions. The workflow includes:

- Exploratory Data Analysis (EDA)
- Feature Engineering
- Data Preprocessing
- Machine Learning Model Training
- Fraud Prediction using a Streamlit Web Application
- Model Serialization using Joblib

The project is implemented using Python, Scikit-learn, Pandas, Seaborn, Matplotlib, and Streamlit.

The repository contains:

- A Jupyter Notebook for data analysis and model training
- A trained fraud detection pipeline
- A Streamlit web application for real-time predictions

---

## Project Structure

```text
.
├── fraud_detection.ipynb          # Complete ML workflow and analysis
├── app.py                         # Streamlit web application
├── fraud_detection_pipeline.pkl   # Saved trained pipeline
├── AIML_Dataset.csv               # Dataset used for training
└── README.md                      # Project documentation
```

---

## Problem Statement

Financial fraud causes major losses in digital payment systems. Detecting suspicious transactions automatically can help financial institutions reduce risk and prevent fraudulent activities.

This project builds a binary classification model that predicts whether a transaction is:

- Fraudulent (`1`)
- Legitimate (`0`)

---

## Dataset Information

The dataset contains transaction-related information such as:

| Feature | Description |
|---|---|
| `type` | Transaction type |
| `amount` | Transaction amount |
| `oldbalanceOrg` | Sender balance before transaction |
| `newbalanceOrig` | Sender balance after transaction |
| `oldbalanceDest` | Receiver balance before transaction |
| `newbalanceDest` | Receiver balance after transaction |
| `isFraud` | Target label |
| `isFlaggedFraud` | Fraud flag from system |

### Target Variable

- `0` → Normal Transaction
- `1` → Fraudulent Transaction

---

## Exploratory Data Analysis (EDA)

The notebook performs extensive exploratory analysis including:

### 1. Dataset Inspection

- Shape of dataset
- Data types
- Missing value analysis
- Duplicate value analysis
- Fraud class distribution

### 2. Transaction Analysis

- Distribution of transaction types
- Fraud rate by transaction type
- Transaction amount distributions
- Fraud patterns over time
- Sender and receiver analysis

### 3. Visualization Techniques

The project uses:

- Bar plots
- Histograms
- Box plots
- Count plots
- Correlation heatmaps
- Time-based fraud trend plots

### Key Insights

- Dataset is highly imbalanced
- Fraud occurs mostly in:
  - `TRANSFER`
  - `CASH_OUT`
- Certain balance patterns strongly correlate with fraudulent behavior

---

## Feature Engineering

Additional balance-based features were created:

```python
balance_diff_Org = newbalanceOrig - oldbalanceOrg
balance_diff_Dest = newbalanceDest - oldbalanceDest
```

Irrelevant columns such as:

- `nameOrig`
- `nameDest`
- `isFlaggedFraud`

were removed during preprocessing.

---

## Machine Learning Pipeline

The project uses Scikit-learn Pipelines and ColumnTransformers.

### Preprocessing

#### Numerical Features

Standardized using:

```python
StandardScaler()
```

#### Categorical Features

Encoded using:

```python
OneHotEncoder(drop='first')
```

---

## Model Used

### Logistic Regression

```python
LogisticRegression(
    class_weight='balanced',
    max_iter=1000
)
```

### Why Logistic Regression?

- Fast and interpretable
- Effective baseline for binary classification
- Handles large datasets efficiently
- Works well with standardized numerical data

The `class_weight='balanced'` parameter helps address class imbalance.

---

## Train-Test Split

The dataset is split using:

```python
train_test_split(
    X,
    y,
    test_size=0.3,
    stratify=y
)
```

### Configuration

- Training Data: 70%
- Testing Data: 30%
- Stratified sampling preserves fraud distribution

---

## Model Evaluation

The notebook evaluates the model using:

- Classification Report
- Accuracy Score
- Confusion Matrix

### Metrics Evaluated

- Precision
- Recall
- F1-score
- Support

The confusion matrix is visualized using:

```python
ConfusionMatrixDisplay
```

---

## Model Serialization

The trained pipeline is saved using Joblib:

```python
joblib.dump(model_pipe, "fraud_detection_pipeline.pkl")
```

This enables direct deployment without retraining.

---

## Streamlit Web Application

The project includes a user-friendly Streamlit application for fraud prediction.

### Features

- Interactive transaction input form
- Real-time fraud prediction
- Fraud/Normal transaction status display
- Simple and lightweight UI

### Input Parameters

Users provide:

- Transaction Type
- Transaction Amount
- Sender Balances
- Receiver Balances

### Prediction Output

- `Likely Fraud`
- `Regular Transaction`

---

## Streamlit App Workflow

1. User enters transaction details
2. Input is converted into a Pandas DataFrame
3. Saved ML pipeline processes the data
4. Model predicts fraud probability/class
5. Result is displayed on the interface

---

## Installation

### 1. Clone Repository

```bash
git clone <repository-url>
cd <repository-folder>
```

### 2. Create Virtual Environment (Optional)

```bash
python -m venv venv
```

Activate environment:

#### Windows

```bash
venv\Scripts\activate
```

#### Linux / MacOS

```bash
source venv/bin/activate
```

---

## Required Dependencies

Install dependencies using:

```bash
pip install -r requirements.txt
```

### Main Libraries

```text
pandas
numpy
matplotlib
seaborn
scikit-learn
streamlit
joblib
```

---

## Running the Streamlit Application

Run the application using:

```bash
streamlit run app.py
```

After execution, Streamlit will provide a local URL such as:

```text
http://localhost:8501
```

Open it in your browser.

---

## Example Prediction

### Sample Input

| Feature | Value |
|---|---|
| Transaction Type | TRANSFER |
| Amount | 5000 |
| Old Sender Balance | 10000 |
| New Sender Balance | 5000 |
| Old Receiver Balance | 0 |
| New Receiver Balance | 5000 |

### Example Output

```text
Prediction: 1
Likely Fraud
```

---

## Technologies Used

### Programming Language

- Python

### Data Analysis

- Pandas
- NumPy

### Visualization

- Matplotlib
- Seaborn

### Machine Learning

- Scikit-learn

### Deployment

- Streamlit

---

## Future Improvements

Potential enhancements include:

- Using advanced models:
  - Random Forest
  - XGBoost
  - LightGBM
  - Neural Networks
- Hyperparameter tuning
- Fraud probability scoring
- Real-time API deployment
- Docker containerization
- Cloud deployment
- Handling extreme class imbalance using:
  - SMOTE
  - ADASYN

---

## Learning Outcomes

This project demonstrates:

- End-to-end ML workflow
- Practical fraud analytics
- Data preprocessing pipelines
- Feature engineering
- Binary classification
- Model deployment with Streamlit
- Pipeline serialization using Joblib

---

## File References

### Streamlit Application

The Streamlit interface implementation is available in:

- `app.py`

### Notebook

The complete workflow including EDA, preprocessing, training, evaluation, and model saving is available in:

- `fraud_detection.ipynb`

---

## Conclusion

This project provides a complete fraud detection system capable of identifying suspicious financial transactions using machine learning. The integration of preprocessing pipelines, Logistic Regression, and a Streamlit frontend makes the system practical, modular, and deployment-ready for educational and prototype-level applications.

