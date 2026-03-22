# 🫀 Heart Disease Detection

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square&logo=python)
![Streamlit](https://img.shields.io/badge/Streamlit-deployed-red?style=flat-square&logo=streamlit)
![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange?style=flat-square&logo=scikit-learn)

A machine learning web application that predicts the likelihood of heart disease in patients based on clinical features from the **UCI Heart Disease Dataset**. Built with scikit-learn and deployed interactively via **Streamlit**.

---

## 📊 Model Performance

The trained model achieves **81% overall accuracy** on the test set.

| Class | Precision | Recall | F1-Score | Support |
|-------|-----------|--------|----------|---------|
| 0 (No Disease) | 0.82 | 0.73 | 0.77 | 82 |
| 1 (Disease) | 0.80 | 0.87 | 0.84 | 102 |
| **Weighted Avg** | **0.81** | **0.81** | **0.81** | **184** |

> **Confusion Matrix:**  
> TP: 89 · TN: 60 · FP: 22 · FN: 13

---

## 📁 Project Structure

```
heart_disease_detection/
│
├── app.py                          # Streamlit web application
├── heart-disease-detection.ipynb   # EDA, model training & evaluation notebook
├── model.pkl                       # Serialized trained ML model
└── data/                           # Dataset directory
    └── heart_disease_uci.csv       # UCI Heart Disease Dataset
```

---

## 📦 Dataset

**Source:** [UCI Heart Disease Dataset on Kaggle](https://www.kaggle.com/datasets/redwankarimsony/heart-disease-data)

The dataset contains **303 patient records** with **14 clinical features**:

| Feature | Description |
|---------|-------------|
| `age` | Age of the patient |
| `sex` | Sex (1 = male, 0 = female) |
| `cp` | Chest pain type (0–3) |
| `trestbps` | Resting blood pressure (mm Hg) |
| `chol` | Serum cholesterol (mg/dl) |
| `fbs` | Fasting blood sugar > 120 mg/dl (1 = true) |
| `restecg` | Resting ECG results (0–2) |
| `thalach` | Maximum heart rate achieved |
| `exang` | Exercise-induced angina (1 = yes) |
| `oldpeak` | ST depression induced by exercise |
| `slope` | Slope of peak exercise ST segment |
| `ca` | Number of major vessels (0–3) |
| `thal` | Thalassemia type |
| `target` | Diagnosis (1 = disease, 0 = no disease) |

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- pip

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KinSlay3rS/Machine-Learning-Projects.git
   cd Machine-Learning-Projects/heart_disease_detection
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
   Download from [Kaggle](https://www.kaggle.com/datasets/redwankarimsony/heart-disease-data) and place the CSV file inside the `data/` folder.

---

## 🖥️ Running the App

```bash
streamlit run app.py
```

The app will open in your browser at `http://localhost:8501`.

---

## 🔬 Notebook

The Jupyter notebook `heart-disease-detection.ipynb` covers the full ML pipeline:

- Exploratory Data Analysis (EDA) & visualizations
- Data preprocessing and feature engineering
- Model selection, training, and cross-validation
- Evaluation — accuracy, confusion matrix, classification report
- Saving the trained model as `model.pkl`

To run the notebook:
```bash
jupyter notebook heart-disease-detection.ipynb
```

---

## 🧠 ML Pipeline Overview

```
Raw Data → Preprocessing → Feature Selection → Model Training → Evaluation → Deployment
```

- **Preprocessing:** Handling missing values, encoding categoricals, feature scaling
- **Model:** Trained classifier (e.g., Logistic Regression / Random Forest / SVM)
- **Serialization:** Model saved with `pickle` → `model.pkl`
- **Deployment:** Streamlit app loads `model.pkl` and serves real-time predictions

---

## 📋 Requirements

Get requirement.txt file from parent folder(same requirements for all ml project)

---

## 📸 App Preview

> Launch the app with `streamlit run app.py` and input patient clinical values to receive an instant prediction with probability score.

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

- [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Heart+Disease) — original dataset source
- [Kaggle – redwankarimsony](https://www.kaggle.com/datasets/redwankarimsony/heart-disease-data) — dataset hosting
- [Streamlit](https://streamlit.io/) — for the easy-to-use web deployment framework
