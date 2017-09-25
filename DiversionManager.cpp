#include <gtk/gtk.h>
#include <glib.h>
#include "DiversionService.h"

#define UI_FILE "glade/diverter.glade"

static const char *const appid = "me.daltenty.pdivert";

static void
activate(GtkApplication *app,
         gpointer user_data) {
    GtkBuilder *builder;
    GError     *error = NULL;
    GtkDialog *installDialog;
    DiversionService service;



    /* Create new GtkBuilder object */
    builder = gtk_builder_new();



    if( ! gtk_builder_add_from_file( builder, UI_FILE, &error ) )
    {
        g_warning( "%s", error->message );
        g_free( error );
        gtk_main_quit();
    }

    if (!service.isInstalled()){
       installDialog = GTK_DIALOG(gtk_builder_get_object(builder, "installDialog"));

        gtk_builder_connect_signals(builder, NULL);

        gint result = gtk_dialog_run (installDialog);
    }
    g_object_unref(builder);
}

int
main(int argc, char **argv) {

    GApplication *app;
    GtkStatusIcon *icon;


    /* Init GTK+ */
    gtk_init( &argc, &argv );


    int status;
    app = g_application_new(appid,
                              G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, "activate",
                     G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(app);

    return (status);
}