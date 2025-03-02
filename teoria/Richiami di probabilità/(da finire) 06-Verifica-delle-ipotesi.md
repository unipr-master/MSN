# Verifica delle ipotesi

---
**Indice**
```table-of-contents
```
---

Supponiamo, ancora una volta, di disporre di un campione aleatorio proveniente da una distribuzione che ci è nota tranne che per uno o più parametri incogniti. La nuova chiave di lettura non prevede più di stimare direttamente questi parametri, ma piuttosto di utilizzare il campione raccolto, per verificare qualche ipotesi che li coinvolga.

Un'**ipotesi statistica** è normalmente un'affermazione su uno o più parametri della distribuzione di popolazione. Ovviamente, si parla di ipotesi perché a priori non sappiamo determinare se i valori di un campione aleatorio e l'ipotesi fatta siano compatibili oppure no.

**Nota.** Quando accettiamo (o rifiutiamo) un'ipotesi, non stiamo affermando che essa sia necessariamente vera (o falsa), ma soli che i dati raccolti sono accettabilmente in accordo (o in disaccordo) con essa.
## Livelli di significatività

Data una popolazione avente distribuzione $F_\theta$ che dipende da un parametro incognito $\theta$, supponiamo di voler verificare una qualche ipotesi su $\theta$, che chiameremo **ipotesi nulla**, e denoteremo con $H_0$. 

Se $F_\theta$ è una distribuzione normale con media $\theta$ e varianza $1$, due possibili ipotesi nulle su $\theta$ sono:

1. $H_0 : \theta = 1$
2. $H_0 : \theta \le 1$

La prima di queste ipotesi afferma che la popolazione ha distribuzione $\mathcal{N}(1,1)$, mentre la seconda sostiene che essa è normale, con varianza $1$ e media non superiore a $1$. 

Si noti che l'ipotesi nulla $1$, quando è vera, caratterizza completamente la distribuzione della popolazione, mentre questo non è vero per l'ipotesi nulla $2$. Nel primo caso si parla allora di ipotesi **semplice**, mentre nel secondo si parla di ipotesi **composta**.

Supponiamo di disporre di un campione aleatorio $X_1, \dots, X_n$, proveniente da questa popolazione, e di volerlo utilizzare per eseguire una verifica (o **test**) di una certa ipotesi nulla $H_0$. Siccome bisogna decidere se accettare o meno $H_0$ basandosi esclusivamente sugli $n$ valori dei dati, il test sarà definito da una regione $C$ nello spazio a $n$ dimensioni, con l'intesa che se il vettore $(X_1, \dots, X_n)$ cade all'interno di $C$ l'ipotesi viene rifiutata, mentre viene accattata in caso contrario.  Una regione $C$ con queste caratteristiche viene detta **regione critica** del test. Schematizzando quanto detto, il **test statistico** determinato dalla regione critica $C$ è quello che accetta $H_0$ se $(X_1, \dots, X_n) \notin C$ e rifiuta $H_0$ se $(X_1, \dots, X_n) \in C$.

Quando si effettua un test statistico, il risultato può essere sbagliato in due modi differenti: si ha un errore **di prima specie** quando i dati portano a rifiutare un'ipotesi $H_0$ che in realtà è corretta, mentre si commette un errore **di seconda specie** quando si accetta un'ipotesi $H_0$ che in realtà è falsa.

Occorre ricordare che l'obiettivo di una verifica di $H_0$ non è quello di determinare se $H_0$ sia vera o falsa, ma piuttosto di determinare se l'ipotesi fatta sia compatibile con i dati raccolti. Per questo motivo, spesso vi è un ampio livello di tolleranza nell'accettare $H_0$, mentre per rifiutarla occorre che i dati raccolti siano molto improbabili quando $H_0$ è soddisfatta.

Questo bilanciamento si ottiene specificando un valore $\alpha$, detto **livello di significatività**, e imponendo che il test abbia la proprietà che quando l'ipotesi $H_0$ è vera, la probabilità che venga rifiutata non possa superare $\alpha$.

In altre parole, un test con un livello di significatività $\alpha$ deve avere una probabilità di errore di prima specie minore o uguale ad $\alpha$.

## Verifica di ipotesi sulla media di una popolazione normale

Dato un campione aleatorio $X_1, \dots, X_n$ proveniente da una popolazione normale di parametri $\mu$ e $\sigma^2$, con varianza nota e media incognita. Fissata una costante $\mu_0$, si deve verificare l'ipotesi nulla $H_0 : \mu = \mu_0$ , contro l'ipotesi alternativa $H_1: \mu \neq \mu_0$.

Siccome $\bar{X}= \frac{1}{n} \cdot \sum_{i=1}^n X_i$ è lo stimatore puntuale naturale per $\mu$, sembra ragionevole accettare $H_0$ quando $\bar{X}$ non è troppo lontano da $\mu_0$. Perciò, la regione critica del test sarà del tipo

$C := \{(X_1, \dots, X_n) : |\bar{X} - \mu_0| > c\}$

per una opportuna scelta della costante $c$. Per far si che il test abbia livello di significatività $\alpha$, occorre individuare quel valore di $c$ che rende pari ad $\alpha$ la probabilità di errore di prima specie. In pratica 

$\alpha = P(\text{errore di I° specie}) = P_{\mu_0}(|\bar{X} - \mu_0| > c)$  

dove $P_{\mu_0}$ indica che la probabilità viene calcolata assumendo $\mu=\mu_0$. 

Se $\mu = \mu_0$, allora $\bar{X}$ ha distribuzione normale con media $\mu_0$ e varianza $\sigma^2/n$, e quindi se $Z$ denota una variabile aleatoria $\mathcal{N}(0,1)$, allora

$\dfrac{\bar{X} - \mu_0}{\sigma/\sqrt{n}} \sim^{\mu_0} Z$

dove la relazione $\sim$ è condizionata all'ipotesi $H_0 : \mu = \mu_0$. Possiamo allora riscrivere l'equazione precedente come

$\alpha = P_{\mu_0}\left(\dfrac{\bar{X} - \mu_0}{\sigma/\sqrt{n}} > \dfrac{c\sqrt{n}}{\sigma}\right)$

 $= P\left(|Z| > \dfrac{c\sqrt{n}}{\sigma}\right)$

$= 2P\left(Z > \dfrac{c\sqrt{n}}{\sigma}\right)$

e quindi $P\left(Z > \dfrac{c\sqrt{n}}{\sigma}\right) = \alpha/2$ 

Siccome, per definizione di $z_{\alpha/2}$ vale

 $P\left(Z > z_{\alpha/2}\right) = \alpha/2$ 

si deduce che 

$\dfrac{c\sqrt{n}}{\sigma} = z_{\alpha/2}$

e quindi 

$c = z_{\alpha/2} \cdot \dfrac{\sigma}{\sqrt{n}}$

Il test di significatività $\alpha$ dovrà allora rifiutare $H_0$ se $|\bar{X} -\mu_0| > \left(z_{\alpha/2} \cdot  \dfrac{\sigma}{\sqrt{n}}\right)$. In altre parole, si rifiuta $H_0$ se $\left|\dfrac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}\right| > z_{\alpha/2}$ , altrimenti si accetta $H_0$. 

**Nota.** La regione di accettazione per la statistica del test è un intervallo simmetrico rispetto allo zero 

---

**Esempio importante.**


---

