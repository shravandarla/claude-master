# API Reference

> Update this document as you build your API endpoints.

## Base URL

```
Development: http://localhost:3000/api
Staging:     https://staging.example.com/api
Production:  https://api.example.com
```

## Authentication

> Document your authentication method here.

```
Authorization: Bearer <token>
```

## Endpoints

### Resource: Users

#### GET /users
List all users with pagination.

**Query Parameters:**
| Param | Type | Default | Description |
|-------|------|---------|-------------|
| page | number | 1 | Page number |
| limit | number | 20 | Items per page |
| sort | string | "createdAt" | Sort field |

**Response:**
```json
{
  "data": [
    { "id": "user-1", "name": "Alice", "email": "alice@example.com" }
  ],
  "meta": { "page": 1, "limit": 20, "total": 100 }
}
```

#### GET /users/:id
Get a single user by ID.

#### POST /users
Create a new user.

#### PATCH /users/:id
Update user fields.

#### DELETE /users/:id
Delete a user.

---

> Copy the pattern above for each resource in your API.
