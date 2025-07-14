#!/usr/bin/env bash
set -euo pipefail

TRAINING_OUTPUT="${1:-exports/training_output}"
BUNDLE_DIR="${2:-exports/jetson_deepstream_bundle}"

mkdir -p "${BUNDLE_DIR}"
cp "${TRAINING_OUTPUT}/yolo11s_car.onnx" "${BUNDLE_DIR}/"
cp "${TRAINING_OUTPUT}/labels.txt" "${BUNDLE_DIR}/"
cp deepstream/* "${BUNDLE_DIR}/"
mkdir -p "${BUNDLE_DIR}/jetson"
cp jetson/setup_deepstream_yolo.sh jetson/run_deepstream.sh "${BUNDLE_DIR}/jetson/"
