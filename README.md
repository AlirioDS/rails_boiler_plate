# Rails Monolith Service
## Installation
1. Docker and docker-compose
2. Copy `.env.example` to `.env`
2. ```bash
    docker compose -f docker-compose.development.yml up -d --build
   ```
3. ```bash
    docker exec rails-app rails db:create
   ```
4. `http://localhost:3000`
