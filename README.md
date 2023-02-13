# wordpress_compose
<img src="https://upload.wikimedia.org/wikipedia/commons/9/98/WordPress_blue_logo.svg" height="200" align="left">
<img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/MariaDB_colour_logo.svg" height="200">
<img src="https://upload.wikimedia.org/wikipedia/en/6/6b/Redis_Logo.svg" height="200">
<img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Docker_%28container_engine%29_logo.svg" height="200">


<h1>COMPLETE HOSTING SOLUTION</h1>
<ul>
<li><b>Wordpress</b></li>
<li><b>MariaDB</b></li>
<li><b>Redis</b></li>
<li><b>SFTP</b></li>
<li><b>Docker Compose</b></li>
</ul>


<p>This project is a Docker Compose-based solution that integrates <b>WordPress</b>, <b>Redis</b>, and <b>features FTP</b> connectivity and <b>automatic database and WordPress backups to Google Firebase Storage</b>.
</p>
<p>As the database, it uses the latest version of <b>MariaDB</b> in a dedicated container. This setup provides a highly scalable and efficient platform for hosting WordPress websites with robust caching and data storage capabilities.
</p>
<p>The use of Docker Compose simplifies the deployment and configuration process, while the integration with Firebase Storage ensures secure and reliable backup and storage of website data. 

The FTP support provides a convenient way for developers to manage files and media assets for their WordPress sites.
</p>

<h2>Backup to Firebase Storage</h2>
    <p>
      This project also includes a feature for automatically backing up your database and WordPress installation to Google Firebase Storage. This provides an added level of security and peace of mind, ensuring that your website data is safe and can be easily restored in case of any issues.
    </p>

<h1>Get Start</h1>
    <h2>Introduction</h2>
    <p>
      This tutorial will guide you through the process of setting up a Docker Compose-based WordPress hosting environment that integrates Redis, MariaDB, FTP connectivity, and automatic backups to Firebase Storage.
    </p>
    <h2>Prerequisites</h2>
    <ul>
      <li>A system with Docker and Docker Compose installed</li>
      <li>A Google Firebase account and a Firebase Storage bucket set up</li>
    </ul>
    <h2>Step 1: Clone the project repository</h2>
    <p>
      Start by cloning the project repository to your local system. You can do this by running the following command in your terminal:
    </p>
    <pre>
      git clone https://github.com/root-hunter/wordpress_compose.git
    </pre>
    <p>
      Replace [username] and [repository-name] with the appropriate values.
    </p>
    <h2>Step 2: Create the environment file</h2>
    <p>
      In the cloned project repository, you will find a file named `.env.example`. This file contains the environment variables required for the setup to work. Create a copy of this file named `.env` and fill in the values with your own details.
    </p>
    <h2>Step 3: Launch the containers</h2>
    <p>
      Now, navigate to the project repository in your terminal and run the following command:
    </p>
    <pre>
      docker-compose up -d
    </pre>
    <p>
      This will launch the containers and start the services defined in the `docker-compose.yml` file. You can verify the status of the containers by running the following command:
    </p>
    <pre>
      docker-compose ps
    </pre>
    <h2>Step 4: Access the WordPress dashboard</h2>
    <p>
      Once the containers are running, you can access the WordPress dashboard by navigating to http://localhost in your web browser. You should now be able to set up and manage your WordPress website.
    </p>
    <h2>Conclusion</h2>
    <p>
      With these simple steps, you should now have a fully functional Docker Compose-based WordPress hosting environment set up and ready to use. You can now start creating and publishing your own WordPress content.
    </p>
  <h1>Setting up Firebase Backups</h1>
    <h2>Verifying the Backups Folder</h2>
    <p>
      Before starting with the setup, it is important to verify that the "wordpress_compose/backups" folder exists. If the folder does not exist, you will need to create it. This folder will be used to store the backups of your WordPress installation and database.
    </p>
    <h2>Compiling the firebaseConf.json file</h2>
    <p>
      The next step is to compile the "tools/firebaseConf.json" file. This file contains all the necessary configuration information for connecting to your Firebase Storage account.
    </p>
    <h2>Reviewing Folder and Script Paths</h2>
    <p>
      Before setting up your Firebase backups, it is important to review the folder and script paths to make sure they are correctly configured for your system. This includes ensuring that the scripts/backup.sh script is in the correct location and has the necessary permissions to run.
    </p>
    <h2>Adding the Backup Command to Crontab</h2>
    <p>
      Once the firebaseConf.json file is compiled and the folder and script paths are reviewed, you can add the backup command to your crontab. This is done by running "crontab -e" and adding the following line to your cron table:
    </p>
    <pre>
      0 0 * * * sh /path/to/scripts/backup.sh
    </pre>
    <p>
      This line will run the backup.sh script every day at midnight, backing up your WordPress installation and database to your Firebase Storage account. You can adjust the timing of the backup as needed by modifying the crontab entry.
    </p>
    <h2>Conclusion</h2>
    <p>
      By following these steps, you can easily set up automated backups of your WordPress installation and database using Firebase Storage. This provides an added layer of security and peace of mind, ensuring that your website data is safe and easily recoverable in case of any issues.
    </p>
      <h1>Adding SSL to your WordPress Server</h1>
    <p>
      In order to add SSL encryption to your WordPress server, you can use the nginx-proxy-manager container. This container acts as a reverse proxy, forwarding requests from the internet to your WordPress container.
    </p>
    <h2>Adding the nginx-proxy-manager Container</h2>
    <p>
      To add the nginx-proxy-manager container to your setup, you will need to modify your Docker Compose file. This can be done by adding the following section to your compose file:
    </p>
    <pre>
      nginx-proxy-manager:
        image: jc21/nginx-proxy-manager:latest
        ports:
          - 80:80
          - 443:443
        environment:
          - VIRTUAL_HOST=yourdomain.com
        volumes:
          - ./data/nginx-proxy-manager:/app/data
    </pre>
    <p>
      This section specifies that you want to use the latest version of the nginx-proxy-manager image, and maps ports 80 and 443 on the host to the same ports within the container. The VIRTUAL_HOST environment variable should be set to your domain name.
    </p>
    <p>
      The volumes section maps a local folder "./data/nginx-proxy-manager" to the "/app/data" folder within the container, allowing you to persist data between runs of the container.
    </p>
    <h2>Configuring the Reverse Proxy</h2>
    <p>
      Once the nginx-proxy-manager container is added, you will need to configure the reverse proxy to forward requests to your WordPress container. This can be done through the web-based user interface provided by nginx-proxy-manager.
    </p>
    <p>
      To access the user interface, navigate to http://yourdomain.com in a web browser. You will be prompted to log in with a username and password, which you can set through the environment variables in your Docker Compose file.
    </p>
    <p>
      Within the user interface, you can add a new proxy by clicking on the "Proxies" menu item, and then clicking "Add Proxy". You will need to specify the target URL (e.g. http://wordpress), and select the SSL options as desired.
    </p>
    <h2>Conclusion</h2>
    <p>
      By following these steps, you can easily add SSL encryption to your WordPress server using the nginx-proxy-manager container. This provides an added layer of security for your website, and helps to ensure that sensitive information is transmitted securely over the internet.
    </p>
