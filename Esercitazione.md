
![[Pasted image 20241107154003.png|550]]

a)   L'evento $E$ rappresenta l'estrazione dell'asso di denari da un mazzo di $40$ carte. In questo caso, $p = P(E) = 1/40$. Poiché l'evento viene ripetuto per $N = 37$ volte, la probabilità che il numero di successi sia uguale a $j$ è uguale a 

$$
B_{N,\ p}\ (j) = B\ _{37, 1/40}\ (j) = \binom{37}{j} \cdot \left(\dfrac{1}{40}\right)^j \cdot \left(1-\dfrac{1}{40}\right)^{37-j}
$$

b) L'evento $E$ rappresenta l'estrazione di un asso da un mazzo di $39$ carte. In questo caso, $p = P(E) = 4/39$. Poiché l'evento viene ripetuto per $N = 29$ volte, la probabilità che il numero di successi sia uguale a $z$ è uguale a 

$$B_{N,\ p}\ (z) = B\ _{29, 4/39}(z) = \binom{29}{z} \cdot \left( \dfrac{4}{39} \right)^z \cdot \left( 1 - \dfrac{4}{39} \right)^{29-z}$$

c) L'evento $E$ rappresenta il risultato testa lanciando se si lancia una moneta. In questo caso, $p = P(E) = 1/2$. Poiché l'evento viene ripetuto per $N$ volte, la probabilità che il numero di successi sia uguale a $i$ è uguale a 

$$B_{N,\ p}(i) = B_{N,\ 1/2} (i) = \binom{N}{i} \cdot \left(\dfrac{1}{2}\right)^i \cdot \left(1- \dfrac{1}{2}\right)^{N-i}$$

d) Il flusso medio di persone che transitano in una stazione è di $7500$ persone al giorno. Di conseguenza, mediamente passano $\lambda = 7500 \cdot 4 = 30.000$ persone in $4$ giorni. La probabilità che ne transitino $27500$ è quindi data da

$$P_{\lambda}(k) = P\ _{30.000} (27500) = \dfrac{e^{-30.000} \cdot 30.000^{27500}}{27500!}$$ 

**Nota.** Si ricordi che la distribuzione di Poisson viene spesso utilizzata per modellare il numero di eventi in un intervallo di tempo, dato un tasso medio di occorrenza $\lambda$

Seguendo un discorso analogo, mediamente passano $\lambda = 7500 \cdot 3 = 22500$ persone in $3$ giorni. La probabilità che ne transitino $17500$ è quindi data da

$$P_{\lambda}(k) = P\ _{22500} (17500) = \dfrac{e^{-22500} \cdot 22500^{17500}}{17500!}$$

e) La quantità media di chiamate è di $52$ ogni $60$ minuti, quindi, facendo la proporzione, $\lambda = 39$. La probabilità di ricevere $31$ chiamate è quindi data da 

$$P_{\lambda}(k)=P_{39}(31)=\dfrac{e^{-39} \cdot 39^{31}}{31!}$$


---

![[Pasted image 20241107162909.png|500]]

a) Data una variabile aleatoria binomiale $X$, il suo valore medio $E[X]$ è definito come 

$$E[X] = n\cdot p$$
Quindi:

- Se $p=0.1$, $E[X] = 10 \cdot 0.1 = 1$
- Se $p=0.15$, $E[X] = 10 \cdot 0.15 = 1.5$
- Se $p=0.23$, $E[X] = 10 \cdot 0.23 = 2.3$
- Se $p=0.41$, $E[X] = 10 \cdot 0.41 = 4.1$

b) Data una variabile aleatoria binomiale $X$, la sua varianza $\operatorname{Var}(X)$ è definita come 

$$
\operatorname{Var}(X) = n p (1 - p).
$$

Quindi:

- Se $p=0.1$, $\operatorname{Var}(X)= 10 \cdot 0.1 \cdot(1-0.1) = 0.9$
- Se $p=0.15$, $\operatorname{Var}(X) = 10 \cdot 0.15 \cdot(1-0.15) = 1.275$
- Se $p=0.23$, $\operatorname{Var}(X) = 10 \cdot 0.23 \cdot(1-0.23) = 1.771$
- Se $p=0.41$, $\operatorname{Var}(X) = 10 \cdot 0.41 \cdot(1-0.41) = 2.419$

---

![[Pasted image 20241107172040.png|550]]

a) $B_{40, 1/39}(k)$
b) $B_{40, 30/39}(k)$
c) $P_{48}(k)$
d) $\sum_{s_=0}^k\ P_{20}(s)$
e) $\sum_{s=0}^{6} B_{10, 1/2}(s)$  e $1 - \sum_{s=7}^{10} B_{10, 1/2}(s)$

---

![[Pasted image 20241107173917.png|550]]

a) $E[X^4] = \int_{-10}^{70}\ x^4 \cdot f(x) dx$
b) $E[X^2] = \int_{-10}^{70}\ x^2 \cdot f(x) dx$
c) $P(X < 0)=\int_{-10}^{0} f(x)dx$
d) $P(X < -12) = 0$
e) $P\left(X > \dfrac{5 \pi}{120}\right) = \int_{\dfrac{5 \pi}{120}}^{70} f(x)dx$ 
f) $P( -5 < X < 111)=\int_{-5}^{70} f(x)dx$
g) $P( 0 \le X \le 110 )=\int_{0}^{70} f(x)dx$ 
h) $P( -3 \le X \le 30)=\int_{-3}^{30} f(x)dx$
i) $P(X > 30)=\int_{30}^{70} f(x)dx$

---

![[Pasted image 20241107185234.png|500]]

Se $P = 0.8$ e $p = 0.2$:

a) **Sequenza Padre-Maestro-Padre (P-M-P)**

