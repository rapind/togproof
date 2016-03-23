# togProof

I'm taking advantage of recent technologies like React and Firebase to completely rewrite the previous Ruby on Rails based Grokphoto application.

The general idea will be the same. This is an open source photo proof application you can very easily self host for free other than the cost to store images with S3.

## Setup

```
git clone git@github.com:rapind/togproof.git
cd togproof
npm install
```

## Running

```
npm start
```

## Compiling the bundle.js

```
npm run prod
```

## Deploying

1. Sign up for an account at https://www.firebase.com/ and create a new application.

2. Edit the firebase.json to point at this Firebase application.

3. ``` firebase deploy ```
