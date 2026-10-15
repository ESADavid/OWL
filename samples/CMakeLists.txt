# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# ------------------------------------------------------------------
# cmdline-only samples, also used for 'make test'
# ------------------------------------------------------------------
function(owl_add_gpu_test test_name)
	add_test(${test_name} ${ARGN})
	set_tests_properties(${test_name} PROPERTIES
		SKIP_REGULAR_EXPRESSION "CUDA driver version is insufficient for CUDA runtime version|no CUDA capable devices found"
	)
endfunction()

add_subdirectory(cmdline)

# "owl prime" samples
add_subdirectory(prime)

# ------------------------------------------------------------------
# interactive, viewer based samples
# ------------------------------------------------------------------
# --> all interactive samples got removed from this repo so this repo
# could remain free of windowing, glfw, etcpp; former interactive
# samples will be provided in another repo.
