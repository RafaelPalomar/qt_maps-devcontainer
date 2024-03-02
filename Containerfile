# Use Ubuntu 22.04 LTS as the base image
FROM ubuntu:22.04

# Set labels to provide metadata about the container, indicating its purpose as a devcontainer for 3D Slicer development
LABEL org.opencontainers.image.title="Qt Maps development container" \
      org.opencontainers.image.description="This container comes with own qt build to build the Qt maps project" \
      maintainer="Rafael Palomar (rafael.palomar@ntnu.no)"

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Copy the 'extra-packages' file containing the list of packages to be installed
COPY extra-packages /

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends $(grep -v '^#' /extra-packages) && \
    # Clean up to reduce the image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# This makes possible to address git directories from within a distrobox or emacs TRAMP
RUN git config --system --add safe.directory '*' && \
    git config --global http.sslVerify false # This is a workaround and it should be changed

RUN mkdir /src && \
    cd /src && \
    git clone https://code.qt.io/qt/qt5.git qt6 && \
    cd qt6 && \
    ./init-repository --module-subset="qtbase,qtgrpc,qtrepotools" -f

RUN cd /src && \
    mkdir qt6-build && \
    cd qt6-build && \
    ../qt6/configure -developer-build -nomake examples -make tools -make tests -widgets -gui -prefix /opt/qt6 && \
    cmake --build . --parallel && \
    cmake --build . --target install

# The entry point or command to run when the container starts can be set here
# For example, opening a bash shell or starting a specific development tool
CMD ["/bin/bash"]
