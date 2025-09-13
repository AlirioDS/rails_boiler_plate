# Rails Boilerplate with Authentication & Authorization

A modern Rails 7.1.3 application boilerplate featuring user authentication, role-based authorization, comprehensive testing, and a responsive UI built with Tailwind CSS.

## 🚀 Features

### Core Functionality
- **User Authentication**: Complete Devise integration with custom session handling
- **Role-Based Authorization**: Pundit policies for admin and user roles
- **Responsive Dashboard**: Modern UI with Tailwind CSS
- **Database Seeding**: Automated setup of default roles (admin, user)

### Development & Testing
- **Comprehensive Test Suite**: Model, controller, and system tests
- **Error Handling**: Custom error pages and logging
- **Development Tools**: Debug helpers and enhanced logging
- **Docker Support**: Containerized development environment

### Security & Performance
- **Secure Authentication**: Devise with proper session management
- **Authorization Policies**: Role-based access control
- **Input Validation**: Model validations and parameter sanitization
- **Error Logging**: Comprehensive logging for debugging

## 🛠 Tech Stack

- **Ruby**: 3.3.0
- **Rails**: 7.1.3
- **Database**: PostgreSQL
- **Authentication**: Devise
- **Authorization**: Pundit
- **Frontend**: Tailwind CSS, Hotwire (Turbo + Stimulus)
- **Testing**: Minitest, Capybara, Selenium
- **Deployment**: Docker & Docker Compose

## 📋 Prerequisites

- Docker and Docker Compose
- Git

## 🚀 Installation & Setup

### Using Docker (Recommended)

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd rails_boiler_plate
   ```

2. **Start the application**
   ```bash
   docker compose -f docker-compose.development.yml up -d --build
   ```

3. **Setup the database**
   ```bash
   docker exec rails-app rails db:create
   docker exec rails-app rails db:migrate
   docker exec rails-app rails db:seed
   ```

4. **Access the application**
   - Open [http://localhost:3000](http://localhost:3000)
   - Default roles (admin, user) will be created via seeds
   - Create your first admin user through the registration form

### Local Development Setup

1. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

2. **Setup environment variables**
   ```bash
   cp .env.example .env
   # Edit .env file with your database credentials
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   bin/dev
   ```

## 📖 Usage

### User Roles
- **Admin**: Full access to all features and user management
- **User**: Standard user access with limited permissions

### Default Users
After running `rails db:seed`, you can:
- Create an admin user through the registration form
- Or manually create one in the Rails console:
  ```ruby
  User.create!(email: 'admin@example.com', password: 'password123', role: Role.find_by(name: 'admin'))
  ```

### Key Endpoints
- `/` - Redirects to dashboard (authenticated users only)
- `/dashboard` - Main dashboard
- `/users/sign_in` - Sign in page
- `/users/sign_up` - Registration page

## 🧪 Testing

Run the complete test suite:
```bash
rails test
```

Run specific test types:
```bash
rails test:models        # Model tests
rails test:controllers   # Controller tests
rails test:system        # System tests (requires browser)
```

## 🔧 Development

### Available Commands
```bash
bin/rails console        # Rails console
bin/rails db:migrate     # Run migrations
bin/rails routes         # View routes
bin/dev                  # Start development server with hot reload
```

### Debug Helpers
In development, you can use:
```erb
<%= debug_info %>                    # Show current user and request info
<%= debug_info(@user) %>             # Show object details
<%= development_only do %>...<% end %> # Content only shown in development
```

### Logging
- User actions are logged automatically
- Errors are logged with full backtraces
- Check `log/development.log` for detailed information

## 📁 Project Structure

```
app/
├── controllers/          # Application controllers
│   ├── application_controller.rb
│   ├── dashboard_controller.rb
│   └── users/
├── models/              # Data models
│   ├── user.rb
│   └── role.rb
├── policies/            # Pundit authorization policies
├── views/               # ERB templates
└── helpers/             # View helpers

config/                  # Rails configuration
db/                      # Database files and migrations
test/                    # Test suite
├── models/
├── controllers/
└── system/
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues:
1. Check the logs in `log/development.log`
2. Ensure Docker containers are running
3. Verify database migrations are up to date
4. Check the test suite for any failures

## 🔄 Recent Improvements

- ✅ Fixed authentication flow issues
- ✅ Added comprehensive test coverage
- ✅ Implemented role-based authorization
- ✅ Enhanced UI with modern design
- ✅ Added error handling and logging
- ✅ Improved development tools and debugging
- ✅ Updated documentation
