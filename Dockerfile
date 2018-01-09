FROM continuumio/miniconda:4.3.27p0

RUN conda install \
    certifi=2017.11.5 \
    cython=0.27.3 \
    futures=3.2.0 \
    geos=3.6.2 \
    hdf4=4.2.13 \
    hdf5=1.8.9 \
    jpeg=9b \
    libgfortran=1.0 \
    libnetcdf=4.2.1.1 \
    netcdf4=1.0.7 \
    numexpr=2.0.1 \
    numpy=1.7.1 \
    openssl=1.0.2n \
    pip=9.0.1 \
    pycosat=0.6.3 \
    pyproj=1.9.5.1 \
    pytables=2.4.0 \
    shapely=1.5.16 \
    zlib=1.2.11 \
    && conda install -c mutirri szip=2.1

ENV C_INCLUDE_PATH="/opt/conda/include/"

RUN conda install gcc_linux-64 \
    && apt-get install gcc -y \
    && wget "https://downloads.sourceforge.net/project/pysclint/pyhdf/0.8.3/pyhdf-0.8.3.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpysclint%2F&ts=1515213647&use_mirror=cytranet" -O /tmp/pyhdf.tar.gz\
    && cd /tmp \
    && pip install pyhdf.tar.gz \
    && rm pyhdf.tar.gz \
    && conda uninstall gcc_linux-64 \
    && conda clean --packages \
    && apt-get remove gcc -y \
    && apt-get autoremove -y \
    && apt-get clean

RUN easy_install whips2
