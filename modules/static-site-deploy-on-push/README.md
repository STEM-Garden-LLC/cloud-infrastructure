This module requires both AWS and GitHub providers. It creates:

- GitHub Repository where I will develop a React App using the Vite build system. 

- GitHub Actions workflow which builds tha app when changes are pushed to main. 

- GitHub Actions Secrets and variables required to push the build output to AWS.

- S3 bucket to push build files to. 