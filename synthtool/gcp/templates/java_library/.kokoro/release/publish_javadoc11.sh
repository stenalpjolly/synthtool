#!/bin/bash
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -eo pipefail

# work from the git root directory
cd $(dirname "$0")/../../
export ROOT_DIR=$(pwd)

export NAME={{ metadata['repo']['distribution_name'].split(':')|last }}
export VERSION=$(grep ${NAME}: versions.txt | cut -d: -f3)

if [ "$REGENERATE" = "true" ]; then
  GENERATE=${KOKORO_GFILE_DIR}/regenerate_publish_javadoc11.sh
else
  GENERATE=${KOKORO_GFILE_DIR}/publish_javadoc11_1.0.0.sh
fi

bash ${GENERATE}