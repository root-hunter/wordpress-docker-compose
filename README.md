# wmrc_hosting
<h3>COMPLETE HOSTING SOLUTION</h3>
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
      git clone https://github.com/[username]/[repository-name].git
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
