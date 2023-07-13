# git-migration

Script to migrate a repository from one git platform/vendor to another one.

## Usage
1. Configure your access to both platforms
1. Create a empty repository at the target platform
1. Execute the migrate-repository.sh script with these parameters 'source-repo' 'clone-dir' 'target-repo'

### Example
- Source repo: git@github.com:spasqualino/k6-template.git
- Local clone directory: 'k6-template-migration-dir'
- Target repo: git@bitbucket.org:userxpto/k6-template.git

Command-line:
```
migrate-repository.sh git@github.com:spasqualino/k6-template.git k6-template-migration-dir git@bitbucket.org:userxpto/k6-template.git
```