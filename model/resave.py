# resave_model.py
import pickle
from model import Sentiment_Analysis

# Load the existing pickle (works locally)
with open('model.pkl', 'rb') as f:
    old_model = pickle.load(f)

# Create a new instance with the same trained data
new_model = Sentiment_Analysis(alpha=old_model.alpha)
new_model.Vocabulary = old_model.Vocabulary
new_model.Class_Probability = old_model.Class_Probability
new_model.Class = old_model.Class  # Copy class mappings
new_model.StopWords = old_model.StopWords  # Copy stopwords
# Note: spaCy’s nlp object doesn’t need to be copied—it’s reloaded in __init__

# Save with the correct module path
with open('model.pkl', 'wb') as f:
    pickle.dump(new_model, f)

print("Model re-saved successfully!")