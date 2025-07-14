#!/usr/bin/env bash
set -euo pipefail

# reference:
# https://docs.ultralytics.com/guides/deepstream-nvidia-jetson#what-is-nvidia-deepstream
DEEPSTREAM_YOLO_DIR="${DEEPSTREAM_YOLO_DIR:-$HOME/DeepStream-Yolo}"
CUDA_VER="${CUDA_VER:-10.2}"

if [ ! -d "${DEEPSTREAM_YOLO_DIR}/.git" ]; then
  git clone https://github.com/marcoslucianops/DeepStream-Yolo.git "${DEEPSTREAM_YOLO_DIR}"
fi

cd "${DEEPSTREAM_YOLO_DIR}"
export CUDA_VER
make -C nvdsinfer_custom_impl_Yolo clean
make -C nvdsinfer_custom_impl_Yolo
