FROM continuumio/miniconda:4.3.27p0

RUN conda install \
    ca-certificates=2017.08.26 \
    certifi=2017.11.5 \
    curl=7.55.1 \
    cython=0.27.3 \
    expat=2.2.5 \
    gcc_linux-64 \
    geos=3.6.2 \
    git=2.15.0 \
    hdf4=4.2.13 \
    hdf5=1.8.9 \
    intel-openmp=2018.0.0 \
    jpeg=9b \
    libedit=3.1 \
    libffi=3.2.1 \
    libgfortran=1 \
    libiconv=1.15 \
    libnetcdf=4.2.1.1 \
    libssh2=1.8.0 \
    mkl=2018.0.1 \
    ncurses=6.0 \
    netcdf4=1.0.7 \
    numexpr=2.0.1 \
    numpy=1.7.1 \
    openssl=1.0.2n \
    perl=5.26.0 \
    pip=9.0.1 \
    pyproj=1.9.5.1 \
    pytables=2.4.0 \
    python=2.7.14 \
    readline=7.0 \
    setuptools=36.5.0 \
    shapely=1.5.16 \
    sqlite=3.20.1 \
    tk=8.6.7 \
    wheel=0.30.0 \
    zlib=1.2.11 \
    && conda install -c mutirri szip=2.1

ENV C_INCLUDE_PATH="/opt/conda/include/"

RUN apt-get update \
    && apt-get install gcc -y \
    && wget "https://downloads.sourceforge.net/project/pysclint/pyhdf/0.8.3/pyhdf-0.8.3.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpysclint%2F&ts=1515213647&use_mirror=cytranet" -O /tmp/pyhdf.tar.gz\
    && cd /tmp \
    && pip install pyhdf.tar.gz \
    && rm pyhdf.tar.gz \
    && apt-get remove gcc -y \
    && apt-get autoremove -y \
    && apt-get clean

RUN easy_install whips2
