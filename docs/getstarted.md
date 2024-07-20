# Get started

---

## Installation

Depending on your need, SCARt can be install by your own technical department or by
our technical partners.

For testing purposes, you can use the standalone docker version which can easily setup 
in a local environment. You can get a first impression of the tool. For more details, 
see the [Testing installation guide](installation/test.md). 

When you want to have a local installation of SCARt and don't get that many reports, 
you can install SCARt in a webserver environment. For more details, see the 
[Webserver installation guide](installation/webserver.md).

When you are a hot- or helpline with more then 2 analysts and are processing more then 
100 reports each day, then you are adviced to use the professional service from the 
S3group. This is also an option when you or your organization don't have the technical 
skills to setup or maintain a SCARt hosting environment. For more details, 
see [SCARt as a Service](installation/saas.md).

## General description

The primary workflow in SCART is based on automatically scraping input URL's, let 
the analyst classify (annotate) these and automatically sending hosters Notice 
and Take Down (NTD'S) emails to the hosters with the URL's of illegal images. 

The import can be done manual, but also automatically be read by SCARt from ICCAM 
(Inhope) and website forms. 
See chapter [Import](basic/import.md).

The classification can be done based on default questions provided in SCARt, but you 
can add your own questions. Each image can be viewed and marked as illegal or not 
illegal. Also you can set "first police" by which the URL's first are send to the 
Law Enforcement Agency (LEA) contact you provided. 
See chapter [Classification](basic/classification.md).

After classification SCARt will monitor the illegal classified URL's. For each hoster 
the URL's are grouped within one NTD. Periodally the URL's are checked if the image 
is still online. If so, a new NTD's will be send. 
See chapter [NTD](basic/ntd.md)....

Important is that all information in SCARt can be exported for statics or other 
reasons.  
See chapter [Report](basic/report.md).

Within SCARt different kind of functions are included such as:

- Automatic rules based on a domain specification
- Maintenance of abuse contacts 
- Workflow management sending to LEA
- workflow management change of hosting information
- maintenance of own source definitions
- maintenance of own NTD (email) templates
- Cloudflare lookup of the real IP address
- block days on which NTD's will not be send

Start with going through the basics, use it and check the details for help. 
 

## Abbreviations & terms

| Term     | Description                                                                                                    |
|:---------|:---------------------------------------------------------------------------------------------------------------|
| SCART    | Sexual Child Abuse Reporting Tool, <https://scart.io>                                                          |
| YAML     | Yet Another Markup Language, <https://en.wikipedia.org/wiki/YAML>                                              |
| URL      | Uniform Resource Locator, eg <https://www.example.com>                                                          |
| Referrer | Identifies the address of the web page (url) from which the resource has been requested                        |
| Scrape   | The process of getting the images from a web page uniquely addressed by the url                                |
| LEA      | Law Enforcement Agency is any government agency responsible for law enforcement within a specific jurisdiction |
| mainurl  | The report with image (media) content items attached to it |
| imageurl | A content item existing of a image or video or other internet content |


## Used standards in the text 

Reference to functions are made in uppercase. So for example INPUTS or CLASSIFY refer to this function
in the main menu of SCARt.



