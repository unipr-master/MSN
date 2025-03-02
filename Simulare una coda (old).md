L'obiettivo è descrivere l'evoluzione di una coda. Per prima cosa, occorre definire un modello per una coda, che può essere schematizzato come segue: 

Immaginiamo di erogare un servizio. Una sola persona alla volta può essere servita, mentre quelle altre in attesa vengono organizzate in una coda. 

Ogni volta che una persona cerca di accedere al servizio, bisogna verificare quante persone sono già in coda e se un'altra persona è attualmente servita, al fine di decidere se servire direttamente la persona arrivata oppure aggiungerla in fondo alla coda.

**Nota.** Ovviamente, questo modello non è affatto generale. Potremmo, ad esempio, avere più code concorrenti, più "sportelli" che servono la coda, ecc.

Per categorizzare la coda occorre definire:

1. Con che probabilità arrivano nuove persone?
2. Assumendo che il tempo per essere serviti sia dato da una distribuzione di probabilità: quale distribuzione utilizzare?

Assumendo che i clienti arrivino in accordo a un processo di Poisson: 

$P[\text{arrivi in tempo } T=k] = e^{-\lambda T} \dfrac{(\lambda T^)K}{k!}$

Assumendo poi che il tempo di servizio sia dato da una variabile aleatoria, con 

$P(S_n \leq x) = B(x)$

dove $S_n$ rappresenta il tempo in cui è servito il cliente $n-$esimo. 

A questo punto, possiamo costruire un processo di Markov registrando i tempi in cui i vari clienti lasciano la coda (ovvero, quando vengono serviti) e chiamiamo $Q_n$ il numero di clienti (lunghezza della coda) dopo la $n-$esima partenza.

Che strategia usare per la simulazione?  Un modo di procedere può essere questo:

Mantenete traccia dei **tempi** a cui si verificano gli eventi significativi, che sono:

- $t_a$ : tempo del prossimo **arrivo**
- $t_s$ : tempo del prossimo completamento di **servizio**
- $T$ : tempo a cui si **interrompe** la simulazione

Ora, il tempo del **prossimo evento** è:  $t_e = \min(t_s, t_a, T)$. Allora: 

**MAIN STEP.**

2. Vai avanti, ovvero poni $t = t_e$
3. Se $t_e = t_a$, vai all'**ARRIVAL STEP**.
4. Se $t_e = t_s$, vai al **SERVICE STEP**.
5. Se $t_e = T$, la simulazione si interrompe.

**ARRIVAL STEP.**

1. Genera il tempo mancante al prossimo arrivo, $a$
2. Poni $t_a = t + a$
3. Se la coda è **vuota** e **nessuno** è servito, tocca al nuovo arrivato essere servito. Fai in modo di generare il tempo di servizio $s$ e poni $t_s = t + s$
4. In caso contrario, **allunga la coda**.
5. Vai al **MAIN STEP**.

**SERVICE STEP.**

1. Se non c'è nessuno in coda, poni $t_s = \infty$.
2. Se c'è qualcuno in coda, diminuisci di $1$ la coda e genera $s$. Poni $t_s = t + s$.
3. Vai al **MAIN STEP**.

## Generare dati in accordo a una data distribuzione di probabilità

Data una densità di probabilità $f(x)$ tale che:

- $f(x) \geq 0$
- $\int_{-\infty}^{+\infty} f(x) \ dx = 1$ _(normalizzazione)_

**Nota.** Gli estremi saranno i più "ridondanti". Strettamente parlando, questo include $\int_{a}^{b} f(x) \ dx = 1$ se $X$ assume valori su $[a,b]$ e $f(x) = 0$ per $x \notin [a,b]$ 

Ricordiamo che siamo partiti dalla **funzione di distribuzione** $F(x)$: $F(x) = P(X \leq x) = \int_{-\infty}^x f(y)\ dy$

**Nota.** $F(x)$ è **crescente**, quindi $F$ è invertibile, cioè: $y = F(x) \iff x = F^{-1}(y)$.

Per generare dati:

1. Genera $\varepsilon = \text{rand}$  (Stiamo parlando di un metodo che estrae $y$ piatto in $[0, 1]$)
2. Calcola $X = F^{-1}(y)$

In questo modo, $X$ risulta distribuito in accordo a $f(x)$.

**Nota.** Non è sempre possibile determinare $F^{-1}(y)$ in modo analitico.  In questi casi, si può usare un approccio numerico.

