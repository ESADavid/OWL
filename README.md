# OWL: A Productivity Library for OptiX

[![Windows](https://github.com/NVIDIA/owl/actions/workflows/Windows.yml/badge.svg)](https://github.com/NVIDIA/owl/actions/workflows/Windows.yml)

OWL is a C++ and C API for building OptiX ray-tracing applications. It manages OptiX programs, shader binding tables (SBTs), geometry, acceleration structures, buffers, and launch parameters. A context can use one or more CUDA devices.

The repository also includes OWL Prime, a higher-level geometry and model API implemented on top of OWL, plus command-line samples that introduce the library's features.

## Requirements

- CMake 3.24 or newer
- A CUDA Toolkit installation with a CUDA-capable GPU and compatible NVIDIA driver
- An OptiX SDK installation
- A C++17 compiler and CUDA compiler supported by the installed CUDA Toolkit

OWL looks for OptiX in `3rdParty/optix` by default. To use an SDK installed elsewhere, pass its directory as `OptiX_INSTALL_DIR` when configuring.

## Build

From the repository root, configure and build OWL and its samples:

```bash
cmake -S . -B build -DOptiX_INSTALL_DIR=/path/to/NVIDIA-OptiX-SDK
cmake --build build --parallel
```

Samples are enabled by default. To build only the libraries, configure with `-DOWL_BUILD_SAMPLES=OFF`.

Run the registered command-line sample tests with:

```bash
ctest --test-dir build --output-on-failure
```

The samples require a working CUDA/OptiX runtime and GPU to execute.

## First Sample

The `s01-simpleTriangles` sample creates a CUDA context, uploads triangle data, builds geometry and instance acceleration structures, creates ray-generation and miss programs, then builds the OptiX programs, pipeline, and SBT before launching.

After building, run it from the repository root:

```bash
./build/sample01-simpleTriangles
```

It writes `s01-simpleTriangles.png` to the current working directory. The host-side setup is in [hostCode.cpp](samples/cmdline/s01-simpleTriangles/hostCode.cpp); the device-side ray-generation, closest-hit, and miss programs are in [deviceCode.cu](samples/cmdline/s01-simpleTriangles/deviceCode.cu).

## Repository Map

- `include/owl/`: public host and device headers, including the C API and shared math utilities
- `owl/`: OWL runtime, CUDA/OptiX integration, resource management, geometry, acceleration structures, and SBT/pipeline construction
- `prime/`: OWL Prime API and its OWL-backed implementation
- `samples/cmdline/`: runnable examples, from ray-generation basics through multi-GPU, motion blur, 3D launches, and textures
- `3rdParty/`: bundled dependencies, including OptiX headers and stb image utilities

The public API declarations and usage details are in [owl_host.h](include/owl/owl_host.h) and [owl_device.h](include/owl/owl_device.h). See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution requirements.

## License

OWL is distributed under the Apache License 2.0. See [LICENSE](LICENSE).
