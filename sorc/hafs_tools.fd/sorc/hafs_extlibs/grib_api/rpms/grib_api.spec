# -*- Mode:rpm-spec -*-
Summary: The ECMWF GRIB API is an application program interface accessible from C and FORTRAN programs developed for encoding and decoding WMO FM-92 GRIB edition 1 and edition 2 messages.
%define rel 1

%define version 1.28.0
%define pkgname grib_api
%define prefix /usr/local
%define _prefix /usr/local
%define _target_platform x86_64-suse-linux-gnu
%define _target_cpu x86_64
%define _enable_python %(test -z "" && echo 1 || echo 0)
%define _enable_fortran %(test -z "" && echo 1 || echo 0)
%define _requires_openjpeg %(test -n "" && echo 1 || echo 0)
%define _requires_jasper %(test -n "-ljasper" && echo 1 || echo 0)

%define lt_release @LT_RELEASE@
%define lt_version @LT_CURRENT@.@LT_REVISION@.@LT_AGE@

%define __aclocal   aclocal || aclocal -I ./macros
%define configure_args  '--enable-python' '--disable-shared' 'CC=gcc' 'F77=gfortran' 'FC=gfortran'

Name: %{pkgname}
Version: %{version}
Release: %{rel}
Distribution: openSUSE 42.3 (x86_64) 

Vendor: ECMWF
License: Apache Licence version 2.0 
Group: Scientific/Libraries
Source: %{pkgname}-%{version}.tar.gz
%if %{_requires_jasper}
Requires: libjasper
%endif
%if %{_requires_openjpeg}
Requires: openjpeg 
%endif
Buildroot: /tmp/%{pkgname}-root
URL: http://www.ecmwf.int
Prefix: %{prefix}
BuildArchitectures: %{_target_cpu}
Packager: Software Support <software.support@ecmwf.int>

%description 
The ECMWF GRIB API is an application program interface accessible from C and FORTRAN programs developed for encoding and decoding WMO FM-92 GRIB edition 1 and edition 2 messages.

%changelog
* Thu Mar 15 2012 - Get the changelog from JIRA
- Multiple bugfixes

%prep
%setup
#%patch

%build
%configure %{?configure_args}
# This is why we copy the CFLAGS to the CXXFLAGS in configure.in
# CFLAGS="%{optflags}" CXXFLAGS="%{optflags}" ./configure %{_target_platform} --prefix=%{prefix}
make

%install
# To make things work with BUILDROOT
echo Cleaning RPM_BUILD_ROOT: "$RPM_BUILD_ROOT"
rm -rf "$RPM_BUILD_ROOT"
make DESTDIR="$RPM_BUILD_ROOT" install

%clean


%files
%defattr(-, root, root)
%doc ChangeLog README AUTHORS NEWS LICENSE
#%doc doc/*
%prefix/bin/*
%prefix/lib*/libgrib_api.so
%prefix/lib*/libgrib_api.so.*
%prefix/share/grib_api/definitions/*

# If you install a library
%post -p /sbin/ldconfig

# If you install a library
%postun -p /sbin/ldconfig

%package devel
Summary: Development files for %{pkgname}
Group: Scientific/Libraries
Requires: grib_api
%description devel
Development files for %{pkgname}.
The ECMWF GRIB API is an application program interface accessible from C and FORTRAN programs developed for encoding and decoding WMO FM-92 GRIB edition 1 and edition 2 messages.
%files devel
%defattr(-, root, root)
#%doc doc
%prefix/include/grib_api.h
%prefix/include/grib_api_windef.h
%prefix/include/grib_api_version.h
%prefix/lib*/libgrib_api.a
%prefix/lib*/libgrib_api.la
%prefix/lib*/pkgconfig/*
%prefix/share/grib_api/samples/*
%prefix/share/grib_api/ifs_samples/*

# Only generate package if python is enabled
%if %{_enable_python}
%package python
Summary: Python interface for %{pkgname}
Group: Scientific/Libraries
Requires: grib_api
%description python
Python interface for %{pkgname}.
The ECMWF GRIB API is an application program interface accessible from C and FORTRAN programs developed for encoding and decoding WMO FM-92 GRIB edition 1 and edition 2 messages.
%files python
%defattr(-, root, root)
%prefix/lib*/python*/*
%endif

# Only generate package if fortran is enabled
%if %{_enable_fortran}
%package fortran
Summary: Fortran 90 interface for %{pkgname}
Group: Scientific/Libraries
Requires: grib_api
%description fortran
Fortran 77 and 90 interface for %{pkgname}.
The ECMWF GRIB API is an application program interface accessible from C and FORTRAN programs developed for encoding and decoding WMO FM-92 GRIB edition 1
and edition 2 messages.
%files fortran
%defattr(-, root,root)
%prefix/include/*.mod
%prefix/include/*f77*
%prefix/lib*/*f90*
%prefix/lib*/*f77*
%endif

