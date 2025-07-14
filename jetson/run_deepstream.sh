#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-csi}"
URI="${2:-}"
DEEPSTREAM_YOLO_DIR="${DEEPSTREAM_YOLO_DIR:-$HOME/DeepStream-Yolo}"
CONFIG="deepstream_app_config_csi.txt"

if [ "${MODE}" = "uri" ]; then
  CONFIG="deepstream_app_config_uri.txt"
fi

cp yolo11s_car.onnx labels.txt config_infer_primary_yolo11_car.txt config_tracker_NvDCF_car.yml "${DEEPSTREAM_YOLO_DIR}/"
cp "${CONFIG}" "${DEEPSTREAM_YOLO_DIR}/deepstream_app_config_car.txt"
if [ -n "${URI}" ]; then
  sed -i "s#^uri=.*#uri=${URI}#" "${DEEPSTREAM_YOLO_DIR}/deepstream_app_config_car.txt"
fi
cd "${DEEPSTREAM_YOLO_DIR}"
deepstream-app -c deepstream_app_config_car.txt
