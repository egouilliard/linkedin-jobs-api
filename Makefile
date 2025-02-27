.PHONY: install build up down logs test

# Install dependencies
install:
	npm install

# Build the Docker image
build:
	docker-compose build

# Start the container
up:
	docker-compose up -d

# Stop and remove the container
down:
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# Run tests
test:
	docker-compose run --rm linkedin-jobs-api npm test
