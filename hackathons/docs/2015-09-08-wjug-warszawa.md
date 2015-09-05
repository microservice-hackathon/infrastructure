Microservice Hackathon
======================

Welcome to the Microservice Hackathon!

Here you find all information required for you to work during the Hackathon.

# Link to the presentation

[Presentation about microservices](https://docs.google.com/presentation/d/17cCAQ1wBE6qkBuIgFQWOME3T9ARMKRa88JC32kIwFMo/)

# Ok what should I do now? 

## Clone the GIT properties repository to your computer

Run this command (if you have sent your SSH key to Github)

```
git clone git@github.com:microhackathon-2015-03-juglodz/properties.git

```

or if you can't conect to Github via ssh

```
git clone https://github.com/microhackathon-2015-03-juglodz/properties.git

```

## Set environment variable for GIT properties

For Linux

```bash
### Configuration which should be placed on server where app is deployed
# Environment where our app is deployed, configuration will be taken from corresponding dir
export APP_ENV="prod"
# Git repository with configuration. Absolute path should be used.
export CONFIG_FOLDER="/path/to/your/checked/out/git/repository"
# For secretProd env, ENCRYPT_KEY is required.
# Use encrypt.key if you pass it as -D option when running java
export ENCRYPT_KEY="secretEncryptKey"

```

For Windows

either do it via some UI or run this command

```batch
rem ### Configuration which should be placed on server where app is deployed
rem Environment where our app is deployed, configuration will be taken from corresponding dir
@set APP_ENV="prod"
rem Git repository with configuration. Absolute path should be used.
@set CONFIG_FOLDER="C:/path/to/your/checked/out/git/repository"
rem For secretProd env, ENCRYPT_KEY is required.
rem Use encrypt.key if you pass it as -D option when running java
@set ENCRYPT_KEY="secretEncryptKey"

```

For easy microservice execution just modify the proper `/scripts/run.sh` or `/scripts/run.bat` to include the path to your git repo

## Clone your microservice and start coding!

Well, let your team pick a service and start coding. Once you commit and push,
Jenkins will build that for you and upload your JAR to nexus. Next Rundeck will
deploy your application to the apps server. 

Each of the microservices will have a predefined port at which it will listen
to requests so you don't have to worry about that.

# I have a UI based microservice - where is my readme?!

Check this out [boot-microservice-gui-readme](https://github.com/4finance/boot-microservice#boot-microservice-gui--). Just scroll to the very bottom ;)

# I have a backend based microservice - where is my readme?!

Check this out [boot-microservice-readme](https://github.com/4finance/boot-microservice)

# I have to implement a microservice with a DB - what should I do?

For a relational DB use H2 in memory.

For a NoSQL one use [Fongo](https://github.com/fakemongo/fongo) in compile scope.

# How to run my microservice locally

It's all there in the readme - [boot-microservice-readme](https://github.com/4finance/boot-microservice)

# Architecture

## Architecture draft

[Click to see the draft](https://docs.google.com/document/d/1yRV5DNJAhBH73bJo-s5L8wwoeJG4Ke6H45dg8_rRT84/edit?usp=sharing)

## Architecture plan

[Click to see the plan](https://drive.google.com/file/d/0B4mHLrLla3S8VHd3QXZrZ25yb1U/view?usp=sharing)

## Formats of incoming messages (only suggestion! decide yourself)

### FraudDetectionService

PUT /api/loanApplication/{loanApplicationId}

```json
{
    "firstName" : "text",
    "lastName" : "text",
    "job" : "text",
    "amount" : number,
    "age" : number
}
```

###LoanApplicationDecisionMaker

PUT /api/loanApplication/{loanApplicationId}

```json
{
    "firstName" : "text",
    "lastName" : "text",
    "job" : "text",
    "amount" : number,
    "fraudStatus" : "text"
}
```

GET /api/loanApplication/{loanApplicationId}
```json
{
    "applicationId" : "text",
    "result" : boolean
}
```

###ClientService

POST /api/client

```json
{
    "firstName" : "text",
    "lastName" : "text",
    "age": number,
    "loanId" : "text" (This is actually the loan application identifier.)
}
```
###LoanApplicationService

POST /api/loanApplication

```json
{
    "amount": number,
    "loanId" : "text" (This is actually the loan application identifier.)
}
```

###ReportingService

POST /api/client

```json
{
    "firstName" : "text",
    "lastName" : "text",
    "age": number,
    "loanId" : "text" (This is actually the loan application identifier.)
}
```

POST /api/reporting

```json
{
    "loanId" : "text",
    "job" : "text",
    "amount" : number,
    "fraudStatus" : "text",
    "decision" : "text"
}
```

###MarketingOfferGenerator

PUT /api/marketing/{loanApplicationId}

```json
{
    "person" : {
        "firstName" : "text",
        "lastName" : "text"
    },
    "decision" : "text"
}
```

GET /api/marketing/{firstName}_{lastName}

```json
{
    "marketingOffer" : "text"
}
```
