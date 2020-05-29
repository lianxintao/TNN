// Tencent is pleased to support the open source community by making TNN available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company. All rights reserved.
//
// Licensed under the BSD 3-Clause License (the "License"); you may not use this file except
// in compliance with the License. You may obtain a copy of the License at
//
// https://opensource.org/licenses/BSD-3-Clause
//
// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include "tnn/device/metal/acc/metal_common.h"
#include "tnn/device/metal/acc/metal_layer_acc.h"
#include "tnn/device/metal/metal_context.h"
#include "tnn/utils/data_type_utils.h"

namespace TNN_NS {

DECLARE_METAL_ACC(Reshape, LAYER_RESHAPE);

Status MetalReshapeLayerAcc::Reshape(const std::vector<Blob *> &inputs, const std::vector<Blob *> &outputs) {
    return MetalLayerAcc::Reshape(inputs, outputs);
}

Status MetalReshapeLayerAcc::AllocateBufferParam(const std::vector<Blob *> &inputs,
                                                 const std::vector<Blob *> &outputs) {
    return MetalLayerAcc::AllocateBufferParam(inputs, outputs);;
}

std::string MetalReshapeLayerAcc::KernelName() {
    return "reshape_common";
}

Status MetalReshapeLayerAcc::ComputeThreadSize(const std::vector<Blob *> &inputs,
                                        const std::vector<Blob *> &outputs,
                                        MTLSize &size) {
    return MetalLayerAcc::ComputeThreadSize(inputs, outputs, size);
}

Status MetalReshapeLayerAcc::Forward(const std::vector<Blob *> &inputs,
                                     const std::vector<Blob *> &outputs) {
    return MetalLayerAcc::Forward(inputs, outputs);
}

Status MetalReshapeLayerAcc::SetKernelEncoderParam(
                                                   id<MTLComputeCommandEncoder> encoder,
                                                   const std::vector<Blob *> &inputs,
                                                   const std::vector<Blob *> &outputs) {
    return MetalLayerAcc::SetKernelEncoderParam(encoder, inputs, outputs);
}

REGISTER_METAL_ACC(Reshape, LAYER_RESHAPE);

} // namespace TNN_NS