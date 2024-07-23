# Webform Import & Handling manual

---

(note: release 6.5 build 24 or later)

## Introduction

With the Webform import functionality different kind of webforms (website and/or 
webapplication) inputs can be processed by SCART. A webform with only an url input 
field can be setup, but also a webform with a text field and no url input. The 
webform definition in SCART can be configured so no url is needed (no scrapping 
will be done) and the webform information can be directly send to the police from 
within SCART.

## Webform definitions

In SCART you go to SETTINGS -> Import webforms for the webform definitions.

![img.png](../images/img.png)

The you can define a Webform.

| Name           |Unique name of this definition|
|----------------|:-|
| Description    |(optional) description of the purpose of the webform|
| Import subject |Unique email subject prefix |
| Set status     |The next status in SCART when successfully imported |
| Fields         |A list of webform input fields|

You can define several (webform input) fields. The import function will try to map 
each field to a field within SCART. The basic fields are url, referrer and note. 
When importing, SCART will put the imported values from these fields into the 
corresponding field in SCART. The fields url and referrer will be validated based 
on the uniform resource locator (url) pattern.

You can also set the import field on “(extra attribute)”. Then this field will be 
imported as extra attribute, and the name of the field can be anything.

## Import email format

The import mail function uses for importing the webform fields the so called YAML 
format (Yet Another Markup Language). The purpose of this format is to have a 
human-readable data serialization language which simple can be read by the computer.

Note: a good tutorial about the YAML format you can find here: 
<https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started>

This format can be used within the body from the import email with all (or a subset) 
of fields included. An example email body text is:

> url: www.s3group.nl \
> text: this is a note \
> custom: this a custom field 

a complete example of such a email is:

![img_4.png](../images/img_4.png)

Each SCART environment has his own specific import email address. Please ask you 
SCART system admin to get this email address. Also note that your sender email 
address has to be on the whitelist in SCART so the import emails will be 
handled (this is for security reasons).

## Direct to police - LEA contacts

When the “set status” field in the webform is set on ”Direct police”, the import 
webform can directly be handled within the POLICE function (see next paragraphs).

Under ABUSECONTACTS you can (must) specify which contacts can be used as LEA contact.
Simple check the box “Law enforcement agency (LEA) contact” in the Abusecontact 
detail function.

# Handling

## Webforms scrape enabled

When you set the “set status” field in the webform on “Open” or “Scrape”, SCART 
will try to scrape the imported report. Note that an url field has to be present 
in the import email.

## Webforms text only

When you set the “set status” field in the webform on “Direct police”, SCART will 
not scrape this report and send it directly to the POLICE function.

In the POLICE function you see for example:

![img_2.png](../images/img_2.png)

When you check a report and then click on Send to LEA you get something like:

![img_3.png](../images/img_3.png)

You can select the LEA contact, (optional) the template and can give extra LEA info.

## Email template format

You can use within the template body references to the specific webform fields. 
Standard the next fields are available:

- Input.url
- Input.note
- Input.referer

The other fields (extra attributes) can be used by there custom name.

An example body text is:

> Dear Sir/Madam, \
> \
> We have received the following info for you: \
> {input.note} \
> \
> Extra LEA info: \
> {input.ntd_note} \
> \
> Extra field: {extra_field} \
> \
> With kind regards

You can use this in the body part in a general (NTD) template or in a specific one 
in an abusecontact.

## Reporting 

Within the function Report also the “text only” or “no url” reports can be exported. 
This can simple be done by filtering on CLOSE and UNSET classification. 

It is preferable to select under COLUMNS only the useful columns. You can here also 
specify the columns "LEA" which is filled with "y" when the report is send to a LEA.

