execute_process(
  COMMAND "${OWL_GPU_TEST_EXECUTABLE}"
  RESULT_VARIABLE result
  OUTPUT_VARIABLE stdout
  ERROR_VARIABLE stderr
)

set(output "${stdout}${stderr}")

if (output MATCHES "CUDA driver version is insufficient for CUDA runtime version")
  message(FATAL_ERROR "Skipping GPU test: CUDA driver version is insufficient for this runtime.\n${output}")
elseif (output MATCHES "no CUDA capable devices found")
  message(FATAL_ERROR "Skipping GPU test: no CUDA capable devices are available.\n${output}")
elseif (NOT result STREQUAL "0")
  message(FATAL_ERROR "GPU test failed (${result}).\n${output}")
endif()

message("${output}")