#!/bin/bash
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -u

echo Starting local TFT preprocessing...

# Preprocess the eval files
echo Preprocessing eval data...
rm -R -f /pfs/out/eval/local_chicago_taxi_output
python preprocess.py \
  --output_dir /pfs/out/eval/local_chicago_taxi_output \
  --outfile_prefix eval_transformed \
  --input /pfs/taxi/eval/data.csv \
  --runner DirectRunner

# Preprocess the train files, keeping the transform functions
echo Preprocessing train data...
rm -R -f /pfs/out/train/local_chicago_taxi_output
python preprocess.py \
  --output_dir /pfs/out/train/local_chicago_taxi_output \
  --outfile_prefix train_transformed \
  --input /pfs/taxi/train/data.csv \
  --runner DirectRunner

