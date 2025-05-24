package com.hospital.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Timer;
import java.util.TimerTask;

public class AppointmentStatusUpdater {
    private static Timer timer;

    // Schedule the task during application startup
    public static void scheduleDailyStatusUpdate() {
        timer = new Timer(true); // Daemon thread
        TimerTask updateTask = new TimerTask() {
            @Override
            public void run() {
                updateAppointmentsToDone();
            }
        };
        // Schedule to run every hour; adjust as needed.
        long delay = 0; 
        long period = 60 * 60 * 1000; // 1 hour in milliseconds
        timer.scheduleAtFixedRate(updateTask, delay, period);
        System.out.println("AppointmentStatusUpdater scheduled.");
    }
    
    // Optional: Cancel the timer (on shutdown)
    public static void cancelUpdate() {
        if (timer != null) {
            timer.cancel();
            System.out.println("AppointmentStatusUpdater canceled.");
        }
    }
    
    // Update 'pending' appointments for today if their appointment time has passed
    private static void updateAppointmentsToDone() {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE APPOINTMENTS SET STATUS = 'done' " +
                         "WHERE APPOINTMENT_DATE = CURRENT_DATE " +
                         "  AND STATUS = 'pending' " +
                         "  AND APPOINTMENT_TIME < CURRENT_TIME";
            ps = con.prepareStatement(sql);
            int updated = ps.executeUpdate();
            System.out.println("Auto-updated " + updated + " appointments to 'done'.");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) try { ps.close(); } catch(Exception ex){}
            if (con != null) try { con.close(); } catch(Exception ex){}
        }
    }
}
