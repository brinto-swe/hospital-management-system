package com.hospital.servlets;

public class Appointment {
    private int appointmentId;
    private String appointmentDate;
    private String appointmentTime;
    private String doctorId;
    private String status;

    public Appointment(int appointmentId, String appointmentDate, String appointmentTime, String doctorId, String status) {
        this.appointmentId = appointmentId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.doctorId = doctorId;
        this.status = status;
    }

    public int getAppointmentId() {
        return appointmentId;
    }
    
    public String getAppointmentDate() {
        return appointmentDate;
    }
    
    public String getAppointmentTime() {
        return appointmentTime;
    }
    
    public String getDoctorId() {
        return doctorId;
    }
    
    public String getStatus() {
        return status;
    }
}
