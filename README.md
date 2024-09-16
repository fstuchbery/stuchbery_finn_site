# Coding Assignment - React App with Docker

## Overview

This project sets up a React development environment using Docker. It displays a simple website with a `<h1>` tag containing the text “Codin 1” and is served using Nginx.

## Getting Started

Follow these steps in the Dockerfile and here to get the web application running on `localhost:7775`.

### Prerequisites

- Docker: Ensure you have Docker installed on your machine. You can download it from [Docker's official website](https://www.docker.com/products/docker-desktop).

### Build the Docker Image

1. Open a terminal or command prompt.
2. Navigate to the root of the project directory where the `Dockerfile` is located.
3. Build the Docker image with the following command:

   ```bash
   docker build -t stuchbery_finn_site .
   docker run -p 7775:80 --name stuchbery_finn_coding_assignment11 stuchbery_finn_site
   
