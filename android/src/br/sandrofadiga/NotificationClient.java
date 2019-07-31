package br.sandrofadiga;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;

import android.content.Intent;
import android.content.Context;

import android.graphics.BitmapFactory;

import br.sandrofadiga.R;

public class NotificationClient extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static NotificationClient m_instance;

    public NotificationClient()
    {
        m_instance = this;
    }

    public static void notify(String s)
    {
        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
        }
        m_builder = new Notification.Builder(m_instance);
        m_builder.setContentTitle("Baby Whisperer");

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            m_builder.setSmallIcon(R.drawable.icon_notification);
            m_builder.setLargeIcon(BitmapFactory.decodeResource(m_instance.getResources(), R.drawable.icon));
        } else {
            m_builder.setSmallIcon(R.drawable.icon);
        }

        // make the tap on the notification bring the app up to front.
        Intent intent = new Intent(m_instance, NotificationClient.class);
        intent.setAction(Intent.ACTION_MAIN);
        intent.addCategory(Intent.CATEGORY_LAUNCHER);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent pendingIntent = PendingIntent.getActivity(m_instance, 0, intent, 0);
        m_builder.setContentIntent(pendingIntent);

        m_builder.setContentText(s);
        m_notificationManager.notify(1, m_builder.build());
    }

    public static void cancel()
    {
        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
        }
        m_notificationManager.cancelAll();
    }

}
