#include <QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include "sailfishapplication.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(Sailfish::createApplication(argc, argv));
    QScopedPointer<QDeclarativeView> view(Sailfish::createView("qml/uradio/main.qml"));

    Sailfish::showView(view.data());

    return app->exec();
}