Le probabilità di vincere le combinazioni che soddisfano la condizione (almeno 2 vittorie consecutive) sono:

- Vittoria in tutte e tre le partite, data da $P \times p \times P$ 
- Vittoria nelle prime due partite, data da $P \times p \times (1 - P)$
- Vittoria nelle ultime due partite, data da $(1 - P) \times p \times P$

**Nota.** I casi possibili sono definiti come *eventi somma* (and logico)

A questo punto, è possibile calcolare la **probabilità totale** come somma di queste possibilità 

$$P(PMP) = P^2p + 2Pp(1 - P) = (0.8)^2 \times 0.2 + 2 \times 0.8 \times 0.2 \times (1 - 0.8) = 0.192$$

**Nota.** La probabilità totale è definita come *evento prodotto* (or logico)

b) **Sequenza Maestro-Padre-Maestro (M-P-M)**

Le probabilità di vincere le combinazioni favorevoli sono:

- Vittoria in tutte e tre le partite, data da $p \times P \times p$
- Vittoria nelle prime due partite, data da $p \times P \times (1 - p)$
- Vittoria nelle ultime due partite, data da $(1 - p) \times P \times p$

A questo punto, è possibile calcolare la **probabilità totale** come somma di queste possibilità 

$$P(MPM) = p^2P + 2Pp(1 - p) = (0.2)^2 \times 0.8 + 2 \times 0.8 \times 0.2 \times (1 - 0.2) = 0.288$$

Quindi, scegliendo la sequenza Maestro-Padre-Maestro, il figlio ha una probabilità più alta di vincere la sfida.

---

![[Pasted image 20241107185432.png|550]]

Le ore al martedì possono essere disposte in $\binom{5}{3} = 10$ modi possibili. Tuttavia, se indichiamo con $X$ il numero di ore di matematica al martedì, possiamo dedurre che:

a) $X = 0$ è impossibile

b) Si ha $X=1$ in $\binom{3}{1} = 3$ modi possibili, mentre le due ore rimanenti possono essere estratte in $\binom{2}{2} = 1$ modi possibili. Quindi, il numero totale di possibili combinazioni è uguale a $3\cdot 1 = 3$.

c) Si ha $X=2$ in $\binom{3}{2} = 3$  modi possibili, mentre l'ultima ora può essere estratta in $\binom{2}{1} = 2$ modi possibili. Quindi,  il numero totale di possibili combinazioni è uguale a $3\cdot 2 = 6$.

d) Si ha $X=3$ in $\binom{3}{3} = 1$ modi possibili. 

**Nota.** Moltiplichiamo gli eventi perché le scelte di assegnare le ore di Matematica al martedì e al giovedì sono **indipendenti**. Ogni possibile assegnazione delle ore al martedì può essere combinata con ogni possibile assegnazione delle ore rimanenti al giovedì. Applicando il **principio di enumerazione**, il numero totale di combinazioni si ottiene moltiplicando il numero di modi in cui possiamo assegnare le ore in ciascun giorno. Questo ci permette di enumerare tutte le possibili configurazioni senza tralasciarne nessuna.

A questo punto, è possibile calcolare la probabilità di $X = 0, \dots, 3$ utilizzando il rapporto fra i casi favorevoli e i casi possibili, quindi:

$P(X=0) = 0$
$P(X=1) = 3/10= 0.3$
$P(X=2) = 6/10 = 0.6$
$P(X=3) = 1/10 = 0.1$

---

![[Pasted image 20241107185449.png|550]]

Se $E$ rappresenta l'evento "Marco riceve un panino al salame" e $F$ quello "Paolo riceve un panino al formaggio", allora, per la definizione classica di probabilità
$$P(E) = 15/25 = 0.6$$ e
$$P(F) = 10/25 = 0.4$$

---

![[Pasted image 20241107185510.png|550]]

Se $X_A$ e $X_B$ sono variabili aleatorie binomiali che rappresentano il numero di risposte corrette date da $A$ e $B$, allora:

a) sapendo che la prova è superata se $X \ge 12$, la probabilità che $A$ venga promosso è data da  

$$P(X_A\ge12) = \sum_{k=12}^{20} B_{20, 0.9}(k) = \sum_{k=12}^{20} \binom{20}{k} \times (0.9)^k \times (0.1)^{20 - k}$$

mentre la probabilità che $B$ superi la prova è data da  

$$P(X_B\ge12) = \sum_{k=12}^{20} B_{20, 0.5}(k) = \sum_{k=12}^{20} \binom{20}{k} \times (0.5)^k \times (0.5)^{20 - k}$$
b) poiché ogni domanda può contribuire con $+0.5$ o $-0.5$ punti, il punteggio varia tra $-10$ e $+10$. 

Quindi, la relazione tra il numero di risposte corrette $X$ e il punteggio totale $S$ è 

$S = 0.5 \cdot \text{risposte corrette} - 0.5 \cdot \text{risposte sbagliate} = 0.5X - 0.5 \cdot (20-X) =$
$=0.5X - 10 + 0.5X =X - 10$

A questo punto, occorre imporre $S \ge 6$, e quindi $(X-10) \ge 6 \rightarrow X \ge 16$. A questo punto, la probabilità che $A$ venga promosso è data da  

$$P(X_A\ge16) = \sum_{k=16}^{20} B_{20, 0.9}(k) = \sum_{k=16}^{20} \binom{20}{k} \times (0.9)^k \times (0.1)^{20 - k}$$

mentre la probabilità che $B$ superi la prova è data da

$$P(X_B\ge16) = \sum_{k=16}^{20} B_{20, 0.5}(k) = \sum_{k=16}^{20} \binom{20}{k} \times (0.5)^k \times (0.5)^{20 - k}$$