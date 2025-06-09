# 1. Elementi di probabilità

---
**Indice**

---

## Spazio degli esiti ed eventi

Consideriamo un esperimento il cui esito è casuale. L'insieme di tutti i possibili esiti si chiama **spazio degli esiti** e si indica con $S$. I sottoinsiemi di $S$ sono chiamati **eventi** e si denotano tipicamente con lettere maiuscole come $E$ o $F$. Se l'esito dell'esperimento appartiene a $E$, si dice che l'evento $E$ si è verificato.

Siano $E$ e $F$ due eventi:

- L'**unione** di $E$ e $F$, indicata con $E \cup F$, è l'insieme degli esiti che appartengono a $E$ **oppure** a $F$ (o a entrambi). L'evento $E \cup F$ si verifica se **almeno uno** tra $E$ e $F$ si verifica.

- L'**intersezione** di $E$ e $F$, indicata con $E \cap F$, è l'insieme degli esiti che appartengono **sia a** $E$ **che a** $F$. L'evento $E \cap F$ si verifica se **entrambi** gli eventi $E$ e $F$ si verificano.

**Nota:** Se $E \cap F = \emptyset$, allora i due eventi non possono verificarsi contemporaneamente e si dicono **mutuamente esclusivi** o **incompatibili**.

**Nota:** Se tutti gli esiti di $E$ appartengono anche a $F$, si dice che $E$ è **contenuto** in $F$ e si indica con $E \subseteq F$.

## Assiomi della probabilità

A ogni evento $E$ nello spazio degli esiti $S$ è associato un numero, indicato con $P(E)$, chiamato **probabilità** di $E$, che rappresenta la "plausibilità" che $E$ si verifichi.

Gli assiomi fondamentali della probabilità sono:

1. **Non negatività:** $0 \leq P(E) \leq 1$ per ogni evento $E$.

2. **Normalizzazione:** $P(S) = 1$, cioè l'evento certo ha probabilità 1.

3. **Additività:** Se $E_1, E_2, \dots, E_n$ sono eventi **mutuamente esclusivi** (cioè $E_i \cap E_j = \emptyset$ per $i \neq j$), allora:
   $$
   P\left( \bigcup_{i=1}^n E_i \right) = \sum_{i=1}^n P(E_i).
   $$

**Nota:** Per ogni evento $E \subseteq S$, l'**evento complementare** $E^c$ (l'insieme degli esiti che non appartengono a $E$) ha probabilità $P(E^c) = 1 - P(E)$.

Per due eventi qualsiasi $E$ e $F$, vale la **formula dell'unione**:
$$
P(E \cup F) = P(E) + P(F) - P(E \cap F).
$$

## Spazi degli esiti equiprobabili

Se ogni esito di $S$ ha la stessa probabilità di verificarsi, lo spazio degli esiti si dice **equiprobabile**. In questo caso, la probabilità di un evento $E$ è data dal rapporto tra il numero di esiti favorevoli (gli esiti in $E$) e il numero totale di esiti possibili:
$$
P(E) = \dfrac{|E|}{|S|},
$$
dove $|E|$ e $|S|$ indicano la cardinalità (il numero di elementi) degli insiemi $E$ e $S$.

**Principio di Enumerazione:** Se due esperimenti $A$ e $B$ hanno rispettivamente $m$ e $n$ esiti possibili, allora il numero totale di esiti possibili quando si eseguono **contemporaneamente** i due esperimenti è $m \times n$. Questo principio si estende a più esperimenti.

Una **permutazione** è un modo di ordinare un insieme di oggetti. Il numero totale di permutazioni di $n$ oggetti distinti è $n!$ (fattoriale di $n$).

#### Coefficiente binomiale

Il **coefficiente binomiale** $\binom{n}{k}$ rappresenta il numero di modi in cui si possono scegliere $k$ elementi da un insieme di $n$ elementi, indipendentemente dall'ordine (combinazioni). È calcolato con la formula:
$$
\binom{n}{k} = \dfrac{n!}{k! (n - k)!}.
$$

## Probabilità condizionata

La **probabilità condizionata** di un evento $E$ dato che un altro evento $F$ si è verificato, indicata con $P(E \mid F)$, è definita come:
$$
P(E \mid F) = \dfrac{P(E \cap F)}{P(F)},
$$
purché $P(F) > 0$. Questa misura rappresenta la probabilità che si verifichi $E$ sapendo che $F$ è accaduto.

## Fattorizzazione di un evento e teorema di Bayes

Siano $E$ e $F$ due eventi con $P(F) > 0$. Possiamo scomporre $E$ in:
$$
E = (E \cap F) \cup (E \cap F^c).
$$
Poiché $(E \cap F)$ e $(E \cap F^c)$ sono eventi mutuamente esclusivi, si ha:
$$
P(E) = P(E \cap F) + P(E \cap F^c).
$$
Utilizzando la definizione di probabilità condizionata, otteniamo il **teorema delle probabilità totali**:
$$
P(E) = P(E \mid F) \cdot P(F) + P(E \mid F^c) \cdot P(F^c).
$$

Il **teorema di Bayes** consente di invertire le probabilità condizionate:
$$
P(F \mid E) = \dfrac{P(E \mid F) \cdot P(F)}{P(E)},
$$
dove $P(E)$ è calcolato come sopra.

## Eventi indipendenti

Due eventi $E$ e $F$ si dicono **indipendenti** se il verificarsi di uno non influenza la probabilità dell'altro. Formalmente, $E$ e $F$ sono indipendenti se:
$$
P(E \cap F) = P(E) \cdot P(F).
$$
In questo caso, la probabilità condizionata di $E$ dato $F$ è uguale a $P(E)$:
$$
P(E \mid F) = P(E).
$$
Se questa condizione non è soddisfatta, gli eventi si dicono **dipendenti**.