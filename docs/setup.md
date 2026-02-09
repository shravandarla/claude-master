# Development Setup

## Prerequisites

> List the tools and versions required to work on this project.

- Node.js >= 18 (or Python >= 3.11, Go >= 1.21, etc.)
- Git
- Docker (optional, for local services)

## Quick Start

```bash
# Clone the repository
git clone <repo-url>
cd <project-name>

# Install dependencies
npm install        # or: pip install -r requirements.txt

# Set up environment variables
cp .env.example .env
# Edit .env with your local configuration

# Run database migrations
npm run migrate    # or: python manage.py migrate

# Start development server
npm run dev        # or: python manage.py runserver
```

## Environment Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `DATABASE_URL` | Database connection string | Yes | - |
| `PORT` | Server port | No | 3000 |
| `LOG_LEVEL` | Logging verbosity | No | "info" |

## Running Tests

```bash
# Unit tests
npm test

# Integration tests
npm run test:integration

# All tests with coverage
npm run test:coverage
```

## Common Tasks

### Adding a new dependency
```bash
npm install <package-name>
```

### Creating a database migration
```bash
npm run migrate:create -- --name <migration-name>
```

### Linting
```bash
npm run lint
npm run lint:fix
```
