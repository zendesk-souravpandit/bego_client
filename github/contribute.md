# Contributing to Bego Client

Thank you for your interest in contributing to Bego Client! This guide will help you get started with the development workflow.

## Table of Contents

- [Initial Setup](#initial-setup)
- [Creating a Contribution Branch](#creating-a-contribution-branch)
- [Making Changes](#making-changes)
- [Updating Your Branch](#updating-your-branch)
- [Committing Changes](#committing-changes)
- [Pushing Changes](#pushing-changes)
- [Creating a Pull Request](#creating-a-pull-request)
- [Syncing After Merge](#syncing-after-merge)

## Initial Setup

### 1. Fork the Repository

Fork the repository on GitHub: https://github.com/BusinessOcean/bego_client

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_USERNAME/bego_client.git
cd bego_client
```

### 3. Add Upstream Remote

```bash
git remote add upstream https://github.com/BusinessOcean/bego_client.git
```

### 4. Verify Remotes

```bash
git remote -v
```

You should see:

- `origin` pointing to your fork
- `upstream` pointing to the main repository

## Creating a Contribution Branch

### 1. Update Main Branch First

```bash
git fetch upstream
git rebase upstream/main
git push origin main --force-with-lease
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

**Branch naming conventions:**

- `feature/description` - for new features
- `fix/description` - for bug fixes
- `docs/description` - for documentation updates
- `refactor/description` - for code refactoring

Example:

```bash
git checkout -b feature/add-custom-widget
```

## Making Changes

### 1. Make Your Code Changes

Edit the necessary files in your editor.

### 2. Verify Your Changes

```bash
# Check git status
git status

# View changes
git diff

# View changes in staging area
git diff --staged
```

### 3. Run Tests (if applicable)

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test_file.dart
```

### 4. Format Code

```bash
# Format all Dart files
dart format .

# Format specific file
dart format lib/your_file.dart
```

### 5. Analyze Code

```bash
# Analyze the project
dart analyze

# Or use flutter analyze
flutter analyze
```

## Updating Your Branch

Before committing, always update your branch from upstream to avoid conflicts:

### Option 1: Rebase (Preferred)

```bash
git fetch upstream
git rebase upstream/main
```

If there are conflicts:

```bash
# Fix conflicts in your editor
# After fixing, continue rebase
git rebase --continue

# If you want to abort
git rebase --abort
```

### Option 2: Merge

```bash
git fetch upstream
git merge upstream/main
```

## Committing Changes

### 1. Stage Your Changes

```bash
# Stage all changes
git add .

# Stage specific files
git add path/to/file1 path/to/file2

# Stage specific parts of a file (interactive)
git add -p
```

### 2. Commit with Meaningful Message

```bash
git commit -m "feat: add custom app bar component"
```

**Commit message format:**

- `feat:` - new feature
- `fix:` - bug fix
- `docs:` - documentation
- `style:` - formatting changes
- `refactor:` - code refactoring
- `test:` - adding/updating tests
- `chore:` - maintenance tasks

### 3. Verify Commits

```bash
git log --oneline -n 5
```

## Pushing Changes

### 1. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 2. First Time Push

```bash
git push -u origin feature/your-feature-name
```

### 3. After Rebase (Force Push Safely)

```bash
git push origin feature/your-feature-name --force-with-lease
```

**Note:** Use `--force-with-lease` instead of `--force` for safety.

## Creating a Pull Request

### 1. Go to GitHub

Visit: https://github.com/BusinessOcean/bego_client

### 2. Create PR

- Click "Pull Requests" tab
- Click "New Pull Request"
- Click "compare across forks"
- Set:
  - Base repository: `BusinessOcean/bego_client` (main branch)
  - Head repository: `YOUR_USERNAME/bego_client` (your-feature-branch)

### 3. Fill PR Details

- **Title:** Concise description of changes
- **Description:** Detailed explanation of what and why
- **Related Issues:** Link any relevant issues (#123)
- **Screenshots/Videos:** If applicable (for UI changes)

### 4. Submit PR

Click "Create pull request"

## Syncing After Merge

### After Your PR is Merged

#### Update Your Local Main

```bash
git fetch upstream
git rebase upstream/main
git push origin main --force-with-lease
```

#### Or Use the Shortcut Command

```bash
git fetch upstream && git rebase upstream/main && git push origin main --force-with-lease
```

#### Delete Local Feature Branch

```bash
git branch -d feature/your-feature-name
```

#### Delete Remote Feature Branch

```bash
git push origin --delete feature/your-feature-name
```

## Workflow Summary

1. **Setup** (first time only)

   ```bash
   git clone https://github.com/YOUR_USERNAME/bego_client.git
   git remote add upstream https://github.com/BusinessOcean/bego_client.git
   ```

2. **Start New Work**

   ```bash
   git fetch upstream && git rebase upstream/main
   git checkout -b feature/your-feature
   ```

3. **Make Changes**

   ```bash
   # Edit files
   dart format .
   dart analyze
   flutter test
   ```

4. **Commit and Push**

   ```bash
   git add .
   git commit -m "feat: your message"
   git push -u origin feature/your-feature
   ```

5. **Create PR** on GitHub

6. **After Merge**
   ```bash
   git fetch upstream && git rebase upstream/main && git push origin main --force-with-lease
   ```

## Useful Commands Reference

```bash
# Check current branch
git branch

# List all branches (local and remote)
git branch -a

# View commit history
git log --oneline -n 10

# View changes in staging area
git diff --staged

# Undo unstaged changes
git checkout -- file_name

# Undo staged changes
git reset HEAD file_name

# Amend last commit
git commit --amend

# View branch tracking
git branch -vv

# Switch branches
git checkout branch_name

# Create and switch to new branch
git checkout -b new_branch_name

# Delete branch
git branch -d branch_name

# Force delete branch
git branch -D branch_name
```

## Getting Help

- Check existing issues: https://github.com/BusinessOcean/bego_client/issues
- Review pull requests: https://github.com/BusinessOcean/bego_client/pulls
- Read the main README: Check the repository root for project-specific guidelines

## Code of Conduct

Please be respectful and professional in all interactions. We're committed to providing a welcoming and inclusive environment for all contributors.

---

Happy contributing! 🎉