È interessante osservare che, per generare i tempi di intercorrenza degli arrivi nella coda, possiamo risolvere il problema seguendo il procedimento esposto.
## Distribuzione dei tempi fra arrivi successivi in coda

In quanto segue presentiamo un modo alternativo alla distribuzione Poissoniana per modellare l'arrivo di nuove persone. Sebbene questo approccio sia corretto, è comunque utile avere un punto di vista alternativo, basato sulla soluzione di una equazione differenziale.

Abbiamo visto che per simulare la coda ci serve estrarre i tempi con cui si verificano gli arrivi (meglio simulare arrivi di processi che vanno ad alimentare la coda). Come abbiamo visto, questo è da noi sempre calcolato come:  
$t_a = t + \Delta t$

- $t_a$: tempo del prossimo arrivo
- $t$: tempo corrente
- $\Delta t$: tempo mancante al prossimo arrivo

In sostanza, mi chiedo: se da un certo momento mi metto ad attendere, come sono distribuiti i tempi di attesa del prossimo evento?

Ragioniamo così: per prima cosa determiniamo la probabilità di nessun arrivo nel tempo $t$.  Siccome la densità di arrivi è costante (cfr. Poissoniana con  $P(k \text{ arrivi in tempo } t) = e^{-\lambda t} \dfrac{(\lambda t)^k}{k!}$,  dove $\lambda$ rappresenta la densità di arrivo)

$P(1 \text{ arrivo in } \Delta t) = \lambda \Delta t$  
$P(\text{nessun arrivo in } \Delta t) = 1 - \lambda \Delta t$

Allora, se $P_0(t)$ è la probabilità di nessun arrivo in $t$, sarà

$P_0(t + \Delta t) = P_0(t)(1 - \lambda \Delta t)$  

ovvero

$P_0(t + \Delta t) = \text{ probabilità di nessun arrivo in } t + \Delta t$ ,  ed è il prodotto della $P_0(t) = \text{ probabilità di nessun arrivo in } t$ e di $(1 - \lambda \Delta t) = \text{ probabilità di nessun arrivo in } \Delta t$. 

Svolgendo i calcoli, otteniamo che $P_0(t) = e^{-\lambda t}$. Questo risultato, che rappresenta la probabilità di nessun arrivo al tempo $t$, viene direttamente dal valutare la distribuzione di Poisson per zero arrivi. 

Da questo risultato deduciamo che $P(a > t) = e^{-\lambda t} = P_0(t)$

Questo implica che $P(a \leq t) = 1 - e^{-\lambda t}$

La **densità di probabilità** sarà dunque data da $f(x) = \lambda e^{-\lambda x}$. Questa è dunque la distribuzione che ci serve per estrarre gli $a = \text{tempi mancanti al prossimo arrivo}$. 

**Nota.**  Anche per i **tempi di servizio**, possiamo ragionevolmente assumere che 

$P(S_n \leq x) = B(x) = 1 - e^{-\mu x}$

Cioè $B(x)$ è la probabilità che il tempo di servizio del cliente $n-$esimo ($S_n$) sia minore di $x$.

**Nota.** Si noti che anche i **tempi di intercorrenza** $Z_n$, definiti come $Z_n = t_n - t_{n-1}$, dove $t_n$: tempo a cui si verifica l'$n-$esimo evento (poissoniano generico), soddisfano

$P(Z_n \leq x) = 1 - e^{-\lambda x}$

## La matrice stocastica per la coda

Per prima cosa abbiamo scritto una _**equazione per la evoluzione della lunghezza della coda**_. Da questa è risultato molto facile ricavare la forma della _**matrice stocastica** che descrive la coda_. Abbiamo notato come questa _matrice risulti finita nel caso sia presente una sala di attesa_. Rimarchiamo ancora una volta che questo comporta che la distribuzione stazionaria esisterà sicuramente. Viceversa, non saremo garantiti della esistenza della distribuzione stazionaria nel caso di assenza di sala di attesa (e conseguente natura infinito dimensionale dello spazio delle configurazioni della coda). La matrice risulta definita da una forma assolutamente regolare, con ogni entrata che ha il significato di _probabilità che durante un dato servizio il numero di arrivi sia pari a un valore fissato_. Nel caso di presenza di sala di attesa e tempo di servizio costante, il problema è completamente risolto: possiamo "darlo in pasto a Matlab" e calcolare esplicitamente la distribuzione stazionaria. È quello che abbiamo fatto, verificando che proprio a questa distribuzione di probabilità convergevano le frequenze dei nostri esperimenti numerici. Ovviamente, abbiamo visto come questa distribuzione sia diversa al variare dei parametri del problema (densità degli arrivi, tempi di servizio, per ora preso costante, numero di posti in sala di attesa). Esplicitamente, abbiamo potuto calcolare numericamente la _distribuzione stazionaria_ e da essa la _lunghezza media della coda all'equilibrio_. Parliamo di calcolo numerico, ma si tratta di una valutazione numerica che poggia direttamente sulla teoria dei processi stocastici, che ci assicura che (a) la distribuzione stazionaria esiste e che (b) questa è data dall'autovettore corrispondente all'autovalore 1 della matrice stocastica (convenientemente normalizzato).

