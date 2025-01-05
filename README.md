# README

## Quick Start on Local Machine

### 1. Populate the Environment Variables
Copy the `.env.example` file to `.env` and fill up the variables
```sh
cp .env.example .env
```

### 2. Spin Up Docker Containers
Run the following command to start the Docker containers
```sh
docker-compose up -d
```

### 3. Accessible Endpoints
GraphQL:
http://localhost:3000/graphql

GraphQL Query Editor:
http://localhost:3000/graphiql

## Demo:
Use Postman app to query:

Queries:
 - menu
 - menus

Mutations:
 - updateModifier 

## Question:
What metrics would be good to track to understand the application performance?

The following metrics should be tracked:

1. Latency - Measures the average response time for requests. It helps to gauge the responsiveness of the application. High latency may affect user experience while low latency ensure smooth interactions and better customer satisfaction.
2. Throughput - Tracks the number of requests per minute (RPM).It provides insight into the system's capacity to handle traffic. Monitoring throughput provides valuable insights into the system's ability to scale up or down to meet demand.
3. Error Rate - Monitors the total number of errors occurring in the system.
It identifies reliability issues and helps assess the stability of the system.
4. Database Performance - Tracks query response times from the database. Regular monitoring allows for optimization of database queries, leading to faster data retrieval, reduced load, and better system responsiveness.
5. Uptime and Availability - Measures the system's downtime or periods of unavailability. A high uptime percentage indicates the reliability of the service, while periods of unavailability can harm business operations and customer trust.