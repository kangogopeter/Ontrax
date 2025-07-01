package org.kangogo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "contributions")
public class Contribution {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String month;
    private Integer date;
    private String tithesType;
    private Double sadaka;
    private Double fungu;
    private Double transactions;
    private Double totals;
    private Double sTotals;
    private Double gTotals;
    private Integer reportYear;
    private Integer churchId;

    // Constructors
    public Contribution() {

    }

    public Contribution(String month, Integer date, String tithesType, Double sadaka, Double fungu, Double transactions,
                        Double totals, Double sTotals, Double gTotals, Integer reportYear, Integer churchId) {
        this.month = month;
        this.date = date;
        this.tithesType = tithesType;
        this.sadaka = sadaka;
        this.fungu = fungu;
        this.transactions = transactions;
        this.totals = totals;
        this.sTotals = sTotals;
        this.gTotals = gTotals;
        this.reportYear = reportYear;
        this.churchId = churchId;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getMonth() {
        return month;
    }
    public void setMonth(String month) {
        this.month = month;
    }
    public Integer getDate() {
        return date;
    }
    public void setDate(Integer date) {
        this.date = date;
    }
    public String getTithesType() {
        return tithesType;
    }
    public void setTithesType(String tithesType) {
        this.tithesType = tithesType;
    }
    public Double getSadaka() {
        return sadaka;
    }
    public void setSadaka(Double sadaka) {
        this.sadaka = sadaka;
    }
    public Double getFungu() {
        return fungu;
    }
    public void setFungu(Double fungu) {
        this.fungu = fungu;
    }
    public Double getTransactions() {
        return transactions;
    }
    public void setTransactions(Double transactions) {
        this.transactions = transactions;
    }
    public Double getTotals() {
        return totals;
    }
    public void setTotals(Double totals) {
        this.totals = totals;
    }
    public Double getSTotals() {
        return sTotals;
    }
    public void setSTotals(Double sTotals) {
        this.sTotals = sTotals;
    }
    public Double getGTotals() {
        return gTotals;
    }
    public void setGTotals(Double gTotals) {
        this.gTotals = gTotals;
    }
    public Integer getReportYear() {
        return reportYear;
    }
    public void setReportYear(Integer reportYear) {
        this.reportYear = reportYear;
    }
    public Integer getChurchId() {
        return churchId;
    }
    public void setChurchId(Integer churchId) {
        this.churchId = churchId;
    }

}
