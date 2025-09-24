# retail-rfm-churn-sql
# Online Sales — RFM, LTV i Churn Analysis

## 🎯 Problem biznesowy
Firma prowadząca marketplace zauważa spadającą retencję klientów.  
Celem analizy jest:
- Segmentacja klientów (RFM scoring), - ⚠️ ⚠️ Uwaga: dataset nie zawiera kolumny Customer ID. Każdy wiersz to pojedyncza transakcja (Transaction ID). Dlatego klasyczna analiza RFM klientów nie jest możliwa. 
Zamiast tego przeprowadzono analizę wartości transakcji i segmentację przychodów.
- Analiza trendu sprzedazy w czasie,
- Obliczenie wartości klienta (LTV, ARPU),
- Przygotowanie rekomendacji biznesowych.

---

## 📊 Dane
**Tabela:** `onlinesalesdata`  
**Kolumny:**
- Transaction ID — unikalny identyfikator transakcji  
- Date — data zakupu (TEXT → przekonwertowana na DATE)  
- Product Category — kategoria produktu  
- Product Name — nazwa produktu  
- Units Sold — liczba sprzedanych sztuk  
- Unit Price — cena jednostkowa  
- Total Revenue — przychód (Units Sold × Unit Price)  
- Region — region sprzedaży  
- Payment Method — metoda płatności
  
 ! Kolumna `Date` była w formacie TEXT → przekonwertowana na DATE (`sale_date`) przy użyciu STR_TO_DATE.
 Wszystkie rekordy zostały poprawnie skonwertowane (format: YYYY-MM-DD) !

---

## ✅ Quality checks
- Liczba rekordów: **240**  
- Duplikaty Transaction ID: **brak, wartosci unikalne**  
- Braki (NULL): **0**  
- Revenue niespójne: **9 niespójnych rekordów**  
- Zakresy wartości:  
  - Units Sold: **min = 1, max = 10**  
  - Unit Price: **min = 6.5, max = 3899.99**  
  - Total Revenue: **min = 6.5, max = 3899.99**  
- Kategorie produktów: **Electronics, Home Appliances, Clothing, Books, Beauty Products, Sports**  
- Metody płatności: **Credit Card, PayPal, Debit Card**

---

## 🔧 Metody analizy
1. **RFM scoring** — podział klientów wg recency, frequency, monetary (NTILE 4).  
2. **LTV i ARPU** — średnia wartość klienta i przychód na użytkownika.  
3. **Churn** — definicja: brak zakupu > 60 dni.  
4. **Segmentacja churn** — churn rate w poszczególnych segmentach RFM.  

---

## 📈 Wyniki 
- Analiza trendu sprzedazy w czasie :
Liczba transakcji miesięcznie utrzymywała się na podobnym poziomie (27–31).

Przychód w pierwszych 4 miesiącach (styczeń–kwiecień) wynosił średnio ~12–14,5k.

Od maja nastąpił spadek przychodów do poziomu 6,7–8,4k, mimo podobnej liczby transakcji.

### Wniosek
Spadek przychodów nie wynika ze spadku liczby transakcji, ale z niższej wartości pojedynczych zakupów.  
Firma powinna przeanalizować, czy:
klienci wybierają tańsze produkty (np. przesunięcie z Electronics → Books/Clothing),  

pojawiły się promocje/obniżki cen,  

zmieniła się struktura koszyka zakupowego.

  
- Analiza wartości transakcji:
  Transakcje zostały podzielone na 4 segmenty wg wartości (NTILE 4).
  Wyniki:
  - Quartile 1 (najwyższe transakcje): 60 transakcji (25%), generuje 69% przychodu
  - Quartile 2: 60 transakcji (25%), generuje 19,7% przychodu
  - Quartile 3: 60 transakcji (25%), generuje 8,6% przychodu
  - Quartile 4 (najniższe transakcje): 60 transakcji (25%), generuje 2,65% przychodu
  Wniosek:
Najbardziej wartościowe 25% transakcji odpowiada za prawie 70% przychodu.  
Oznacza to, że firma powinna skoncentrować działania (np. promocje, obsługę premium) na transakcjach wysokiej wartości, bo to one napędzają biznes.
  
  Kategorie produktów w segmentach wartości:

-W Q1 (najwyższe transakcje) dominują: Electronics, Home Appliances

-W Q4 (najniższe transakcje) dominują: Clothing, Sports
  
- ARPU: **…**  
- LTV: **…**  

---

## 💡 Rekomendacje
- Kampania retencyjna dla segmentów o wysokim churn.  
- Personalizacja oferty dla top segmentów (R4F4M4).  
- Ograniczenie rabatów dla produktów niskomarżowych.  

---
