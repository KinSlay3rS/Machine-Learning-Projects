# 📱 SMS Spam Detection System

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square&logo=python)
![Streamlit](https://img.shields.io/badge/Streamlit-deployed-red?style=flat-square&logo=streamlit)
![scikit-learn](https://img.shields.io/badge/scikit--learn-StackingClassifier-orange?style=flat-square&logo=scikit-learn)
![NLP](https://img.shields.io/badge/NLP-TF--IDF-purple?style=flat-square)

A natural language processing (NLP) system that classifies SMS messages as **spam** or **ham (legitimate)** using TF-IDF vectorization and an ensemble **Stacking Classifier**. Eleven models were benchmarked before selecting the best ensemble strategy, deployed as an interactive web app via **Streamlit**.

---

## 📊 Model Benchmarking & Performance

Eleven classifiers were evaluated on accuracy and precision. The final deployed model uses a **Stacking Classifier** ensemble.

### 🏆 All Models — Accuracy & Precision

| Model | Accuracy | Precision |
|-------|----------|-----------|
| KNeighbors (KN) | 0.9052 | **1.0000** |
| MultinomialNB (NB) | 0.9710 | **1.0000** |
| Random Forest (RF) | 0.9739 | 0.9826 |
| SVC (Sigmoid) | 0.9758 | 0.9748 |
| Extra Trees (ETC) | 0.9749 | 0.9746 |
| Logistic Regression | 0.9555 | 0.9600 |
| XGBoost | 0.9681 | — |
| Bagging Classifier | 0.9584 | 0.8682 |
| Decision Tree | 0.9323 | 0.8333 |
| Gradient Boosting | 0.9507 | — |
| AdaBoost | 0.9217 | 0.8202 |

### 🥇 Deployed Model — Stacking Classifier

The final model stacks **SVC + MultinomialNB + ExtraTreesClassifier** with a **RandomForestClassifier** as the meta-learner.

| Metric | Score |
|--------|-------|
| **Accuracy** | **97.87%** |
| **Precision** | **93.94%** |

> **Voting Classifier** (SVC + NB + ETC) was also evaluated — Accuracy: 97.97%, Precision: 98.35% — and serves as an alternative ensemble option in the notebook.

---

## 📁 Project Structure

```
sms_spam_detection/
│
├── app.py                                          # Streamlit web application
├── sms_spam_detection.ipynb                        # EDA, NLP pipeline, model training & evaluation
├── spam.csv                                        # SMS Spam Collection Dataset
│
├── model.pkl                                       # Serialized Stacking Classifier
├── vectorizer.pkl                                  # Fitted TF-IDF Vectorizer (max_features=3000)
│
└── .ipynb_checkpoints/                             # Jupyter auto-save checkpoints
    ├── sms_spam_detection-checkpoint.ipynb
    └── app-checkpoint.py
```

---

## 📦 Dataset

**Source:** [SMS Spam Collection Dataset — Kaggle (UCI ML Repository)](https://www.kaggle.com/datasets/uciml/sms-spam-collection-dataset)

The dataset contains **5,572 SMS messages** labelled as `ham` (legitimate) or `spam`.

| Column | Description |
|--------|-------------|
| `v1` | Label — `ham` or `spam` |
| `v2` | Raw SMS message text |

> **Class distribution:** ~87% ham, ~13% spam — mildly imbalanced. Precision is prioritized as the key metric to minimize false spam flags on legitimate messages.

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- pip

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KinSlay3rS/Machine-Learning-Projects.git
   cd Machine-Learning-Projects/sms_spam_detection
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

4. **Dataset**
   The dataset `spam.csv` is already included in the repository. It is also available on [Kaggle](https://www.kaggle.com/datasets/uciml/sms-spam-collection-dataset).

---

## 🖥️ Running the App

```bash
streamlit run app.py
```

The app will launch in your browser at `http://localhost:8501`.
Paste or type any SMS message to instantly classify it as **Spam** or **Ham**.

---

## 🔬 Notebook

The Jupyter notebook `sms_spam_detection.ipynb` covers the full NLP + ML pipeline:

- **EDA** — class distribution, message length analysis, word frequency
- **Text Preprocessing** — lowercasing, tokenization, stopword removal, stemming
- **Feature Engineering** — character count, word count, sentence count features
- **Vectorization** — TF-IDF (`max_features=3000`)
- **Baseline Models** — GaussianNB, MultinomialNB, BernoulliNB comparison
- **Multi-model Benchmarking** — 11 classifiers evaluated on accuracy & precision
- **Ensemble Methods** — Voting Classifier and Stacking Classifier
- **Export** — `vectorizer.pkl` and `model.pkl` serialized via `pickle`

To run the notebook:
```bash
jupyter notebook sms_spam_detection.ipynb
```

---

## 🧠 NLP + ML Pipeline Overview

```
spam.csv (raw SMS text)
      │
      ▼
Text Preprocessing
(lowercase → tokenize → remove stopwords/punctuation → stem)
      │
      ▼
TF-IDF Vectorization (max_features=3000)  ──► vectorizer.pkl
      │
      ▼
Stacking Classifier
  ├── Base: SVC (sigmoid kernel)
  ├── Base: MultinomialNB
  ├── Base: ExtraTreesClassifier (50 estimators)
  └── Meta: RandomForestClassifier          ──► model.pkl
      │
      ▼
Streamlit App (app.py) → Real-time Spam / Ham Prediction
```

---

## 📋 Requirements

Get `requirements.txt` file from main repo(same for all ml projects)
```

> **Note:** After installing `nltk`, download required corpora once:
> ```python
> import nltk
> nltk.download('punkt')
> nltk.download('stopwords')
```

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

- [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/SMS+Spam+Collection) — original SMS Spam Collection dataset
- [Kaggle — uciml](https://www.kaggle.com/datasets/uciml/sms-spam-collection-dataset) — dataset hosting
- [scikit-learn](https://scikit-learn.org/) — ML models and ensemble methods
- [NLTK](https://www.nltk.org/) — natural language preprocessing toolkit
- [Streamlit](https://streamlit.io/) — web deployment framework
