# Architectural

---

## Application 

The application is based on the following Model-View-Controle frameworks:

- Laravel version 9.1 or higher
- WinterCMS version 1.2.5 or higher

The Model-View-Controller (MVC) framework is an architectural/design pattern that separates 
an application into three main logical components Model, View, and Controller. 
Each architectural component is built to handle specific development aspects of an application. 
It isolates the business logic and presentation layer from each other. It was traditionally 
used for desktop graphical user interfaces (GUIs). Nowadays, MVC is one of the most frequently
used industry-standard web development frameworks to create scalable and extensible 
applications.

![img.png](img.png)

Futhermore Object-Oriented Programming (OOP) is used for development of the software. 
OOP is a programming paradigm based on the concept of objects, which can contain data 
and code: data in the form of fields (often known as attributes or properties), and 
code in the form of procedures (often known as methods). In OOP, computer programs 
are designed by making them out of objects that interact with one another.

Important is the use of the WinterCMS framework. SCARt uses as much as possible the 
standard functionality of this framework. See here for the [WinterCMS Development Guide](https://wintercms.com/docs/v1.2/docs/architecture/developer-guide).

SCARt also adapts the version numbering of "major.minor.point". For example v1.0.1 or v5.3.2.

- **major**; should be increased for substantial changes made to the plugin, such as complete 
rewrites or pivoting of the purpose of the plugin. These changes are assumed to be 
backwards-incompatible and will require manual intervention by the users of the plugin. 
- **minor**; should be increased for smaller changes or new features that may still be 
backwards-incompatible with adequate justification. This can include changes to the 
database schema or changes to component settings. 
- **point**; should be increased for minor fixes, translation updates or very minor new 
features that maintain backwards compatibility.

Release notes are referencing to a version and contain (if applicable) the following 
elements:

- Breaking changes 
- New features
- Other changes
- Bug fixes
- Translation updates

See here for more information about the versioning: [WinterCMS plugin version history](https://wintercms.com/docs/v1.2/docs/plugin/updates).

## Containers

The MVC framework is futher enhanced in SCART by containerizing the different system 
components. This makes them scalable and provide failover functionality. With containers 
the application components are also placed in a seperate (local) network.

A basic container setup:

![basic-containers.png](basic-containers.png)

You see the basic system components. The PHP-FPM is (only) used for the frontend processing 
and servers the UI. The PHP-CRON is responsible for the background processes.

## Background processes

Within the PHP-CRON the background work exists of the following jobs:

| Name          | Description                                                                                                                           |
|:--------------|:--------------------------------------------------------------------------------------------------------------------------------------|
| ImportExport  | Import from email or ICCAM of the reports                                                                                             | 
| AnalyzeInput  | Read the imported reports, scrape them and get the WhoIs information                                                                  |
| CheckNTD      | Checks if the illegal reports are still online and if the Whois-information is unchanged (*)                                          | 
| SendNTD       | Send NTD by email (or API) to the hoster, registrar, site owner or LEA                                                                | 
| SendAlert     | Send alerts to the info mailbox about the actions done by the background jobs                                                         | 
| UpdateWHoIs   | Update the from Whois retreived information every 12 hours                                                                            | 
| CreateReports | Create the user reports (export CSV files)                                                                                            | 
| Cleanup       | Every night this background job runs to cleanup the SCARt environment (*)                                                             | 
| Archive       | In some SCARt environments the number of reports are so large, archiving is needed to keep the runtime performance optimized          | 

(*) see the dedicated chapters for more information

It's easy within docker to create a dedicated container for each of these jobs. In this 
way the performance can be optimized. 

The following container setup is an example for an optimized setup:

![containers-Performance.png](containers-Performance.png)

In this setup the ImportExport and CheckNTD are placed in seperated containers with 
their own work and resource environment.

## Realtime online check

The CheckNTD job is responsible for checking whether an URL is still online.

The standard CheckNTD job is a single PHP job (threat) which starts a headless browser and 
checks each URL. 

For bigger hotlines with a lot of illegal URLs to check, there is also the realtime version 
of the CheckNTD job. This realtime version uses pooling to start and stop dynamically threads 
for checking the online status. Configuration consist of:

- maximum time within an URL has be checked again (default 4 hours)
- minimum time after which an uRL has to be checked (default 1 hour)
- minimum time after which a worker will be spinned down (default 15 min) 

There is no limit for the number of concurrent threads other then the resources on the 
hosting server(s). 

Note that the thread job not only checks the online status of an image but also the 
Whois information. The hosting (country) information can change. On that moment the 
report is placed in the status "CHANGED". 

A report is set "offline" when 3 times after each other, with an interval of 3 minutes, the 
image (hash) is not found online. 

### Illegal content browsing 

With the docker and the threating setup, the following secure browsing environment exists:
![img_1.png](img_1.png)<br />

Within the browser container (docker), the website is analyzed and media is downloaded for 
classification. The browser context (website with illegal content) is reset after scraping 
of the website. The headless browser environment has no direct contact with the 
other SCARt components and/or server and/or SCART client user.  

The setup of this realtime version is done by the S3group. They have the knowledge to configure
and maintain this environment. Please ask your SCARt contact for more information. 


