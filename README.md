# sql-ecommerce-analysis

### Podstawowa analiza sprzedaży w SQL
Jest to projekt, w którym przeanalizowałem dane dużego sklepu internetowego. Skupiłem się na tym, żeby wyciągnąć konkretne wnioski o zyskach i stratach, a nie tylko stworzyć tabelki.

---

### **Co zrobiłem w tym projekcie?**

* **Porządek z datami:** Naprawiłem format dat za pomocą `STR_TO_DATE`, żeby móc liczyć wyniki kwartalne.
* **Segmentacja (CTE):** Użyłem `WITH` i `CASE WHEN`, żeby podzielić zamówienia na małe, średnie i duże – dzięki temu kod jest dużo czytelniejszy.
* **Analiza zysków:** Znalazłem miasta, które generują straty i sprawdziłem, jak wysokie rabaty wpływają na finalny profit.
* **Rankingi:** Wyciągnąłem topowych klientów i sprawdziłem, który region/stan radzi sobie najlepiej.

---

### **Kilka wniosków z danych:**

* **Nowy Jork jest liderem:** Mimo mniejszej liczby zamówień niż w Kalifornii, średnia wartość koszyka jest tam wyższa, zaś zysk bardzo zbliżony.
* **Rabaty:** Dane pokazują, że w niektórych kategoriach (np. meble) duże zniżki sprawiają, że sprzedaż rośnie, ale zysk znika.
* **Sezonowość:** Ostatni kwartał roku (Q4) to zawsze największy ruch, ale marża jest tam niższa przez promocje.

---

**Kod:** Wszystkie zapytania z moimi komentarzami znajdziesz w pliku `ProjektAnalizaSuperstore.sql`.
