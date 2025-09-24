# retail-rfm-churn-sql
# Online Sales — RFM, LTV i Churn Analysis

## 🎯 Problem biznesowy
Firma prowadząca marketplace zauważa spadającą retencję klientów.  
Celem analizy jest:
- Segmentacja klientów (RFM scoring),
- Obliczenie wartości klienta (LTV, ARPU),
- Identyfikacja klientów zagrożonych odejściem (churn),
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
 Kolumna `Date` była w formacie TEXT → przekonwertowana na DATE (`sale_date`) przy użyciu STR_TO_DATE.
 Wszystkie rekordy zostały poprawnie skonwertowane (format: YYYY-MM-DD).

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

## 📈 Wyniki (do uzupełnienia po analizie)
- Churn rate: **…%**  
- Najbardziej wartościowy segment: **R…F…M…** → **…% klientów, …% przychodu**  
- ARPU: **…**  
- LTV: **…**  

---

## 💡 Rekomendacje
- Kampania retencyjna dla segmentów o wysokim churn.  
- Personalizacja oferty dla top segmentów (R4F4M4).  
- Ograniczenie rabatów dla produktów niskomarżowych.  

---
