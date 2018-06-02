# ethereum-voting-api
An api for a voting app built on ethereum.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine

### Prerequisites

* [Nodejs](https://nodejs.org/en/) - The web framework used
* [Ganache](https://github.com/trufflesuite/ganache) - Simulates an ethereum network for local development
* Truffle - development environment for ethereum. Can be installed with
      ```
      $ npm install -g truffle
      ```

### Installing

A step by step series of examples that tell you how to get a development env running

Clone this repo

```
$ git clone git@github.com:ShemManyu/ethereum-voting-api.git
```

Install dependencies

```
$ npm install
```
Change into truffle/ directory
```
$ cd truffle
```
Make sure ganache is running get the port it is running on in localhost and make sure is same as the one in truffle.js file.
Compile contracts and deploy to the ganache network.
```
$ truffle compile
$ truffle deploy --reset --network ganache
Running migration: 2_vote.js
  Replacing vote...
  ... 0x301d03eafc4f6bc13b26ca5771a6b6e783f47f710b2ed5bbad8288d7a2646a6e
  vote: 0x4610b7b59920b760d1164406a6f13f09043b6af3
Saving artifacts...

```
Get the vote contract string in this case``` 0x4610b7b59920b760d1164406a6f13f09043b6af3``` and replace the contract variable in the index.js file
(line 8) this string will change evrytime you do a truffle deploy.

Go one directory up and run the index.js file to get node running

```
$ node index.js
```
If no errors show up you can do GET and POST requests to cast and retrieve votes. There are only two candidates

GET Vote count for candidate 1

```
$ curl -X GET http://localhost:8080/count/1

"0"
```
To cast vote you'll need the address of an account on the ganche network.
To vote for candidate 1
```
$ curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "candidate=1&account=0x25660625C2919b6998c5dD7300ACE7a03db89855" http://localhost:8080/vote 
```
Running get again you can see the count was incremented

```
$ curl -X GET http://localhost:8080/count/1

"1"
```

Once the address of an account has been used to vote it cannot be used again.
When we try to vote for candidate 2 with the same account

```
$ curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "candidate=2&account=0x25660625C2919b6998c5dD7300ACE7a03db89855" http://localhost:8080/vote 

"Account has already voted"
```
