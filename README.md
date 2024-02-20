# Rails Monolith Service
## Installation
1. Docker and docker-compose
2. ```bash
    docker compose -f docker-compose.development.yml up -d --build
   ```
3. ```bash
    docker exec rails-app rails db:create
   ```
7. ```bash
    docker exec rails-app rails db:migrate
    ```
8. Rebuild
    ```bash
    docker compose -f docker-compose.development.yml up -d --build --force-recreate
    ```
9. `http://localhost:3000`
