# Domain rules

---

In SCARt rules can be used to:

- mark an URL domain with "do not scrape"
- force an URL domain to a hoster 
- force an URL domain to a registrar
- mark an URL domain to send the NTD also to a site owner
- use a proxy service for getting the IP of an URL domain
- direct classify ILLEGAL an URL domain
- direct classify NOT ILLEGAL an URL domain
- connect a link checker from a hoster to an URL domain

Rules can be maintenanced by the RULES function from the main menu and also within the 
CLASSIFY specific based on the domains of the working reports.  

## Domain specification

The rules works on searching for patterns in the URL based on the domain specification in 
the rule. 

Note that the "www" is automatically removed before matching. 

Examples:

- domain.com; matches https://www.domain.com, https://domain.com, https://domain.com/page
- sub.domain.com; matches https://sub.domain.com, but NOT https://domain.com/
- .onion; matches https://www.domain.onion, http://domain.onion, https://domain2.onion


## Do not scrape RULE

Sometimes specific URL you don't want to be scraped but to handle manual. Then you can 
make this rule. The reports will be available in the INPUTS function without being scrapt.

## Force hoster or registrar

If the hoster is hidden or the local WhoIs is not mathcing the right hoster and/or registrar, 
you can force SCARt to assign a hoster or registrar based on the domain in the URL.

## Send also to site owner

Sometimes a site owner is reacting sooner then the hoster or registrar. You then want to 
send the NTD to this site owner abuse contact also. 

With this rule you can set that the NTD (with abuse URLs) is also send to the site owner 
in the same frequence as the NTD send to the hoster.

## Use proxy services

There are two rules important for assigning an IP to a domain based on proxy services.

First there is the "Proxy service API" rule. With this rule you set in SCARt that specific 
abuse contacts does has an API to get the real IP from a domain. On this moment this 
service is only provided by CloudFlare. Your organization needs permission and an account 
to use this Cloudflare service. 

Note: you have to share the account information with the SCARt service provider so it can 
be used.

Secondly you can make a "Proxy service owner" rule. With this rule you can force an IP 
to a specific domain. When you set in this rule also an Proxy service contact (such as 
Cloudflare), this proxy service is used to automatically get the (real) IP.

## Direct classify

Sometimes the classification can be done automatically based on a domain specification in 
an URL. This can be done with the "Direct classify" rule. For the ILLEGAL and NOT ILLEGAL 
the questions will be used as defined for a mainurl.   

WHen an URL matches a Direct classify rule, the classification is set and the report is 
directly set on the check online status. A NTD is send if applicable, also ICCAM actions 
are don and the URL is being monitored in the check online status if the hoster is found 
local (country). 

## Link checker

Some hosters provide a link checker (API) which can be connect to SCARt for getting the 
online status. In this way the hoster can also remove the illegal URL automatically.   

For each provider the specific API has to be implemented. Please contact your SCARt
(service) provider for more information.












