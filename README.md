# Slicer-DevContainer

## Description

`slicer-devcontainer` is a containerized development environment designed to streamline 3D Slicer development. This setup leverages Distrobox to offer a flexible, containerized environment, making it ideal for use with immutable Linux distributions. It is based on Debian 12 and includes all necessary dependencies and tools for 3D Slicer development, such as CMake, Qt, and VTK, alongside other utilities like git, fd, and shellcheck. This project facilitates a consistent and isolated development environment, ensuring that developers can work in a reproducible setting. It has been tested extensively to provide an optimal setup for 3D Slicer development workflows.

## Building the Image

To construct the `slicer-devcontainer` image:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/slicer-devcontainer.git
   cd slicer-devcontainer
   ```

2. Build the container image:

   ```bash
   podman build -t quay.io/yourusername/slicer-devcontainer:latest .
   ```
   
 Note that there is an existing container at quay.io/rafael_palomar/slicer-devcontainer:latest

3. Optionally, push the image to a container registry (e.g., Quay.io) if you wish to share or access it remotely (requires authentication):

   ```bash
   podman push quay.io/yourusername/slicer-devcontainer:latest
   ```

## Using slicer-devcontainer with Distrobox

To initiate your development environment:

1. Create a new Distrobox container:

   ```bash
   distrobox create -i quay.io/yourusername/slicer-devcontainer:latest -n slicer-devcontainer
   ```

2. Enter the Distrobox container:

   ```bash
   distrobox enter slicer-devcontainer
   ```

## Setting Up 3D Slicer Development Environment

Inside your `slicer-devcontainer`, you can set up the 3D Slicer development environment as follows:

1. Clone the 3D Slicer source code:

   ```bash
   git clone https://github.com/Slicer/Slicer.git
   cd Slicer
   ```

2. Configure and build 3D Slicer:

   ```bash
   cmake -S . -B Release -DCMAKE_BUILD_TYPE=Release
   cmake --build Release
   ```

## Contributions and Feedback

We welcome your contributions and feedback to make `slicer-devcontainer` even better for the 3D Slicer development community. Please feel free to open issues or pull requests on [GitHub](https://github.com/yourusername/slicer-devcontainer).