Abbiamo, come più volte detto, inizialmente ristretto le simulazioni al caso di presenza di una sala di attesa. È però ovvio che il codice poteva essere (ed è stato) scritto facilmente (lo abbiamo fatto) per simulare la coda anche in **assenza di sala di attesa** (basta rimuovere una singola condizione). Avendo dunque a disposizione uno strumento per condurre esperimenti nel caso generale, abbiamo subito notato che in certi casi si trova una distribuzione stazionaria, in altri la lunghezza della coda diverge. Intuitivamente, la situazione è chiara: se arrivano in media più persone di quante riusciamo a servire, la lunghezza della coda si allungherà indefinitamente! Il caso in cui in media arrivino in un tempo di servizio tante persone quante riusciamo a servirne si è subito mostrato come caso limite, individuando un _valore di soglia_ a partire dal quale il problema si manifesta mal condizionato: non si raggiunge una condizione di equilibrio!

Abbiamo convenuto che la nostra scelta per il **parametro** che **identifica la configurazione** della coda sia:

$Q_n = \text{lunghezza della coda al completamento del servizio m-esimo}$.

**Nota.** La **lunghezza** (quante persone sono in coda) è un buon parametro per identificare la configurazione, ma questa osservazione è insufficiente fino a quando non si stabilisce **quando misurare** la lunghezza!

Ad esempio, possiamo assumere il **punto di vista dello sportello**: si misura quando è lunga la coda ogni volta se si è pronti a servire un nuovo cliente. In particolare:

**Caso (a).** Sala di attesa con $N$ poltrone. e **configurazioni possibili** sono $N+1$:  $Q_n = 0, 1, 2, ..., N$

**Caso (b).** Non c'è sala di attesa. Tutti gli interi $\geq 0$ sono accettabili: $Q_n = 1, 2, 3, ..., \infty$

Il caso **(a)** corrisponde a uno **spazio delle configurazioni** di **dimensione finita** (pari a $N+1$): siamo **sicuro** dell'**esistenza di una distribuzione stazionaria**.

Il caso **(b)** corrisponde a uno spazio delle configurazioni di **dimensione infinita**, e la **distribuzione stazionaria potrebbe non esistere** (esperienza comune: la coda potrebbe allungarsi indefinitamente!).

**Domanda.** Come sono legate $Q_n$ e $Q_{n+1}$?

Possiamo dare un'equazione di evoluzione di $Q_n$, precisamente:

Escludiamo il momento $Q_n = 0$ e diciamo che

Per $Q_n > 0$ :

$Q_{n+1} = Q_n - 1 + X_{n+1}$

dove:

$X_n = \text{numero di arrivi durante il completamento del servizio n-esimo}$

Infatti:

- **La coda si accorcia di 1** per il fatto che un cliente (il $(n+1)-$esimo) è stato invitato a lasciare la coda e quindi servito ($Q_n - 1$)
- **La coda si allunga** per effetto delle persone che si aggiungono, mentre l'$(n+1)-$esimo cliente viene servito ($X_n$)

In generale, definendo (**funzione di Heaviside**)

$H(Q) = \begin{cases} 0 & Q \leq 0 \\ 1 & Q > 0 \end{cases}$

otteniamo

$Q_{n+1} = Q_n - H(Q_n) + X_{n+1}$

Qual'è la probabilità che $X_n = j$ ovvero che siano $j$ (numero generico) gli arrivi durante il servizio $n-$esimo?

Per rispondere, devo specificare la distribuzione di probabilità dei tempi di servizio

Sia $S_n = \text{durata del servizio n-esimo}$ 

Definiamo

$B(x) = P(S_m < x) \quad \text{(funzione di distribuzione)}$

con

$B'(x) = \frac{d}{dx}B(x) \quad \text{(densità di probabilità)}$ 

e

$B'(x)dx = dB(x) \quad \text{(probabilità che \( S_m \) assuma un valore in \([x, x+dx]\)}$

