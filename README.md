# NAP Demo

## Introduction
NGINX App Protect combines the proven effectiveness of F5's advanced WAF technology with the agility and performance of NGINX Plus. Read more [here](https://www.nginx.com/products/nginx-app-protect/web-application-firewall)

The purpose of this repo is to provoide and easy setup for learning and demonstration NGINX NAP.

You may also want to check out [NGINX NAP DoS Demo](https://github.com/mcheo-nginx/nap-dos-demo) separately.
<br/>


# Setup

0. Build NAP Docker image</br>
Follow the instruction in the official doc to build a local docker container app-protect image. https://docs.nginx.com/nginx-app-protect/admin-guide/install/#docker-deployment


1. Clone the repo
```
git clone https://github.com/mcheo-nginx/nap-demo.git
cd nap-demo
```

In this repo, the "container" folder contains Dockerfile to build the NAP image. You are required to have NGINX NAP Subscription. You may request a trial license [here](https://www.nginx.com/free-trial-request/)
To build an image:
```
#copy nginx-repo.crt and nginx-repo.key into the folder
docker build --no-cache -t app-protect .
```


2. Step up the stacks
```
docker-compose -f docker-compose.yaml up -d
```

The stack consists of 3 containers:
- NGINX App Protect instance
- Backend app server (Hackazon)
- Elasticsearch for NAP dashboard


3. Complete Elasticsearch setup</br>
Use browser to visit http://localhost:5601, once the page loads successfully which means startup has completed, execute the following steps:
```
cd kibana
sh setup_elk.sh
```
<br/>


# Testing
You may refer to this [user guide](https://www.rapid7.com/globalassets/external/docs/download/AppSpider_Hackazon_User_Guide.pdf) for ideas on how to exploit Hackazon vulnerabilities. Page 34-42 requires no additional tools to test.

Use your browser to visit http://localhost:8080 (unprotected) and visit http://localhost (protected with NAP policy), and to see the difference when there are violations/exploits.

You may also use the simple script to generate sample violation traffics.
```
sh badtraffic.sh
```
<br/>

# Dashboard
Visit http://localhost:5601 and click into Discover or Dashboard to see the traffics/violations.

Please refer here for extra [reference](https://devcentral.f5.com/s/articles/Dashboards-for-NGINX-App-Protect)

<br/>

# Additional
There are additional samples of logformat and policies files, you may use them for testing and learning purposes.
