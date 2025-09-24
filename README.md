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

---

## ✅ Quality checks
- Liczba rekordów: **[tu wstaw wynik COUNT]**  
- Duplikaty Transaction ID: **[np. brak / X rekordów]**  
- Braki (NULL): **[np. 12 w Unit Price, 5 w Date]**  
- Revenue niespójne: **[np. 23 rekordy]**  
- Zakresy wartości:  
  - Units Sold: **min = …, max = …**  
  - Unit Price: **min = …, max = …**  
  - Total Revenue: **min = …, max = …**  
- Kategorie produktów: **[tu wstaw listę DISTINCT Product Category]**  
- Metody płatności: **[tu wstaw listę DISTINCT Payment Method]**

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
