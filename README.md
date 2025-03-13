# Tema 2 Metode Numerice 

## Elaborat de:

Balaniuc Rodion 315CB

## Task 1 - Numerical Music

### Functia stereo_to_mono 
* Intrari: o matrice `stereo` Nx2, coloanele careia reprezinta partea dreapta si stanga.
* Iesiri: Un vetor `mono` normalizat Nx1, care reprezinta un audio semnal mono.
* Pentru aceasta functie am aplicat calculul mediei pentru cele doua canale stang si drept, si am normalizat semnalul mono ca sa asigure ca valorile sunt intre [-1, 1].

### Functia stereo_to_mono 
* Intrari: `signal`, `fs` - rata, `window_size`.
* Iesiri: Matricea spectogramei `S`, fiecare coloana reprezentand spectrul de frecvente pentru un `window`, vectorul `f` de frecvente pentru spectrograma si `t` vectorul de timp pentru spectograma.
* Se calculeaza lungimea semnalului si numarul de ferestre. Initializam matricea spectogramei `S` cu zerouri. pentru fiecare fereastra se aplica fucntia Hann si se calculeaza transformata Fourier. Se calculeaza `f` si `t` vectorii coloana de frecventa si timp.

### Functia oscilator 
* Intrari: `freq` frecventa semnalului, `fs` rata, `dur` durata, `A` attack, `D` decay, `S` sustain, `R`release.
* Iesiri: `x` semnal modificat de ADSR.
* Se creeaza un vector `t` cu sample-uri de la 0 la `dur` cu pasul `1/fs`. Din semnalul `x` se genereaza un semnal de `freq`. Pentru fiecare faza a envelopei se calculeaza numarul de esantioane, se creaza envelopele pentru fiecare faza si se concatineaza pentru a crea `final envelope`, aplicandu-se pentru semnalul `x`.

### Functia low_pass filter 
* Intrari: `signal`, `fs`, `cutoff_freq`.
* Iesiri: `filtered_signal`.
* Se calculeaza Transformata Fourier a semnalului cu `fft`. Se creaza o masca ce fiind aplicata filtreaza frecventele mai mici si frecventele mai mari decat frecventa de taiere. Se aplica pordusul Hadamard intre TF si frecventa de taiere. Se aplica inversa Fourier si se face normalizarea semnalului filtrat pentru a avea o amplitudinea maxima egala cu 1.

### Functia apply_reverb 
* Intrari: `signal`, `impulse_response`.
* Iesiri: `reverberated_signal`.
* Se asigura convertirea semanlului la mono cu fucntia `stereo_to_mono`. Se aplica convolutia semnalului si raspunsul folosinf functia `fftconv`. Se normalizeaza semnalul reverberat pentru amplitudine maxima egala cu 1.

## Task 2 - Robotzii 

### Functia parse_data 
* Intrari: `filename`.
* Iesiri: `x`, `y`.
* Se deschide fisier cu ajutorul functiei `fopen` si se citesc cu `fscanf`, `n`, `x`, `y`, si se inchide fisierul.

### Functia spline_c2 
* Intrari: `x` si `y`.
* Iesiri: `coef`.
* Functia `spline_c2` calculeaza coeficintii spline-ului cubic care trece prin punctele date `(x,y)` prin rezolvarea sistemului liniar obtinandu-se coeficientii cubici `c`. Acesti coeficienti sunt returnati sub forma de vector `coef`, fiecare 4 elemente fiind coeficientii pentru un segment de spline.

### Functia p_spline 
* Intrari: `coef`, `x`, `x_interp`.
* Iesiri: `y_interp`.
* Cu ajutorul acestei fucntii am calculat valorile polinomiale folosind spline-urile cubice date de lungimea vectorului `x_interp`, returnand vector coloana `y_interp`.

### Functia vandermonde 
* Intrari: `x` si `y`.
* Iesiri: `coef`.
* Prin metodei Vandermonde se calculeaza coeficientii polinomului de interpolare. In functie se contruieste matricea pentru vectorul `x` folosind functia `vander` si inversata utilizand `fliplr`. Se rezolva sistemul `V * coef = y` si se returneaza coeficientul.

### Functia P_vandermonde 
* Intrari: `coef`, `x_interp`.
* Iesiri: `y_interp`.
* In aceasta functie se calculeaza valorile polinomiale folosind coeficientii polinomului de la metode Vandermonde pentru punctele `x_interp`. Vectorul `y_interp` se initializeaza cu aceeasi lungime ca si la `x_interp`. Se afla valorile folosind coeficientii polinomului 
prin parcurgerea tuturor punctelor din vectorul `x_interp`. Fiecare coeficient al polinomului`coef(j)` este inmultit cu puterea a pucntului `x_interp(i)`.

## Task 3 - Recommendations

### Functia preprocess
* Intrari: `mat`, `min_reviews`.
* Iesiri: `reduced_mat`.
* Se identifica utilizatorii valizi care au cel putin `min_reviews`, aplicand filtrul ce marcheaza randurile mai mare sau egal cu `min_reviews`. Se retin doar randurile matricei `mat` care corespund utilizatorilor valizi gasiti.

### Functia cosine_similarity
* Intrări: `A`, `B`.
* Iesiri: `similarity`.
* Produs scalar dintre doi vectori cu functia `dot`. Calculul normei cu ajutorul fucntiei `norm`. Calculul similaritatii cosinului utilizand formula: `similarity = dot_AB / (norm_A * norm_B)`.

### Functia recommendations
* Intrari: `path`, `liked_theme`, `num_recoms`, `min_reviews`, `num_features`.
* Iesiri: `recoms`.
* Incarcarea matricei se face cu ajutorul functiei `read_mat`. Preprocesarea matricei se face chemand functia `preprocess`. Se calculeaza SVD a matricei cu fucntia `svds`. Se returneaza `recoms` pentru primele `num_recoms` teme recomandate.






