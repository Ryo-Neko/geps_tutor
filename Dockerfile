FROM continuumio/miniconda3:latest

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    gfortran \
    cmake \ 
    zlib1g-dev \
    hdf5-tools hdf5-helpers libhdf5-dev libhdf5-doc libhdf5-serial-dev \
    libnetcdf-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /app

# 環境変数の設定
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# # get wgrib2
# RUN cd ~ \
# 	&& wget ftp://ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz \
# 	&& tar xvzf wgrib2.tgz
# 
# # wgrib2 installation
# RUN cd ~/grib2/ \
# 	&& make \
# 	&& cp wgrib2/wgrib2 /usr/local/bin/wgrib2
# 

# condaの環境を作成し、GDALとJupyterとその他の必要なパッケージをインストール
RUN conda create -n geps -y python=3.10 && \
    conda install -n geps -c conda-forge gdal jupyter netcdf4 numpy pandas xarray matplotlib cartopy geopandas black flake8 -y 
RUN conda install -c conda-forge pygrib
RUN conda clean -afy

# シェル起動時に自動的に環境をアクティブにする設定
RUN echo "source activate geps" > ~/.bashrc
ENV PATH /opt/conda/envs/geps/bin:$PATH

# エントリーポイントスクリプトをコピー
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 作業ディレクトリをボリュームとしてマウント
VOLUME [ "/app" ]

# Jupyterのポートを公開
EXPOSE 8888

# エントリーポイントを設定
ENTRYPOINT ["/entrypoint.sh"]

# デフォルトはJupyter
CMD ["jupyter"]
