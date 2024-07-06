# Notice & Take Down

---

Within the NTD function you can find the Notice & Take Down (NTD) messages send 
and which are waiting te be send.

## Sending NTD's

There are a number of moments when SCARt starts a NTD:

- after classify and when the hoster of illegal material is local (country)
- after 24 hours when the illegal content is still online
- when marked as POLICE in classify (ntd to police contact)
- when send LEA in POLICE (ntd to LEA contact)

After "starting" a NTD, SCARt will group urls for the samen abusecontact until the 
hour-threshold is reached. 

Default hour-thresholds:

- FIRST NTD hoster; 1 hour
- FIRST POLICE; 1 hour
- SEND LEA; 1 hour
- NEXT NTD hoster; 24 hour

Note: these thresholds can be set invidual for each SCARt environment.

Before actual sending a NTD, SCARt will last minute check for each attached url 
if the hoster is still the same. If not, the url will be removed from the NTD.

## NTD email template 



