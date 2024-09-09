# Application Setup Guide

This guide will help you configure and run the application using Docker Compose. Follow the steps below to correctly set up the necessary parameters and start the container.

## Configuration Instructions

Before running the Docker Compose setup, you need to EDIT/UPDATE the `docker-compose.yml` file with your specific parameters.

### Required Parameters

- **FLOORPLAN_ID**: Your unique floorplan ID. (Copy from left panel of Klet3D app)
- **LICENSE_KEY**: Your license key for the application. (Copy from left panel of Klet3D app)
- **TOKEN**: Home Assistant token required for authentication. (Generate token in your Home Assistant account)
- **HA_URL**: URL of your Home Assistant instance.

### Steps to Configure

1. Open the `docker-compose.yml` file in a text editor.
2. Locate the following section:

   ```yaml
   args:
     FLOORPLAN_ID: your-floorplan-id-here
     LICENSE_KEY: your-license-key-here
     TOKEN: your-token-here
     HA_URL: your-home-assistant-url-here
   ```

3. Replace the placeholder values (`your-floorplan-id-here`, `your-license-key-here`, `your-token-here`, `your-home-assistant-url-here`) with your actual data.
4. Run the following command to build and start the container in detached mode:

   ```sh
   docker-compose up --build -d
   ```

5. After running the Docker Compose command, the application will be accessible via your web browser at: [http://localhost:8080](http://localhost:8080)

### Updating the Application or Parameters

#### Updating to a new version

If a new version of the application is released, re-run the `docker-compose up --build -d` command to get the latest version of the app.

#### Updating application parameters

If you need to change any of the parameters then:

1. Edit the `docker-compose.yml` file as needed.
2. Re-run the `docker-compose up --build -d` command to apply the changes.

This will rebuild the container with the updated settings and restart the application.

### Changing the Port (Optional)

By default, the application will be accessible on [http://localhost:8080](http://localhost:8080). If you need to change the port:

1. Locate the `ports` section in the `docker-compose.yml` file:

   ```yaml
   ports:
     - "8080:8099"
   ```

2. Replace the first `8080` with your desired port number. For example, to use port `9090`:

   ```yaml
   ports:
     - "9090:8099"
   ```

3. Re-run the `docker-compose up --build -d` command to apply the changes.

4. Application should be accessible via your web browser at: [http://localhost:9090](http://localhost:9090)

You're all set! If you encounter any issues, refer back to this guide or consult the application's documentation.
