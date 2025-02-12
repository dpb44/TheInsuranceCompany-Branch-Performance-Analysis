# TheInsuranceCompany Branch Performance Analysis

## Introduction
Insurance companies rely on a well-balanced mix of new business, renewals, and cross-selling to sustain growth. This analysis evaluates the performance of a specific branch, identifying strengths, weaknesses, and opportunities for improvement. 

The study utilizes **Excel, Power Query, SQL, Power BI, and Tableau** to assess:
- Account executive performance against targets
- Brokerage and fee collections
- Invoice completion rates
- Customer engagement through recorded meetings
- Open opportunities and potential revenue generation

Through a structured ETL process and dashboard-driven insights, we present a comprehensive overview of the branch's performance and areas that require strategic intervention.

---

## Tools Used
- **Excel & Power Query** – Data extraction, transformation, and cleaning
- **SQL** – Querying and structuring raw data
- **Power BI & Tableau** – Dashboard development and visualization

---

## Key Insights

### **Performance Overview**

![image](https://github.com/user-attachments/assets/14b3f2d4-a689-4702-b48f-bdf505ce9b35)

![image](https://github.com/user-attachments/assets/8820a475-15a0-4422-be96-8efa73db822a)

![image](https://github.com/user-attachments/assets/841ca4bb-6387-4ed8-824e-4e393f37e136)

The branch exhibits strong performance in **renewals**, exceeding targets by 50%. However, **new business and cross-selling efforts fall short**, achieving only 15% and 60% of the target, respectively. This imbalance suggests a reliance on existing clients rather than acquiring new ones or maximizing cross-sell opportunities.

Invoice completion rates are also below expectations, with only 15% of cross-sell invoices, 3% of new business invoices, and 67% of renewal invoices being processed. This incomplete invoicing could lead to revenue realization issues.

Additionally, **only 75% of policies are active**, leaving 15% inactive and requiring further investigation. Among the renewal policies, **6% have lapsed**, highlighting a potential risk to customer retention.

---

### **Customer Engagement**

![image](https://github.com/user-attachments/assets/15f2b938-77fd-4a1a-a093-5ed3f556159f)

An analysis of meeting records reveals **low engagement in Q4 2019**, which may be attributed to inadequate documentation or reduced activity during the holiday season. In contrast, January 2020 experienced a sharp rise in client interactions, with **31 meetings recorded in a single month**. This shift suggests a renewed focus on engagement in the new year.

A total of 34 meetings were documented, with only three occurring in the last quarter of 2019. This trend points to a significant improvement in customer interaction in 2020.

![image](https://github.com/user-attachments/assets/8aed53b8-29d2-4d90-b18b-29ff26e18536)


**Abhinav Shivam** stands out as the top contributor, accounting for **21% of all meetings** conducted during the period.

---

### **Opportunity Analysis**

![image](https://github.com/user-attachments/assets/d62d15d2-613b-4d63-a2e8-b4157b89d089)

Despite a growing list of opportunities, **none have been closed**, indicating untapped revenue potential. From Q3 to Q4 2019, potential revenue increased by **378%**, yet 2020 witnessed a decline, with a temporary rebound in Q2 before dropping again in Q3.

![image](https://github.com/user-attachments/assets/d6f68a25-3924-459e-a44b-cb39404ff88c)

A closer look at the sales pipeline reveals **significant bottlenecks**:
- 100% of opportunities reach the **Qualify** stage.
- Only **15% progress to negotiation**.
- **Just 7% of those (1% overall) move to the final proposal stage.**

These figures highlight inefficiencies in converting leads into actual sales.

---

### **Account Executive Performance**

Certain executives have been instrumental in driving revenue:
- **Vinay** leads in both new business (38%) and cross-selling (73%).
- **Animesh** contributes 35% of renewal revenue.

When assessing target achievement, **Mark (1457%)**, Vinay (97%), and Abhinav (64%) emerge as the top performers. In terms of invoice completion, **Abhinav (65%)**, Vidit (40%), and Mark (26%) lead.

Special contributions were also observed from **Divya**, who had no set targets but still contributed **4% to overall achievement and 36% to invoicing**.

These results indicate that a handful of executives are responsible for most of the revenue, emphasizing the need to address performance gaps among the rest of the team.

---

## Challenges Identified

1. **Imbalance in business generation** – Strong renewals but weak new business and cross-selling.
2. **Incomplete invoicing** – Low invoice completion rates affecting revenue realization.
3. **Customer engagement gaps** – Low meeting frequency in Q4 2019.
4. **Declining revenue potential** – Opportunities remain open with a downward revenue trend in 2020.
5. **Inefficiencies in opportunity conversion** – Leads are not progressing effectively through the sales funnel.
6. **Performance disparities among executives** – A few individuals drive results, while others underperform.

---

## Recommendations

### **1. Strengthen New Business and Cross-Selling Strategies**
To balance growth, targeted campaigns should be introduced to encourage new client acquisition and cross-selling. This would diversify revenue sources and reduce over-reliance on renewals.

### **2. Improve Invoice Completion Rates**
Automating invoice reminders and streamlining the billing process will help close the invoicing gap, ensuring faster revenue realization.

### **3. Enhance Customer Engagement Practices**
Pre-scheduling client meetings and improving documentation practices will maintain consistency in engagement, preventing future lapses like those seen in Q4 2019.

### **4. Align Opportunities with Actual Market Demand**
There is a mismatch between the products customers purchase and those pursued by account executives. For example:
- **Most purchased policies:** Engineering (33%), Liability (21%)
- **Most pursued opportunities:** Fire (25%), Employee Benefits (25%)

![image](https://github.com/user-attachments/assets/66e195da-1726-4837-a921-31978ee4753d)

![image](https://github.com/user-attachments/assets/e7dc6f89-d0c4-4c00-810a-b4baa4d24a7a)

Refocusing sales efforts on actual customer demand will improve conversions and revenue.

### **5. Optimize the Sales Funnel for Better Conversions**
A more structured approach to advancing leads from qualification to negotiation and proposal is needed. Reducing bottlenecks at each stage will accelerate deal closures.

### **6. Provide Training and Support for Underperforming Executives**
Investing in skill development and strategic role realignment will help bridge performance gaps among account executives, ensuring a more balanced contribution across the team.

---

## Conclusion

This analysis provides data-driven insights into the branch’s performance, highlighting strengths and areas for improvement. While renewals remain a strong point, new business and cross-selling require immediate attention. Revenue realization is hindered by incomplete invoicing, and customer engagement needs to be more consistent. Additionally, opportunity management should be improved to increase conversions.

By addressing these challenges through targeted initiatives, the branch can optimize sales processes, enhance customer relationships, and drive sustainable revenue growth.

---

## Tableau Dashboard
Explore the **interactive dashboard** for deeper insights: [Tableau Public Link](https://public.tableau.com/app/profile/dimple.bathija/viz/Project_Tableau_Final_17382259775360/InsuranceDashboardFinal)  

---

## Files in Repository
- **Insurance_Branch_Analysis.pbix** → Power BI dashboard
- **Tableau_Dashboard.twbx** → Tableau dashboard
- **SQL_Queries.sql** → Queries used for data extraction & transformation
- **Insurance_Analysis.xlsx** → Excel data file analysis
- **Raw_Data/** → Folder containing raw data files
- **Cleaned_Data.xlsx** → Cleaned data file
- **Presentaion.pdf** → Powerpoint Presentation to convey insights to branch managers

**Future Scope:** Further refine strategies with deeper machine learning insights on customer behavior & sales optimization.

---

## Team Members
This project was a collaborative effort by:
- **Dimple Bathija**
- **Insha Khan**
- **Syed Ata Ur Rahman**
- **Nikitha N**
- **Shaik Mohammad Zubair**
- **Muthyala Rachana**






