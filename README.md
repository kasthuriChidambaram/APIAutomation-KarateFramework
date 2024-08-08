
# Booking API Testing Framework

This repository contains an API testing framework built using the [Karate](https://github.com/karatelabs/karate) framework to validate all CRUD operations on the Booking API. The Booking API is an open-source project available at [Restful Booker](https://restful-booker.herokuapp.com/apidoc/index.html).

## Introduction

This framework leverages the Karate framework to perform automated tests on the Booking API, ensuring that all CRUD operations (Create, Read, Update, Delete) work as expected. The tests are designed to be easy to read and extend.

## Features

- Automated testing for all CRUD operations:
    - **Create**: Validate the creation of new bookings.
    - **Read**: Verify retrieval of booking details.
    - **Update**: Ensure updates to existing bookings are applied correctly.
    - **Delete**: Confirm deletion of bookings.
- Easily extendable tests with clear structure.


## Prerequisites

- Java 8 or higher
- Maven

## Installation

1. Clone the repository:
   git clone https://github.com/kasthuriChidambaram/APIAutomation-KarateFramework.git
2. Install dependencies:
   mvn clean install

## Usage
The framework includes predefined test scenarios for all CRUD operations. You can find these scenarios in the '**src/test/java**' directory.

## Running Tests
1. To run all the tests, use the following Maven command:
   mvn test

2. To run a specific test, you can specify the test file:
   mvn test "-Dkarate.options=--tags @createbooking
   