**Attenzione.** Ricordiamo che, essendo la variabile aleatoria $S_m$ continua, $P(S_m = x) = 0$
Posso però pensare alla probabilità infinitesima $dB(x)$

Vale quindi 

$K_j = P(X_n = j) = \int_0^\infty e^{-\lambda t} \dfrac{(\lambda t)^j}{j!} dB(t)$.

Infatti: devo sommare (integrare da $\int_0^\infty$) le probabilità (infinitesime) prodotto $P_{H}(j) \cdot dB(t)$, su tutti i valori possibili (positivi) di $t$ , dove $P_H(j)$ rappresenta la probabilità di $j$ arrivi nel tempo $t$, $\lambda$ la densità di arrivi e $dB(t) = B'(t) dt$  la probabilità (infinitesima) che $S_m$ valga $t$

Si noti che le entrate della matrice stocastica $W$ possono essere espressione in funzione di $K_j$. Infatti $W_{ij} = P(i \leftarrow j)$ dove, tanto $i$ quanto $j$, valgono $0, 1, 2, \dots$

Ora, per $j = 0$ (prima colonna), se $Q_n=0$, allora $Q_{n+1} = X_{n+1}$ 

Ma allora $W_{i,0} = P(i \leftarrow 0) = P(X_{n+1} = Q_{n+1} = i) =P(X_{n+1}=i)=K_i$

e dunque la prima colonna è $K_0, K_1, \dots$

Viceversa per $Q_m \neq 0$, ovvero $j \neq 0$ (le colonne dalla seconda in avanti) sarà

$W_{ij} = P(i \leftarrow j) = P(i = Q_{n+1} \leftarrow j = Q_n) = P(X_{n+1} = i - j + 1)$

Tale probabilità vale

$W_{ij} = P(X_{n+1} = i - j + 1) = \begin{cases} 0 & \text{se } i + 1 - j < 0 \\ K_{i-j+1} & \text{se } i - j + 1 \geq 0 \end{cases}$

Le $K_s$ con $s < 0$ non sono infatti definite, poiché non può arrivare un numero negativo di persone. A conti fatti, questo comporta per $W$ 

$\begin{pmatrix} j = 0 & j = 1 & j = 2 & j = 3 & j = 4 & \dots \\ i = 0 & K_0 & K_0 & 0 & 0 & 0 & \dots \\ i = 1 & K_1 & K_1 & K_0 & 0 & 0 & \dots \\ i = 2 & K_2 & K_2 & K_1 & K_0 & 0 & \dots \\ i = 3 & K_3 & K_3 & K_2 & K_1 & K_0 & \dots \\ i = 4 & K_4 & K_4 & K_3 & K_2 & K_1 & \dots \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \ddots \end{pmatrix} = W.$


e il problema sarà determinare se esiste $\Pi$ tale che $W \Pi = \Pi$. dove $\Pi$ rappresenta una distribuzione stazionaria, ovvero l'autovettore di $W$ corrispondente all'autovalore $1$.

Nel caso in cui ci sia una sala d'attesa con $N$ posti, il massimo valore di $Q_m = N$ mi dice che avrò una matrice quadrata di dimensione $N+1$, di conseguenza:

$\begin{pmatrix} K_0 & K_0 & 0 & 0 & \dots \\ K_1 & K_1 & K_0 & 0 & \dots \\ K_2 & K_2 & K_1 & K_0 & \dots \\ \vdots & \vdots & \vdots & \vdots & \ddots \\ K_{N-1} & K_{N-1} & K_{N-2} & K_{N-3} & \dots \\ 1 - \sum_{i=0}^{N-1} K_i & 1 - \sum_{i=0}^{N-1} K_i & 1 - \sum_{i=0}^{N-2} K_i & 1 - \sum_{i=0}^{N-3} K_i & \dots \end{pmatrix} = W.$

Dove (**attenzione**) l'ultima riga è fissata da$\sum_i W_{ij} = 1 \, \forall \, j$

Il caso più semplice è quello in cui:

- c'è sala di attesa;
- il tempo di servizio è $S_m = s = \text{costante}$.

In questo caso

$K_j = P(X_n = j) = P_{s\lambda}(j) = e^{-\lambda s} \dfrac{(\lambda s)^j}{j!}$   

la poissoniana mi dice tutto e la matrice $W$ è interamente esprimibile in forma chiusa (in matlab $K_j = \text{poisspdf( \( j\), \(\lambda s\) )}$)  
