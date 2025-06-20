# GDAL + Jupyter 環境

このリポジトリはGDALとJupyterが使える開発環境をDockerで構築します。

## 必要条件

* Docker
* Docker Compose

## セットアップ方法

1. リポジトリをクローンまたはダウンロードします。
2. 以下のいずれかのコマンドで希望の環境を起動します：

### Jupyter Notebook環境

```bash
docker-compose up jupyter -d
```

### JupyterLab環境

```bash
docker-compose up jupyterlab -d
```

### Pythonインタープリタ環境

```bash
docker-compose up python
```

### Bash環境

```bash
docker-compose up bash
```

3. Jupyter環境の場合、以下のコマンドでログを確認してアクセスURLを取得できます：

```bash
docker-compose logs jupyter
# または
docker-compose logs jupyterlab
```

4. ログに表示されるURLをブラウザで開いてJupyter環境にアクセスできます。URLは以下のような形式です：

```
http://127.0.0.1:8888/?token=<トークン>
```

## 特徴

- Python 3.10環境
- GDAL（地理空間データ処理ライブラリ）
- 以下のパッケージを含む科学計算・地理空間解析環境：
  - netcdf4
  - numpy
  - pandas
  - xarray
  - matplotlib
  - cartopy
  - geopandas
- Jupyter Notebook/Lab
- ローカルのファイルは`/app`ディレクトリにマウントされます

## 環境の停止

```bash
docker-compose down
```

## カスタム設定

特定の環境変数を設定することで、各サービスの動作をカスタマイズすることができます。docker-compose.ymlファイルを編集して環境変数を追加してください。