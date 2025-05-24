package com.hospital.listeners;

import com.hospital.util.AppointmentStatusUpdater;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppStartupListener implements ServletContextListener {

    // Called when the application starts
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Application is starting. Scheduling appointment updates...");
        AppointmentStatusUpdater.scheduleDailyStatusUpdate();
    }

    // Called when the application shuts down
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Application is shutting down. Cancelling appointment updates...");
        AppointmentStatusUpdater.cancelUpdate();
    }
}
