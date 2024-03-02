# Qt_Maps-DevContainer

## Description

`qt_maps-devcontainer` is a containerized development environment designed to streamline the Qt_Maps project development. This setup leverages Distrobox to offer a flexible, containerized environment, making it ideal for use with immutable Linux distributions and development containers. It is based on Ubuntu 22.04 and includes all necessary dependencies and tools for building qt from source and support the qt-maps project development. In addition a development version of Qt6 is built and deployed (`/opt`) This project facilitates a consistent and isolated development environment, ensuring that developers can work in a reproducible setting. It has been tested extensively to provide an baseline setup for Qt_Maps development workflows.

## Building the Image

To construct the `qt_maps-devcontainer` image:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/qt_maps-devcontainer.git
   cd qt_maps-devcontainer
   ```

2. Build the container image:

   ```bash
   podman build -t quay.io/yourusername/qt_maps-devcontainer:latest .
   ```
   
 Note that there is an existing container at quay.io/rafael_palomar/qt_maps-devcontainer:latest

3. Optionally, push the image to a container registry (e.g., Quay.io) if you wish to share or access it remotely (requires authentication):

   ```bash
   podman push quay.io/yourusername/qt_maps-devcontainer:latest
   ```

## Using qt_maps-devcontainer with Distrobox

To initiate your development environment:

1. Create a new Distrobox container:

   ```bash
   distrobox create -i quay.io/yourusername/qt_maps-devcontainer:latest -n qt_maps-devcontainer
   ```

2. Enter the Distrobox container:

   ```bash
   distrobox enter qt_maps-devcontainer
   ```

## Contributions and Feedback

We welcome your contributions and feedback to make `qt_maps-devcontainer` even better for the Qt_Maps development community. Please feel free to open issues or pull requests on [GitHub](https://github.com/yourusername/qt_maps-devcontainer).
