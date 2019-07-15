package com.example.demo.entity;

public class UnitPrice {

    private Double waterUnit;
    private Double electricUnit;


    @Override
    public String toString() {
        return "UnitPrice{" +
                "waterUnit=" + waterUnit +
                ", electricUnit=" + electricUnit +
                '}';
    }

    public Double getWaterUnit() {
        return waterUnit;
    }

    public void setWaterUnit(Double waterUnit) {
        this.waterUnit = waterUnit;
    }

    public Double getElectricUnit() {
        return electricUnit;
    }

    public void setElectricUnit(Double electricUnit) {
        this.electricUnit = electricUnit;
    }
}
