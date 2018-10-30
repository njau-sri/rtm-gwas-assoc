TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += -llapack -lblas -lgfortran -lquadmath
QMAKE_CXXFLAGS += -std=c++11 -fopenmp
QMAKE_LFLAGS += -static -fopenmp

SOURCES += \
        main.cpp \
    rtm_gwas_assoc.cpp \
    anova.cpp \
    cmdline.cpp \
    lapack.cpp \
    lsfit.cpp \
    pheno.cpp \
    statsutil.cpp \
    stepreg.cpp \
    util.cpp \
    vcf.cpp

HEADERS += \
    anova.h \
    cmdline.h \
    lapack.h \
    lsfit.h \
    pheno.h \
    split.h \
    statsutil.h \
    stepreg.h \
    util.h \
    vcf.h
