**Comprehensive Guide**: **MySQL Threat IoCs Database Setup, Exporting Data, and GitHub Integration**

Here are reference links for MySQL commands that might be helpful for you:

**MySQL Documentation (Official)**:

**General Reference**: MySQL 8.0 Reference Manual:

**URL**: https://dev.mysql.com/doc/refman/8.0/en/

**SQL Statements**:

**URL**: https://dev.mysql.com/doc/refman/8.0/en/sql-statements.html

**MySQL Workbench Guide: MySQL Workbench Manual**:

**URL**: https://dev.mysql.com/doc/workbench/en/

**MySQL SQL Syntax and Commands**:

https://dev.mysql.com/doc/refman/8.0/en/functions.html

**W3Schools MySQL Tutorial**:

**URL**: https://www.w3schools.com/mysql/

**TutorialsPoint MySQL Tutorial**:

**URL**: https://www.tutorialspoint.com/mysql/index.htm

**MySQL Official Blog**:

**URL**: https://blogs.oracle.com/mysql/

**Stack Overflow - MySQL Questions**:

**URL**: https://stackoverflow.com/questions/tagged/mysql

**SQLZoo MySQL Tutorial**:

**URL**: https://sqlzoo.net/wiki/MySQL_Tutorial

**Database Journal - MySQL**:

**URL**: http://www.databasejournal.com/features/mysql/

**Planet MySQL**:

**URL**: https://planet.mysql.com/

S**TRRAT Malware – Active IOCs**:

**URL**: https://www.rewterz.com/threat-advisory/strrat-malware-active-iocs

This guide provides step-by-step instructions for downloading, installing, and configuring MySQL on your local machine, setting up the MySQL Threat IoCs Database, exporting the database data, and managing the project with GitHub using PowerShell

**Part 1**: **Downloading and Installing MySQL**

**Step 1**: **Download MySQL Installer**

  **1**. Visit the MySQL Website: Go to the MySQL Downloads page.
       
    https://dev.mysql.com/downloads/installer/
  
  **2**. Choose Your Version: Select the "MySQL Installer for Windows" (for Windows users) or the appropriate package for your operating system.
     
  **3**. Download: Click the "Download" button for the version you need. Choose the "MySQL Installer (web or full)" option.

**Step 2**: **Install MySQL**

**1**. Run the Installer: Locate the downloaded .msi file (for Windows) or appropriate installer for your OS, and double-click to run it.

**2**. **Choose Installation Type**:

- Developer Default: Includes all MySQL products and tools.
- Server Only: Installs only the MySQL Server.
- Client Only: Installs MySQL Workbench, Shell, and other client tools.
- Custom: Allows you to select specific components.
- Full: Installs all available components.

For a comprehensive installation, choose **Developer Default**.

3. **Proceed with Installation**: Follow the prompts to install MySQL. The installer will guide you through the setup process, including configuring MySQL Server.

**Step 3**: **Configure MySQL Server**

**1**. **Server Configuration**: The installer will prompt you to configure the MySQL Server.

- **Config Type**: Choose "Development Machine" for a typical developer setup.
- **Connectivity**: Leave the default options (TCP/IP, Port 3306).
- **Authentication**: Set up a strong root password, and optionally create additional users.

**2**. **Windows Service**: If you're on Windows, MySQL will be installed as a Windows service. You can choose to start MySQL Server at system startup.

**3**. **Apply Configuration**: Review your settings and apply the configuration.

**4**. **Finish**: Once the configuration is complete, click "Finish" to complete the installation.

**Part 2**: **Downloading and Installing MySQL Workbench**

**Step 1**: **Download MySQL Workbench**

**1**. **Go to the MySQL Workbench Downloads Page**: Visit the MySQL Workbench page.

  https://dev.mysql.com/downloads/workbench/
 
**2**. **Select Version**: Choose the version of MySQL Workbench that is compatible with your operating system.

**3**. **Download**: Click the "Download" button and follow the prompts to save the installer file to your computer.

**Step 2**: **Install MySQL Workbench**

**1**. **Run the Installer**: Locate the downloaded **.msi** file (for Windows) or appropriate installer for your OS, and double-click to run it.

**2**. **Follow the Installation Steps**: Follow the on-screen instructions to complete the installation.

**3**. **Launch MySQL Workbench**: Once installed, launch MySQL Workbench from your Start Menu or Applications folder.

**Part 3**: **Configuring MySQL Workbench and Setting Up the Database**

**Step 1**: **Connect to MySQL Server**

**1**. **Open MySQL Workbench**: Launch MySQL Workbench.

**2**. **Create a New Connection**:
   
- Click the + icon next to "MySQL Connections" to create a new connection.
- **Connection Name**: Enter a name for your connection (e.g., "Local MySQL Server").
- **Hostname**: Enter localhost.
- **Port**: The default MySQL port is 3306.
- **Username**: Enter root or the username you created during installation.
- **Password**: Click "Store in Vault" and enter your password.
- Click "Test Connection" to ensure everything is configured correctly.

