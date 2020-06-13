#!/bin/bash --posix

################################################################################
#### UNIX Script Documentation Block
##
## Script name:         build_hafs_extlibs.sh
##
## Script description:  Compile HAFS external libraries.
##
## Author:              Henry R. Winterbottom 
##
## Date:                2020-01-30
##
## Abstract:            This script compiles and installs the HAFS external
##                      libraries.
##
## Script history log:  
##
## 2020-01-30  Henry R. Winterbottom -- Original version.
##
## Usage: build_hafs_extlibs.sh
##
##   Imported Shell Variables:
##
##   Exported Shell Variables:
##
## Remarks:
##
##   Condition codes:
##
##      0 - no problem encountered
##     >0 - some problem encountered
##
## Attributes:
##
##   Language: POSIX shell
##   Machine: IBM SP
##
################################################################################

set -x -e

#----

# FUNCTION:

# _extlib_fftw.sh

# DESCRIPTION:

# This function configures, builds, and installs the FFTW
# application.

# NOTE:

# This function should never be called directly by the user and is for
# internal use only within this script.

_extlib_fftw (){

    # Move to the working directory for the FFTW application/library.

    cd ${HAFS_UTILS_EXTLIBS}/fftw

    # Define the local environment variables for the FFTW compilation.

    PREFIX=${HAFS_UTILS_EXTLIBS}
    export F77=`which ifort`
    export CC=`which gcc`

    # Configure the compile-time environment for the FFTW application
    # build.

    ./configure --prefix=${PREFIX} --disable-doc >& ${HAFS_UTILS_EXTLIBS}/logs/configure.fftw.log

    # Build the FFTW application.

    make >& ${HAFS_UTILS_EXTLIBS}/logs/make.fftw.log

    # Install the FFTW application.

    make install >& ${HAFS_UTILS_EXTLIBS}/logs/install.fftw.log
}

#----

# FUNCTION:

# _extlib_gribapi.sh

# DESCRIPTION:

# This function configures, builds, and installs the GRIB-API
# application.

# NOTE:

# This function should never be called directly by the user and is for
# internal use only within this script.

_extlib_gribapi (){

    # Move to the working directory for the GRIB-API
    # application/library.

    cd ${HAFS_UTILS_EXTLIBS}/grib_api

    # Define the local environment variables for the GRIB-API
    # compilation.

    PREFIX=${HAFS_UTILS_EXTLIBS}
    export FC=`which ifort`
    export CC=`which gcc`

    # Configure the compile-time environment for the GRIB-API
    # application build.

    ./configure --prefix=${PREFIX} >& ${HAFS_UTILS_EXTLIBS}/logs/configure.grib-api.log

    # Build the GRIB-API application.

    make >& ${HAFS_UTILS_EXTLIBS}/logs/make.grib-api.log

    # Install the GRIB-API application.

    make install >& ${HAFS_UTILS_EXTLIBS}/logs/install.grib-api.log
}

#----

# FUNCTION:

# _extlib_shtns.sh

# DESCRIPTION:

# This function configures, builds, and installs the SHTNS
# application.

# NOTE:

# This function should never be called directly by the user and is for
# internal use only within this script.

_extlib_shtns (){

    # Move to the working directory for the SHTNS application/library.

    cd ${HAFS_UTILS_EXTLIBS}/shtns

    # Define the local environment variables for the SHTNS
    # compilation.

    export LDFLAGS=-L${HAFS_UTILS_EXTLIBS}/lib
    PREFIX=${HAFS_UTILS_EXTLIBS}

    # Configure the compile-time environment for the SHTNS application
    # build.

    ./configure --prefix=${PREFIX} >& ${HAFS_UTILS_EXTLIBS}/logs/configure.shtns.log

    # Build the SHTNS application.

    make >& ${HAFS_UTILS_EXTLIBS}/logs/make.shtns.log

    # Install the SHTNS application.

    make install >& ${HAFS_UTILS_EXTLIBS}/logs/install.shtns.log
}

#----

# FUNCTION:

# build_extlibs.sh

# DESCRIPTION:

# This function builds all applications and/or libraries collected
# from external sources.

build_extlibs (){

    # Define the top-level directory for all HAFS utility libraries
    # collected from external sources.

    export HAFS_UTILS_EXTLIBS=${HAFS_UTILS_SORC}/hafs_extlibs

    # Create a directory to contain all configure, make, and
    # installation logs.

    mkdir -p ${HAFS_UTILS_EXTLIBS}/logs

    # Build the GRIB-API application.

    _extlib_gribapi

    # Build the FFTW application.

    _extlib_fftw

    # Build the SHTNS application.

    _extlib_shtns
}

#----

# FUNCTION:

# setup_hafs_extlibs_build.sh

# DESCRIPTION:

# This function configures the compile-time environment for the HAFS
# external library compilations and builds.

setup_hafs_extlibs_build (){

    # Define the top-level directory for all HAFS utility application
    # source codes; this includes the library paths.

    export HAFS_UTILS_SORC=`pwd`

    # Define a working directory to contain all HAFS utility
    # application executables.

    export HAFS_UTILS_EXEC=${HAFS_UTILS_SORC}/../exec

    # Create a working directory to contain all HAFS utility
    # application executables.

    mkdir -p ${HAFS_UTILS_EXEC}

    # Load all modules and compile-time environment variables for the
    # HAFS external library compilations and builds.

#   . ${MODULES}
}

#----

script_name=`basename "$0"`
start_date=`date`
echo "START ${script_name}: ${start_date}"

# (1) Configure the local environment for the HAFS utility application
#     compilations.

setup_hafs_extlibs_build

# (2) Build all libraries gathered from external sources.

build_extlibs

export ERR=$?
export err=${ERR}
stop_date=`date`
echo "STOP ${script_name}: ${stop_date}"

exit ${err}
