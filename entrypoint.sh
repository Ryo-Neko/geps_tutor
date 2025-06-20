#!/bin/bash

# 環境をアクティブにする
source activate geps

# 引数に基づいて異なるコマンドを実行
case "$1" in
  jupyter)
    echo "Jupyter環境を起動します..."
    exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
    ;;
  jupyterlab)
    echo "JupyterLab環境を起動します..."
    exec jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
    ;;
  python)
    echo "Pythonインタープリタを起動します..."
    exec python
    ;;
  bash)
    echo "Bash環境を起動します..."
    exec bash
    ;;
  *)
    echo "使用法: $0 {jupyter|jupyterlab|python|bash}"
    echo "デフォルトでJupyter Notebookを起動します..."
    exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
    ;;
esac