**3**. **Save and Connect**: If the connection test is successful, click "OK" to save the connection and then double-click on it to connect to your MySQL Server.

Step 2: Create the threat_iocs Database

**1**. **Open a New SQL Tab**: Click on the "SQL Editor" button to open a new SQL query tab.

**2**. **Execute SQL Queries**:
   
- Copy and paste the following SQL commands into the SQL tab.
- Execute them one by one by clicking on the "Execute" button (lightning bolt icon).

**2.1 Drop the Existing Database**:  

  **Command**: DROP DATABASE IF EXISTS threat_iocs;

![existing_threat_iocs](https://github.com/user-attachments/assets/59242461-3213-4e31-b9d3-cfdc4d06c595)

**Figure 1**: This ensures that the threat_iocs database starts with a clean slate

2.2 Create the New Database:

**Command**: CREATE DATABASE threat_iocs;
USE threat_iocs;

![new_threat_iocs](https://github.com/user-attachments/assets/e0968be5-11c0-46d5-8c13-7aba64b7ce21)

**Figure 2**: This creates the threat_iocs database for storing threat intelligence data and selects it for use.

**2.3 Set Character Encoding and Collation**:

**Command**: SET NAMES utf8;
SET character_set_client = utf8mb4;

![character_Encoding](https://github.com/user-attachments/assets/d790f950-293a-40b8-8561-f8021cb78859)

**Figure 3**: These settings support a wide range of characters, ensuring compatibility with various languages and symbols

**2.4 Create the threat_actors Table**:

**Command**: CREATE TABLE threat_actors (
  actor_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  description text DEFAULT NULL,
  country varchar(50) DEFAULT NULL,
  motivation varchar(100) DEFAULT NULL,
  last_activity date DEFAULT NULL,
  PRIMARY KEY (actor_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![threat_actors_Table](https://github.com/user-attachments/assets/e3f08610-a05f-44bd-acc7-01cd096c1167)

**Figure 4**: This table stores information about threat actors, including their name, description, country of origin, motivation, and the date of their last known activity.

**2.5 Create the iocs Table**:

**Command**: CREATE TABLE iocs (
  ioc_id int(11) NOT NULL AUTO_INCREMENT,
  ioc_type varchar(50) NOT NULL,
  indicator varchar(255) NOT NULL,
  description text DEFAULT NULL,
  confidence tinyint(4) DEFAULT NULL,
  first_seen date DEFAULT NULL,
  last_seen date DEFAULT NULL,
  PRIMARY KEY (ioc_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![iocs _Table](https://github.com/user-attachments/assets/ed8f6ef5-5afd-45d4-b50a-41da23bede5e)

**Figure 5**: This table stores Indicators of Compromise (IoCs), including their type, value, description, confidence level, and dates of first and last sightings.

**2.6 Create the threat_actor_iocs Linking Table**:

**Command**: CREATE TABLE threat_actor_iocs (
  actor_id int(11) NOT NULL,
  ioc_id int(11) NOT NULL,
  relationship varchar(100) DEFAULT NULL,
  PRIMARY KEY (actor_id, ioc_id),
  FOREIGN KEY (actor_id) REFERENCES threat_actors (actor_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (ioc_id) REFERENCES iocs (ioc_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![threat_actor_iocs_Linking_Table](https://github.com/user-attachments/assets/185a84e0-10c2-4be5-801d-0f7eb2b70904)

**Figure 6**: This table establishes a many-to-many relationship between threat actors and IoCs, allowing you to associate specific IoCs with threat actors.

**2.7 Create the campaigns Table**:

**Command**: CREATE TABLE campaigns (
  campaign_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  description text DEFAULT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  status varchar(50) DEFAULT NULL,
  PRIMARY KEY (campaign_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![campaigns_Table](https://github.com/user-attachments/assets/6fcfae91-cd44-4cac-9256-2efb7db0e368)

**Figure 7**: This table stores information about campaigns linked to threat actors, including the campaign’s name, description, start and end dates, and status.

**2.8 Create the threat_actor_campaigns Linking Table**:

**Command**: CREATE TABLE threat_actor_campaigns (
  actor_id int(11) NOT NULL,
  campaign_id int(11) NOT NULL,
  role varchar(100) DEFAULT NULL,
  PRIMARY KEY (actor_id, campaign_id),
  FOREIGN KEY (actor_id) REFERENCES threat_actors (actor_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (campaign_id) REFERENCES campaigns (campaign_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![threat_actor_campaigns_Linking_Table](https://github.com/user-attachments/assets/845dddb3-1215-4d3b-8168-68999ef41c21)

**Figure 8**: This table associates campaigns with specific threat actors, defining the role of each actor within a campaign

**2.9 Create the attack_techniques Table:**

**Command**:  CREATE TABLE attack_techniques (
  technique_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  description text DEFAULT NULL,
  mitre_id varchar(50) DEFAULT NULL,
  PRIMARY KEY (technique_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![attack_techniques_Table](https://github.com/user-attachments/assets/8d47a08b-e1da-4547-98c9-b02a785ebc0a)

**Figure 9**: This table stores information about attack techniques, including their name, description, and associated MITRE ID.

**2.10 Create the campaign_techniques Linking Table**:

**Command**: CREATE TABLE campaign_techniques (
  campaign_id int(11) NOT NULL,
  technique_id int(11) NOT NULL,
  used_date date DEFAULT NULL,
  PRIMARY KEY (campaign_id, technique_id),
  FOREIGN KEY (campaign_id) REFERENCES campaigns (campaign_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (technique_id) REFERENCES attack_techniques (technique_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

![campaign_techniques_Linking_Table](https://github.com/user-attachments/assets/3aee9c45-a235-45d8-b1ce-ca03550ccd4a)


**Figure 10**: This table associates attack techniques with campaigns, including the date the technique was used.

**Step 3**: **Add STRATT Malware IoCs**

**Command**: INSERT INTO iocs (ioc_type, indicator, description, confidence, first_seen, last_seen)
VALUES
('hash', 'e61ec62c05f24d878432305d47cf1a72', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10'),
('hash', '804ec801d0a79815e32834b36edfc65b', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10'),
('hash', '3d6c063d9183feff60847c81ca1f4e26', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10'),
('hash', 'd28e484be0922fce5018edc36e4e7c7b', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10'),
('hash', 'df70f0abbbf32f86ff5e2426e5c89463', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10'),
('hash', '6c6b4b50258f73741044e91698ff2254', 'STRATT malware hash', 90, '2024-08-10', '2024-08-10');

![adding_stratt_iocs](https://github.com/user-attachments/assets/a3a33c8b-bbb9-4fab-a82c-267c60e95523)

**Figure 11**: Adding the Indicators of Compromise (IoCs) for the STRATT malware in the MySQL database

**Part 4**: **Exporting MySQL Data and Importing it to GitHub via PowerShell CLI**

**Step 1**: **Exporting the MySQL Database**

**1**. **Export the Database**:

- Open MySQL Workbench.
- Go to the **Administration** tab.
- Select **Data Export**.
- Select the **threat_iocs** database.
- Choose **Dump Structure** and **Data**.
- Specify the export path and save it as a **.sql** file.

Alternatively, you can export the database using the CLI:

**Bash**: mysqldump -u root -p threat_iocs > C:\path\to\your\directory\threat_iocs.sql

**Step 2**: Prepare the Exported Data for GitHub

**1**. **Navigate to the Project Directory**:

- Use PowerShell to navigate to the directory where you saved the .sql file:

**PowerShell**: cd C:\path\to\your\directory

**2**. **Add the SQL File to the Repository**:

**PowerShell**: git add threat_iocs.sql

**3**. **Commit the SQL File**:

**PowerShell**: git commit -m "Added exported MySQL Threat IoCs Database."

**4**. **Push the SQL File to GitHub**:

**PowerShell**: git push

**Part 5**: **Managing the Project with GitHub Using PowerShell**

**Step 1**: **Navigate to the Project Directory**:

Open PowerShell and navigate to the directory where your SQL schema files are located. For example:

**PowerShell**: cd C:\Users\james\Documents\GitHub\MySQL_Schema

**Step 2**: **Initialize a New Git Repository**

Initialize a new Git repository in your project directory.

**PowerShell**: git init

**Step 3**: **Add Files to the Repository**

Add all the files in your directory to the Git staging area.

**PowerShell**: git add .

**Step 4**: **Commit Your Changes**

Commit the added files to your Git repository with a meaningful message.

**PowerShell**: git commit -m "Initial commit: Added MySQL Threat IoCs Database schema files."

**Step 5**: **Create a New Repository on GitHub**

Go to your GitHub account, create a new repository named mysql-threat-iocs-database, and leave it empty (without a README, .gitignore, or license).

**Step 6**: **Add the Remote Repository**

Add the remote repository to your local Git configuration. Replace <yourusername> with your actual GitHub username.

**Step 7**: **Push the Local Repository to GitHub**

Push your local commits to the remote repository on GitHub.

**Step 8**: **Verify the Repository on GitHub**

Go to your GitHub repository at https://github.com/jbanday808/mysql-threat-iocs-database and verify that your files have been successfully uploaded.

**Step 9**: **Update the Repository as Needed**

As you make changes to your database schema or add more IoCs, you can commit these changes and push them to GitHub using the following commands:

**9.1 Stage the Changes**:

**PowerShell**: git add .

9.2 Commit the Changes:

**PowerShell**: git commit -m "Updated database schema and added new IoCs."

9.3 Push the Changes to GitHub:

**PowerShell**: git push

**Conclusion**:

By following this comprehensive guide, you will have successfully downloaded, installed, and configured MySQL, set up the MySQL Threat IoCs database, exported the database data, and managed your project with GitHub using PowerShell. This process ensures that you have a version-controlled environment for your database schema, allowing for continuous updates, collaboration, and efficient management of your IoCs data.

