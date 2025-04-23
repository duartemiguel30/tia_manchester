import pandas as pd
from sklearn.tree import DecisionTreeClassifier, _tree

# Carrega dataset
df = pd.read_csv('casos_simulados_com_diagr', encoding='utf-8')

# Prepara X (features) e y (labels)
X = df.drop(columns=['class']).copy()
for col in X.columns:
    X[col] = X[col].map({'sim': 1, 'nao': 0, 'regular': 0, 'serpentino': 1}).fillna(0)
y = df['class']

# Treina a Árvore de Decisão
clf = DecisionTreeClassifier(max_depth=5, min_samples_leaf=5)
clf.fit(X, y)

# Função para converter árvore em regras Prolog
def tree_to_prolog(tree, feature_names, class_names):
    tree_ = tree.tree_
    rules = []

    def recurse(node, conds):
        if tree_.feature[node] != _tree.TREE_UNDEFINED:
            name = feature_names[tree_.feature[node]]
            threshold = tree_.threshold[node]
            # Se a feature <= threshold, significa 'nao'
            recurse(tree_.children_left[node], conds + [f"\\+ fact({name}, sim)"])
            # Se > threshold, significa 'sim'
            recurse(tree_.children_right[node], conds + [f"fact({name}, sim)"])
        else:
            vals = tree_.value[node][0]
            idx = vals.argmax()
            cls = class_names[idx]
            rules.append((conds, cls))

    recurse(0, [])
    return rules

# Geração das regras Prolog e escrita em arquivo
rules = tree_to_prolog(clf, list(X.columns), clf.classes_)
with open('rules_auto.pl', 'w', encoding='utf-8') as f:
    f.write('% Regras geradas automaticamente\n')
    for conds, cls in rules:
        cond_str = ' , '.join(conds) if conds else 'true'
        f.write(f"if({cond_str}) then {cls}:1.0.\n")

print("rules_auto.pl gerado com sucesso no formato Prolog.")
