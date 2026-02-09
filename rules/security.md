# Security Rules

## Mandatory Checks

Before marking any code as complete, verify these items:

### Input Validation
- [ ] All user inputs are validated (type, length, format)
- [ ] Query parameters and path parameters are sanitized
- [ ] File uploads are validated (type, size, content)
- [ ] JSON request bodies are validated against a schema

### Injection Prevention
- [ ] SQL queries use parameterized statements (never string concatenation)
- [ ] Shell commands use safe APIs (never pass user input to exec/system)
- [ ] HTML output is properly escaped to prevent XSS
- [ ] LDAP, XML, and other query languages use safe construction methods

### Authentication & Authorization
- [ ] All endpoints verify authentication
- [ ] Authorization checks enforce least-privilege access
- [ ] Passwords are hashed with bcrypt/argon2 (never MD5/SHA for passwords)
- [ ] Session tokens are cryptographically random and sufficiently long
- [ ] JWT tokens have appropriate expiration and are validated properly

### Secrets Management
- [ ] No hardcoded secrets, API keys, or passwords in source code
- [ ] Secrets are loaded from environment variables or a secrets manager
- [ ] `.env` files are in `.gitignore`
- [ ] No secrets in commit messages, comments, or logs

### Data Protection
- [ ] Sensitive data is encrypted at rest and in transit
- [ ] PII is handled according to data protection policies
- [ ] Logs do not contain sensitive data (passwords, tokens, PII)
- [ ] Error messages do not leak internal details to users

### Dependencies
- [ ] No known vulnerable dependencies
- [ ] Dependencies are pinned to specific versions
- [ ] New dependencies are reviewed for trustworthiness and maintenance status

## Common Vulnerability Patterns

### XSS (Cross-Site Scripting)
```
// BAD
element.innerHTML = userInput;

// GOOD
element.textContent = userInput;
```

### SQL Injection
```
// BAD
db.query(`SELECT * FROM users WHERE id = ${userId}`);

// GOOD
db.query("SELECT * FROM users WHERE id = $1", [userId]);
```

### Command Injection
```
// BAD
exec(`convert ${filename} output.png`);

// GOOD
execFile("convert", [filename, "output.png"]);
```

### Path Traversal
```
// BAD
fs.readFile(`./uploads/${userFilename}`);

// GOOD
const safePath = path.resolve("./uploads", userFilename);
if (!safePath.startsWith(path.resolve("./uploads"))) throw new Error("Invalid path");
fs.readFile(safePath);
```

## Reporting
If a security issue is found during review, it MUST be:
1. Flagged as HIGH severity
2. Fixed before the task is marked complete
3. A test added to prevent regression
