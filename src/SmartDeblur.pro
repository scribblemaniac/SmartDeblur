#-------------------------------------------------
#
# Project created by QtCreator 2012-05-19T18:47:06
#
#-------------------------------------------------

QT       += core gui network xml
greaterThan(QT_MAJOR_VERSION, 4) {
	QT += widgets
}
TARGET = SmartDeblur
TEMPLATE = app


SOURCES += main.cpp\
        MainWindow.cpp \
    DeconvolutionTool.cpp \
    WorkerThread.cpp \
    ImageUtils.cpp \
    MathUtlis.cpp \
    HelpDialog.cpp \
    CheckUpdatesThread.cpp

HEADERS  += MainWindow.h \
    DeconvolutionTool.h \
    WorkerThread.h \
    ImageUtils.h \
    Models/Blur.h \
    Models/FocusBlur.h \
    Models/MotionBlur.h \
    MathUtlis.h \
    Models/ProcessingContext.h \
    HelpDialog.h \
    Models/GaussianBlur.h \
    CheckUpdatesThread.h

FORMS    += MainWindow.ui \
    HelpDialog.ui

unix{
	exists( /usr/local/cuda ){
		DEFINES += HAVE_CUFFT
		INCLUDEPATH += /usr/local/cuda/include
		LIBS +=  -L$$/usr/local/cuda/lib64 -lcufftw
	}
	!exists( /usr/local/cuda ){
		LIBS +=  -L$$/usr/lib/ -lfftw3_threads -lfftw3
	}
}

win32{
	LIBS += -L$$PWD/FFTW/libs/ -llibfftw3-3
	INCLUDEPATH += $$PWD/FFTW
	DEPENDPATH += $$PWD/FFTW
	HEADERS  += FFTW/fftw3.h
}


RESOURCES += \
    MainResources.qrc

RC_FILE = SmartDeblur.rc
#CONFIG += console
