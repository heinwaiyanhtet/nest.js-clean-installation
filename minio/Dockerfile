# Use an official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages (wget and dpkg)
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y ca-certificates && \
    update-ca-certificates

# Download and install MinIO Open Source version
RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio_20241002175041.0.0_amd64.deb && \
    dpkg -i minio_20241002175041.0.0_amd64.deb

# Set environment variables for MinIO
ENV MINIO_ROOT_USER=admin \
    MINIO_ROOT_PASSWORD=password

# Expose MinIO ports
EXPOSE 9000 9001

# Create a directory for MinIO data
RUN mkdir -p /mnt/data

# Start MinIO server
CMD ["minio", "server", "/mnt/data", "--console-address", ":9001"]
