# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# ------------------------------------------------------------------
# cmdline-only samples, also used for 'make test'
# ------------------------------------------------------------------
function(owl_add_gpu_test test_name)
	add_test(NAME ${test_name}
		COMMAND ${CMAKE_COMMAND}
			"-DOWL_GPU_TEST_EXECUTABLE=${ARGN}"
			-P "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/run_gpu_test.cmake"
	)
	set_tests_properties(${test_name} PROPERTIES
		SKIP_REGULAR_EXPRESSION "Skipping GPU test: CUDA driver version is insufficient|Skipping GPU test: no CUDA capable devices"
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
